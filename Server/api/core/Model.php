<?php

class Model
{
  use element;
  public $db;
  public $sql;

  public function __construct($tablename, $db = false)
  {
    if ($db === false) {
      global $db;
    }

    $this->db = &$db;
    $this->tablename = $tablename;
    $this->model = null;
  }

  public function getModel()
  {
    $data = [];
    $results = $this->getTableColumn();
    foreach ($results as $result) {
      $name = $result->Field;
      $this->$name = null;
      $data[$name] = $result;
    }

    $this->model = $data;
  }

  public function getTableColumn()
  {
    $this->db->sql = "DESCRIBE $this->tablename";
    return $this->db->fetch_object();
  }

  public function begin_transaction()
  {
    return $this->db->conn->begin_transaction();
  }

  public function rollback()
  {
    return $this->db->conn->rollback();
  }

  public function commit()
  {
    return $this->db->conn->commit();
  }

  public function getAll()
  {
    $this->db->sql = "SELECT * FROM `$this->tablename` Order By `id` Desc";
    return $this->db->fetch_object();
  }


  // Select Queries
  public function getSelf($id)
  {
    //$id = $this->model->id
    $this->db->sql = "SELECT * FROM `$this->tablename` WHERE `id` = $id LIMIT 1";
    $result = $this->db->fetch_object();
    if (count($result) > 0) {
      foreach ($result[0] as $key => $value) {
        $this->$key = $value;
      }

      return $result[0];
    }

    return false;
  }

  public function getSelfBy($data)
  {
    $where = ' WHERE ';
    foreach ($data as $key => $value) {
      $where .= ' `' . $key . "` = '" . $value . "' AND";
    }
    $where = substr($where, 0, -3);
    $this->db->sql = "SELECT * FROM `$this->tablename` " . $where . ' Limit 1';
    $result = $this->db->fetch_object();

    if (count($result) > 0) {
      foreach ($result[0] as $key => $value) {
        $this->$key = $value;
      }

      return $result;
    }

    return false;
  }

  public function getListBy($data, $notData = [])
  {
    $where = ' WHERE ';
    foreach ($data as $key => $value) {
      $where .= ' `' . $key . "` = '" . $value . "' AND";
    }

    foreach ($notData as $key => $value) {
      $where .= ' `' . $key . "` != '" . $value . "' AND";
    }

    $where = substr($where, 0, -3);
    $this->db->sql = "SELECT * FROM `$this->tablename` " . $where;
    $result = $this->db->fetch_object();

    return $result;
  }



  // Insert Queries

  public function insert($data)
  {
    $this->db->insert($this->tablename, $data);
    $res = $this->db->execute();
    if (is_int($res)) {
      return $this->db->insert_id();
    } else {
      return false;
    }
  }

  public function createUpdate($data)
  {
    $this->db->insertorupdate($this->tablename, $data);
    if ($this->db->execute() == 0) {
      return $this->db->insert_id();
    } else {
      return $this->db->insert_id();
    }
  }




  // Update Queries

  public function updateMe($data)
  {
    if (isset($this->id)) {
      $set = ' SET ';
      foreach ($data as $key => $value) {
        $set .= ' `' . $key . "` = '" . $value . "' ,";
      }
      $set = substr($set, 0, -1);

      $this->db->sql = "UPDATE `$this->tablename` $set WHERE `id` = $this->id LIMIT 1";
      $result = $this->db->execute();
      if (is_int($result)) {
        return true;
      }

      return false;
    }
    throw new Exception("$this->tablename not define itself");
  }

  public function updateByMeta($data, $whereAry)
  {
    $set = ' SET ';
    foreach ($data as $key => $value) {
      $set .= ' `' . $key . "` = '" . $value . "' ,";
    }
    $set = substr($set, 0, -1);

    $where = ' WHERE ';
    foreach ($whereAry as $key => $value) {
      $where .= ' `' . $key . "` = '" . $value . "' AND";
    }
    $where = substr($where, 0, -3);

    $this->db->sql = "UPDATE `$this->tablename` $set $where";
    $result = $this->db->execute();
    if (is_int($result)) {
      if ($result > 0) {
        return true;
      }
    }

    return false;
  }


  // Delete Quries
  public function deleteMe()
  {
    if (isset($this->id)) {
      $this->db->sql = "DELETE FROM `$this->tablename` WHERE `id` = $this->id LIMIT 1";
      $result = $this->db->execute();
      if ($result > 0) {
        return true;
      }

      return false;
    }
    throw new Exception("$this->tablename not define itself");
  }

  public function deleteByMeta($whereAry)
  {
    $where = ' WHERE ';
    foreach ($whereAry as $key => $value) {
      $where .= ' `' . $key . "` = '" . $value . "' AND";
    }
    $where = substr($where, 0, -3);
    $this->db->sql = "DELETE FROM `$this->tablename` $where";
    $result = $this->db->execute();
    if ($result > 0) {
      return true;
    }
    return false;
  }



  // Metas

  public function update_meta($data, $by, $unique = true)
  {
    if ($this->getSelfBy($by) && $unique == true) {
      return $this->updateMe($data);
    } else {
      $data = array_merge($data, $by);

      return $this->insert($data);
    }
  }


  public function addmetas(&$parent, $metas)
  {
    for ($i = 0; $i < count($metas); ++$i) {
      $key = $metas[$i]->meta_key;

      if (isset($parent->$key) && empty($parent->$key) === false) {
        if (is_array($parent->$key)) {
          array_push($parent->$key, array('id' => $metas[$i]->id, 'meta_value' => $metas[$i]->meta_value,));
        } else {
          $parent->$key = [];

          for ($j = 0; $j < $i; ++$j) {
            if ($metas[$j]->meta_key == $key) {
              array_push($parent->$key, array('id' => $metas[$j]->id, 'meta_value' => $metas[$j]->meta_value,));
            }
          }

          array_push($parent->$key, array('id' => $metas[$i]->id, 'meta_value' => $metas[$i]->meta_value,));
        }
      } else {
        $parent->$key = $metas[$i]->meta_value;
      }
    }
  }

  public function joinListWithMeta($tablename, $parents)
  {
    $ary = [];

    $table = new Model($this->db, $tablename);

    foreach ($parents as $parent) {
      $data = array('meta_id' => $parent->id);

      $metas = $table->getListBy($data);

      $this->addmetas($parent, $metas);

      $ary[] = $parent;
    }

    return $ary;
  }
}
