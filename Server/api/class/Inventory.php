<?php

class Inventory
{
  private $tablename = 'stock_log';
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
    $obj->db->sql = "SELECT * FROM `stock_log` WHERE `id` IN (SELECT  MAX(`id`) AS `maxid` FROM `stock_log` GROUP BY `product_id`)";

    $result = $obj->db->fetch_object();
    return ['status' => 'success', 'data' => $result];
  }

  function getStock($args)
  {
    if (!isset($args['product_id'],
    $args['product_sku'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $obj = $this->model();
    $obj->db->sql = "SELECT * FROM " . $this->tablename .
      " WHERE `product_id` = '" . $args['product_id'] . "' AND `product_sku` = '" . $args['product_sku'] .
      "' Order By `id` DESC Limit 1";

    $result = $obj->db->fetch_object();
    return $result;
  }

  function stockupdate($args)
  {
    if (!isset($args['warehouse_id'],
    $args['product_id'],
    $args['product_sku'],
    $args['change_in_quantity'],
    $args['total_quantity'],
    $args['meta_key'],
    $args['meta_value'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    $oldQty = $this->getStock($args);
    if (isset($oldQty[0]->total_quantity)) {
      // echo "" . $oldQty->total_quantity . " & " . $args['total_quantity'];
      if ($oldQty[0]->total_quantity == $args['total_quantity']) {
        return ['status' => 'error', 'msg' => 'Please change quanitity to update'];
      }
    }

    $obj = $this->model();

    $args['created_datetime'] = date('Y-m-d h-i-s');

    $insertData = $obj->insert($args);
    if ($insertData === false) {
      return ['status' => 'error', 'msg' => 'Error in insert Stock Update', 'sql' => $obj->db->sql];
    }

    return ['status' => 'success', 'msg' => 'Successfully Inserted', 'data' => $insertData];
  }


  function stockIn($args)
  {

    if (!isset($args['warehouse_id'],
    $args['product_id'],
    $args['product_sku'],
    $args['change_in_quantity'],
    $args['total_quantity'],
    $args['meta_key'],
    $args['meta_value'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    if ($args['change_in_quantity'] < 1) {
      return ['status' => 'error', 'msg' => 'Quantity must be greater than zero'];
    }

    $oldStock = $this->getStock($args);
    if (isset($oldStock[0]->total_quantity)) {
      // echo "" . $oldQty->total_quantity . " & " . $args['total_quantity'];
      $args['total_quantity'] = $oldStock[0]->total_quantity + $args['change_in_quantity'];
    } else {
      $args['total_quantity'] = $args['change_in_quantity'];
    }

    $obj = $this->model();

    $args['created_datetime'] = date('Y-m-d h-i-s');

    $insertData = $obj->insert($args);
    if ($insertData === false) {
      return ['status' => 'error', 'msg' => 'Error in insert Stock Update', 'sql' => $obj->db->sql];
    }

    return ['status' => 'success', 'msg' => 'Successfully Inserted', 'data' => $insertData];
  }

  function stockOut($args)
  {

    if (!isset($args['warehouse_id'],
    $args['product_id'],
    $args['product_sku'],
    $args['change_in_quantity'],
    $args['total_quantity'],
    $args['meta_key'],
    $args['meta_value'])) {
      return ['status' => 'error', 'msg' => 'Please fill all fields'];
    }

    if ($args['change_in_quantity'] < 1) {
      return ['status' => 'error', 'msg' => 'Quantity must be greater than zero'];
    }

    $oldStock = $this->getStock($args);
    if (isset($oldStock[0]->total_quantity)) {
      // echo "" . $oldQty->total_quantity . " & " . $args['total_quantity'];
      $args['total_quantity'] = $oldStock[0]->total_quantity - $args['change_in_quantity'];
    } else {
      return ['status' => 'error', 'msg' => 'Available Quantity is less than demand'];
    }

    if ($args['total_quantity'] < 0) {
      return ['status' => 'error', 'msg' => 'Available Quantity is less than demand'];
    }

    $obj = $this->model();

    $args['created_datetime'] = date('Y-m-d h-i-s');
    $args['change_in_quantity'] = -1 * $args['change_in_quantity'];
    $insertData = $obj->insert($args);
    if ($insertData === false) {
      return ['status' => 'error', 'msg' => 'Error in insert Stock Update', 'sql' => $obj->db->sql];
    }

    return ['status' => 'success', 'msg' => 'Successfully Inserted', 'data' => $insertData];
  }



  //////////////////////////////////////
}
