<?php

class Person
{
  private $tablename = 'persons';
  private $model = false;

  public function __construct()
  { }

  private function model()
  {
    if ($this->model === false) return $this->model = new Model($this->tablename);
    return $this->model;
  }

  ////////////////////////////////
  function getAll()
  {
    $obj = $this->model();
    return ['status' => 'success', 'data' => $obj->getListBy([], ['deleted' => 1])];
  }


  function add($args)
  {
    if (!isset($args['name'],
    $args['contactperson'],
    $args['cin'],
    $args['city'],
    $args['country'],
    $args['email'],
    $args['gstin'],
    $args['gsttype'],
    $args['mobile'],
    $args['pincode'],
    $args['state'],
    $args['street'],
    $args['tel'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $args['name'] = ucwords($args['name']);
    $args['contactperson'] = ucwords($args['contactperson']);
    $args['city'] = ucwords($args['city']);
    $args['country'] = ucwords($args['country']);
    $args['email'] = strtolower($args['email']);

    $obj = $this->model();
    // $count = $obj->getListBy(['sku' => $args['sku']]);
    // if (count($count) > 0) {
    //   return ['status' => 'error', 'msg' => 'This code/sku already exist', 'data' => $count];
    // }

    $args['created_datetime'] = date('Y-m-d h-i-s');

    $insertData = $obj->insert($args);
    if ($insertData === false) {
      return ['status' => 'error', 'msg' => 'Error in insert company/person', 'sql' => $obj->db->sql];
    }

    return ['status' => 'success', 'msg' => 'Successfully Inserted', 'data' => $insertData];
  }

  function update($args)
  {
    if (!isset($args['id'],
    $args['name'],
    $args['contactperson'],
    $args['cin'],
    $args['city'],
    $args['country'],
    $args['email'],
    $args['gstin'],
    $args['gsttype'],
    $args['mobile'],
    $args['pincode'],
    $args['state'],
    $args['street'],
    $args['tel'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $args['name'] = ucwords($args['name']);
    $args['contactperson'] = ucwords($args['contactperson']);
    $args['city'] = ucwords($args['city']);
    $args['country'] = ucwords($args['country']);
    $args['email'] = strtolower($args['email']);

    $obj = $this->model();

    $insertData = $obj->updateByMeta($args, ['id' => $args['id']]);
    if ($insertData === false) {
      return ['status' => 'error', 'msg' => 'Error in insert product'];
    }

    return ['status' => 'success', 'msg' => 'Successfully Updated', 'data' => $insertData];
  }

  function delete($args)
  {
    if (!isset($args['id'],
    $args['name'],
    $args['contactperson'],
    $args['cin'],
    $args['city'],
    $args['country'],
    $args['email'],
    $args['gstin'],
    $args['gsttype'],
    $args['mobile'],
    $args['pincode'],
    $args['state'],
    $args['street'],
    $args['tel'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $args['name'] = ucwords($args['name']);
    $args['contactperson'] = ucwords($args['contactperson']);
    $args['city'] = ucwords($args['city']);
    $args['country'] = ucwords($args['country']);
    $args['email'] = strtolower($args['email']);

    $obj = $this->model();

    $insertData = $obj->updateByMeta(['deleted' => 1], ['id' => $args['id']]);
    if ($insertData === false) {
      return ['status' => 'error', 'msg' => 'Error in delete person', 'sql' => $obj->db->sql];
    }

    return ['status' => 'success', 'msg' => 'Successfully Deleted', 'data' => $insertData];
  }

  //////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////

  function getAllCategories()
  {
    $this->model = new Model('product_category');
    return ['status' => 'success', 'data' => $this->model->getListBy([], ['deleted' => 1])];
  }

  function addCategory($args)
  {
    if (!isset($args['parent_id'], $args['name'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $this->model = new Model('product_category');
    $name = ucwords(strtolower(preg_replace("/[^a-zA-Z0-9 ]+/", "", $args['name'])));
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $name)));
    $parent_id = $args['parent_id'];

    $count = $this->model->getListBy(['slug' => $slug]);
    if (count($count) > 0) {
      return ['status' => 'error', 'msg' => 'This named category already exist', 'data' => $count];
    }

    $insertData = $this->model->insert(['name' => $name, 'slug' => $slug, 'parent_id' => $parent_id]);

    return ['status' => 'success', 'msg' => 'Successfully Inserted', 'data' => $insertData];
  }

  function updateCategories($args)
  {
    if (is_array($args)) {
      foreach ($args as $key => $value) {
        if (!isset($value['parent_id'], $value['id'], $value['name'])) {
          return ['status' => 'error', 'msg' => 'Please fill all fields'];
        }
      }
    }

    $this->model = new Model('product_category');

    $queries = [];
    $this->model->begin_transaction();
    $is_transaction_exe = true;

    foreach ($args as $key => $value) {
      $parent_id = $value['parent_id'];
      $id =  $value['id'];
      $name = ucwords(preg_replace("/[^a-zA-Z0-9 ]+/", "", $value['name']));
      $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $name)));

      $count = $this->model->getListBy(['slug' => $slug], ['id' => $id]);
      if (count($count) > 0) {
        $is_transaction_exe = false;
      } else {
        $queries[] = $this->model->updateByMeta(['parent_id' => $parent_id, 'name' => $name, 'slug' => $slug], ['id' => $id]);
      }
    }

    if ($is_transaction_exe === false) {
      $this->model->rollback();
      return ['status' => 'error', 'msg' => 'There is other category with same name'];
    }

    foreach ($queries as $qry) {
      if ($qry === false) {
        $this->model->rollback();
        return ['status' => 'error', 'msg' => 'Updation Problem, Please connect developer'];
      }
    }

    $this->model->commit();
    return ['status' => 'success', 'msg' => 'Successfully Updated', 'data' => $this->getListBy([], ['deleted' => 1])];
  }

  function deleteCategories($args)
  {

    if (!isset($args['parent_id'], $args['id'], $args['name'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $obj = new Model('product_category');

    $queries = [];
    $obj->begin_transaction();
    $is_transaction_exe = true;

    $updateChild = $obj->updateByMeta(['parent_id' => $args['parent_id']], ['parent_id' => $args['id']]);
    if ($updateChild == false) {
      $is_transaction_exe = false;
      $obj->rollback();
      return ['status' => 'error', 'msg' => 'Error While Deleting'];
    }

    $delete = $obj->updateByMeta(['deleted' => 1], ['id' => $args['id']]);
    if ($delete == false) {
      $is_transaction_exe = false;
      $obj->rollback();
      return ['status' => 'error', 'msg' => 'Error While Deleting'];
    }

    $obj->commit();
    return ['status' => 'success', 'msg' => 'Successfully Deleted', 'data' => $obj->getListBy([], ['deleted' => 1])];
  }

  //////////////////////////////////////
}
