<?php

class StockCheck
{
  private $tablename = 'dummyorders';
  private $model = false;

  public function __construct()
  { }

  private function model()
  {
    if ($this->model === false) return $this->model = new Model($this->tablename);
    return $this->model;
  }

  ////////////////////////////////
  function allOrdersItems()
  {
    $obj = $this->model();
    $obj->db->sql = "SELECT *, sum(quantity) As qty FROM `dummyorder_items` GROUP BY `product_id`";

    $result = $obj->db->fetch_object();
    return ['status' => 'success', 'data' => $result];
  }

  //////////////////////////////////////
}
