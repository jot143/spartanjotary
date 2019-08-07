<?php
spl_autoload_register(function ($className) {

  if (file_exists(__DIR__ . '/OrderSystem/' . $className . '.php')) {
    include_once __DIR__ . '/OrderSystem/' . $className . '.php';
    return;
  }
});

function is_req_fullfil($ary, $fields)
{
  $newAry = [];
  foreach ($fields as  $value) {
    if (isset($ary[$value])) {
      $newAry[$value] = $ary[$value];
    } else {
      print_r($value);
      die();
      return false;
    }
  }
  return $newAry;
}
class OrderSystem
{
  function add($args)
  {
    if (!isset($args['schema'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $class = ucfirst($args['schema']);
    if (class_exists($class)) {
      $obj = new $class();
    } else {
      return ['status' => 'error', 'msg' => 'Schema not exist'];
    }

    function create_insert_queries($newAry, $obj)
    {
      $queries['parent'] = [$obj->model => []];
      foreach ($newAry as $key => $value) {

        if (is_array($value)) {
          $queries['child'][$obj->model_child($key)] = $value;
        } else {
          $queries['parent'][$obj->model][$key] = $value;
        }
      }

      return $queries;
    }

    function queryexe($queries, $obj)
    {
      DB::$transaction['begin']();

      $insert_id = 0;
      foreach ($queries['parent'] as $modelName => $data) {
        $model = new Model($modelName);
        $data['created_datetime'] = date('Y-m-d h:i:s');
        $res = $model->insert($data);

        if ($res === false) {
          $error = $model->db->conn->error;
          DB::$transaction['rollback']();
          return ['status' => 'error', 'msg' => "Technical Error, Call to Developer", 'error' => $error];
        }
        $insert_id = $res;
      }

      foreach ($queries['child'] as $child => $rows) {
        if ($child == $obj->model_child('items')) {
          $model = new Model($child);
          foreach ($rows as $row) {
            $row[$obj->model_id()] = $insert_id;
            $res = $model->insert($row);
            if ($res === false) {
              $error = $model->db->conn->error;
              DB::$transaction['rollback']();
              return ['status' => 'error', 'msg' => "Technical Error, Call to Developer", 'error' => $error];
            }
          }
        }
      }

      DB::$transaction['commit']();

      return ['status' => 'success', 'msg' => 'Successfully Added'];
    }

    $newAry = is_req_fullfil($args, $obj->add_fields);
    if ($newAry === false) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }



    $queries = create_insert_queries($newAry, $obj);
    try {
      DB::$transaction['commit']();
      return queryexe($queries, $obj);
    } catch (Exception $e) {
      return ['status' => 'error', 'msg' => 'Technical Error, Call to Developer', 'error' => $e->getMessage()];
    }
  }

  function getAll($args)
  {
    if (!isset($args['schema'])) {
      return ['status' => 'error', 'msg' => 'Schema Not Set'];
    }

    $class = ucfirst($args['schema']);
    if (class_exists($class)) {
      $obj = new $class();
    } else {
      return ['status' => 'error', 'msg' => 'Schema not exist'];
    }

    $model = new Model($obj->model);

    return ['status' => 'success', 'data' => $model->getAll()];
  }

  function getItems($args)
  {
    if (!isset($args['schema'])) {
      return ['status' => 'error', 'msg' => 'Schema Not Set'];
    }

    $class = ucfirst($args['schema']);
    if (class_exists($class)) {
      $obj = new $class();
    } else {
      return ['status' => 'error', 'msg' => 'Schema not exist'];
    }

    $model = new Model($obj->model_child('items'));

    return ['status' => 'success', 'data' => $model->getListBy([$obj->model_id() => $args['id']])];
  }

  function stockIn($args)
  {
    if (!isset($args['id'], $args['schema'], $args['created_by'])) {
      return ['status' => 'error', 'msg' => 'Schema Not Set'];
    }

    $class = ucfirst($args['schema']);
    if (class_exists($class)) {
      $obj = new $class();
    } else {
      return ['status' => 'error', 'msg' => 'Schema not exist'];
    }

    DB::$transaction['begin']();

    $model = new Model($obj->model);
    $update = $model->updateByMeta(['status' => 'stockin'], ['id' =>  $args['id'], 'status' => 'init']);

    if ($update == false) {
      return ['status' => 'error', 'msg' => 'Update Status Failed'];
    }

    $model = new Model($obj->model_child('items'));
    $rows = $model->getListBy([$obj->model_id() => $args['id']]);

    if (count($rows) == 0) {
      return ['status' => 'error', 'msg' => 'No item exist'];
    }

    foreach ($rows as $row) {
      $arg['warehouse_id'] = 1;
      $arg['product_id'] = $row->product_id;
      $arg['product_sku'] = $row->product_sku;
      $arg['change_in_quantity'] = $row->quantity;
      $arg['total_quantity'] = 0;
      $arg['meta_key'] = $obj->object . '_add';
      $arg['meta_value'] = $row->id;
      $arg['created_by'] = $args['created_by'];
      $inventry = new Inventory;
      $inventryFn = $obj->inventryFn;
      $res = $inventry->$inventryFn($arg);
      if ($res['status'] === 'error') {
        DB::$transaction['rollback']();
        return $res;
      }
    }



    DB::$transaction['commit']();
    return ['status' => 'success', 'msg' => 'Successfully StockIn'];
  }


  function stockOut($args)
  {
    if (!isset($args['id'], $args['schema'], $args['created_by'])) {
      return ['status' => 'error', 'msg' => 'Schema Not Set'];
    }

    $class = ucfirst($args['schema']);
    if (class_exists($class)) {
      $obj = new $class();
    } else {
      return ['status' => 'error', 'msg' => 'Schema not exist'];
    }

    DB::$transaction['begin']();

    $model = new Model($obj->model);
    $update = $model->updateByMeta(['status' => 'stockout'], ['id' =>  $args['id'], 'status' => 'init']);

    if ($update == false) {
      return ['status' => 'error', 'msg' => 'Update Status Failed'];
    }

    $model = new Model($obj->model_child('items'));
    $rows = $model->getListBy([$obj->model_id() => $args['id']]);

    if (count($rows) == 0) {
      return ['status' => 'error', 'msg' => 'No item exist'];
    }

    foreach ($rows as $row) {
      $arg['warehouse_id'] = 1;
      $arg['product_id'] = $row->product_id;
      $arg['product_sku'] = $row->product_sku;
      $arg['change_in_quantity'] = $row->quantity;
      $arg['total_quantity'] = 0;
      $arg['meta_key'] = $obj->object . '_add';
      $arg['meta_value'] = $row->id;
      $arg['created_by'] = $args['created_by'];
      $inventry = new Inventory;
      $inventryFn = $obj->inventryFn;
      $res = $inventry->$inventryFn($arg);
      if ($res['status'] === 'error') {
        DB::$transaction['rollback']();
        return $res;
      }
    }



    DB::$transaction['commit']();
    return ['status' => 'success', 'msg' => 'Successfully StockOut'];
  }

  function delete($args)
  {
    if (!isset($args['id'], $args['schema'], $args['created_by'])) {
      return ['status' => 'error', 'msg' => 'Schema Not Set'];
    }

    $class = ucfirst($args['schema']);
    if (class_exists($class)) {
      $obj = new $class();
    } else {
      return ['status' => 'error', 'msg' => 'Schema not exist'];
    }

    $model = new Model($obj->model);
    $self = $model->getSelf($args['id']);
    if (!$self) {
      return ['status' => 'error', 'msg' => 'Not Exist'];
    }
    if ($self->status == 'init') {
      return $this->deleteHard($args['id'], $obj);
    }

    if ($self->status == 'stockin' || $self->status == 'stockout') {
      $fn = $obj->inventryReverseFn;
      return $this->$fn($args, $obj);
    }
  }

  function deleteHard($id, $obj)
  {
    $child = $obj->model_child('items');


    DB::$transaction['begin']();
    try {
      $modelChild = new Model($child);

      if (!$modelChild->deleteByMeta([$obj->model_id() => $id])) {
        DB::$transaction['rollback']();
      }

      $model = new Model($obj->model);
      if (!$model->deleteByMeta(['id' => $id])) {
        DB::$transaction['rollback']();
      }
    } catch (Exception $e) {
      return ['status' => 'error', 'msg' => 'Technical Error, Call to Developer', 'error' => $e->getMessage()];
    }

    DB::$transaction['commit']();
    return ['status' => 'success', 'msg' => 'Successfully Deleted'];
  }


  function stockOutReverse($args, $obj)
  {

    DB::$transaction['begin']();

    $model = new Model($obj->model);
    $update = $model->updateByMeta(['status' => 'deleted'], ['id' =>  $args['id'], 'status' => 'stockin']);

    if ($update == false) {
      return ['status' => 'error', 'msg' => 'Delete Status Failed'];
    }

    $model = new Model($obj->model_child('items'));
    $rows = $model->getListBy([$obj->model_id() =>  $args['id']]);

    if (count($rows) == 0) {
      return ['status' => 'error', 'msg' => 'No item exist'];
    }

    foreach ($rows as $row) {
      $arg['warehouse_id'] = 1;
      $arg['product_id'] = $row->product_id;
      $arg['product_sku'] = $row->product_sku;
      $arg['change_in_quantity'] = $row->quantity;
      $arg['total_quantity'] = 0;
      $arg['meta_key'] = $obj->object . '_reverse';
      $arg['meta_value'] = $row->id;
      $arg['created_by'] = $args['created_by'];
      $inventry = new Inventory;
      $res = $inventry->stockOut($arg);
      if ($res['status'] === 'error') {
        DB::$transaction['rollback']();
        return $res;
      }
    }

    DB::$transaction['commit']();
    return ['status' => 'success', 'msg' => 'Successfully Deleted'];
  }


  function stockInReverse($args, $obj)
  {

    DB::$transaction['begin']();

    $model = new Model($obj->model);
    $update = $model->updateByMeta(['status' => 'deleted'], ['id' =>  $args['id'], 'status' => 'stockout']);

    if ($update == false) {
      return ['status' => 'error', 'msg' => 'Delete Status Failed'];
    }

    $model = new Model($obj->model_child('items'));
    $rows = $model->getListBy([$obj->model_id() =>  $args['id']]);

    if (count($rows) == 0) {
      return ['status' => 'error', 'msg' => 'No item exist'];
    }

    foreach ($rows as $row) {
      $arg['warehouse_id'] = 1;
      $arg['product_id'] = $row->product_id;
      $arg['product_sku'] = $row->product_sku;
      $arg['change_in_quantity'] = $row->quantity;
      $arg['total_quantity'] = 0;
      $arg['meta_key'] = $obj->object . '_reverse';
      $arg['meta_value'] = $row->id;
      $arg['created_by'] = $args['created_by'];
      $inventry = new Inventory;
      $res = $inventry->stockIn($arg);
      if ($res['status'] === 'error') {
        DB::$transaction['rollback']();
        return $res;
      }
    }

    DB::$transaction['commit']();
    return ['status' => 'success', 'msg' => 'Successfully Deleted'];
  }
}
