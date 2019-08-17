<?php

class Reports
{
  public $pfromdate;
  public $ptodate;
  public $fromdate;
  public $todate;

  function getDates()
  {
    if (isset($_GET['fromdate'])) {
      $fromdate = $_GET['fromdate'];
      $this->fromdate = date('Y-m-d h:m:s', strtotime($fromdate));
    } else {
      //$fromdate = '2000-01-01 00:00:00';
      if (date('Y-m-d') < date('Y-m-d', strtotime(date('Y' . '-03-31')))) {
        $this->fromdate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31' . '-1 year'));
      } else {
        $this->fromdate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31'));
      }
    }

    if (isset($_GET['todate'])) {
      $todate = $_GET['todate'];
      //echo $todate = date('Y-m-d h:m:s',$todate);
      $this->todate = date_format(date_create($todate), 'Y-m-d H:i:s');
    } else {
      $this->todate = date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s') . ' +1 day'));
    }
  }

  function getCompareDates()
  {

    if (isset($_GET['pfromdate'])) {
      $pfromdate = $_GET['pfromdate'];
      $this->pfromdate = date('Y-m-d h:m:s', strtotime($pfromdate));
      // print_r($this->pfromdate);
      // die();
    } else {
      //$pfromdate = date('Y-m-d H:i:s', strtotime(date('Y', strtotime('-1 year')).'-04-01'));
      if (date('Y-m-d') < date('Y-m-d', strtotime(date('Y' . '-03-31')))) {
        $this->pfromdate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31' . '-2 year'));
      } else {
        $this->pfromdate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31'));
      }
    }

    if (isset($_GET['ptodate'])) {
      $ptodate = $_GET['ptodate'];
      //echo $todate = date('Y-m-d h:m:s',$todate);
      $this->ptodate = date_format(date_create($ptodate), 'Y-m-d H:i:s');
    } else {
      //$ptodate = date('Y-m-d H:i:s', strtotime(date('Y', strtotime('0 year')).'-03-31'));
      if (date('Y-m-d') < date('Y-m-d', strtotime(date('Y' . '-03-31')))) {
        $this->ptodate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31' . '-1 year'));
      } else {
        $this->ptodate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31'));
      }
    }

    if (isset($_GET['fromdate'])) {
      $fromdate = $_GET['fromdate'];
      $this->fromdate = date('Y-m-d h:m:s', strtotime($fromdate));
    } else {
      //$fromdate =  date("Y-m-d H:i:s", strtotime(date('Y')."-04-01") );
      if (date('Y-m-d') < date('Y-m-d', strtotime(date('Y' . '-03-31')))) {
        $fromdate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31' . '-1 year'));
      } else {
        $this->fromdate = date('Y-m-d H:i:s', strtotime(date('Y') . '-03-31'));
      }
    }

    if (isset($_GET['todate'])) {
      $todate = $_GET['todate'];
      //echo $todate = date('Y-m-d h:m:s',$todate);
      $this->todate = date_format(date_create($todate), 'Y-m-d H:i:s');
    } else {
      $this->todate = date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s') . ' +1 day'));
    }
  }

  function salereport()
  {
    $this->getDates();
    $BuyerReport = [];
    global $db;
    $db->sql = "SELECT * FROM `persons`";
    $buyersql = $db->query();
    if ($buyersql->num_rows > 0) {
      while ($buyer = $buyersql->fetch_object()) {
        $br = [];
        $saleorder = [];
        $db->sql = "SELECT *
                    FROM `sales`
                    WHERE `sales`.`status` != 'deleted' AND
                    `sales`.`created_datetime` >= '$this->fromdate'
                    AND `sales`.`created_datetime` <= '$this->todate' AND `person_id` = '$buyer->id'";
        $saleorderqry = $db->query();

        if ($saleorderqry->num_rows > 0) {
          $br['buyer'] = $buyer;
          $br['items'] = [];
          $items = [];
          while ($saleorder = $saleorderqry->fetch_object()) {
            //print_r($saleorder);echo "<br/>";
            $db->sql = "SELECT * FROM `sale_items`
                        INNER JOIN `products` ON `sale_items`.`product_id` = `products`.`id`
                        WHERE `sale_id` = $saleorder->id";
            //echo "<br/>";
            $itemsqry = $db->query();

            if ($itemsqry->num_rows > 0) {
              while ($itemsrow = $itemsqry->fetch_object()) {
                if (isset($items[$itemsrow->product_id])) {
                  $items[$itemsrow->product_id]['amount'] += $itemsrow->price * $itemsrow->quantity;
                  $items[$itemsrow->product_id]['price'] = $itemsrow->price;
                  $items[$itemsrow->product_id]['quantity'] += $itemsrow->quantity;
                } else {
                  $items[$itemsrow->product_id]['product_name'] = $itemsrow->name;
                  $items[$itemsrow->product_id]['product_sku'] = $itemsrow->sku;
                  $items[$itemsrow->product_id]['product_color'] = $itemsrow->color;
                  $items[$itemsrow->product_id]['product_size'] = $itemsrow->size;
                  $items[$itemsrow->product_id]['price'] = $itemsrow->price;
                  $items[$itemsrow->product_id]['amount'] = $itemsrow->price * $itemsrow->quantity;
                  $items[$itemsrow->product_id]['quantity'] = $itemsrow->quantity;
                }
              }
            }
          }
          $br['items'] = $items;
          $BuyerReport[] = $br;
        }
      }
    }

    return ['status' => 'success',  'data' => $BuyerReport];
  }

  function compilesalereport()
  {
    $this->getDates();
    global $db;
    $BuyerReport = [];
    $db->sql = 'SELECT * FROM `persons`';
    $buyersql = $db->query();
    if ($buyersql->num_rows > 0) {
      while ($buyer = $buyersql->fetch_object()) {
        $br = [];
        $db->sql = "SELECT sum(`sale_items`.`quantity` * `sale_items`.`price`) AS `amount`,
                       sum(`sale_items`.`quantity`) AS `item_qty`
                FROM `sale_items`
                WHERE `sale_items`.`sale_id` IN (SELECT `id` FROM `sales` WHERE `person_id` = $buyer->id
                AND `sales`.`status` != 'deleted'
                AND `created_datetime` >= '" . $this->fromdate . "'
                AND `created_datetime` <= '" . $this->todate . "' )";
        //echo $sql;
        $saleorderqry = $db->query();

        if ($saleorderqry->num_rows > 0) {
          $row = $saleorderqry->fetch_object();
          if ($row->amount != null) {
            $br['buyer'] = $buyer;
            $br['amount'] = $row->amount;
            $br['item_qty'] = $row->item_qty;
            $br['fromdate'] = $this->fromdate;
            $br['todate'] = $this->todate;
            $br['seller_id'] = $buyer->id;

            $BuyerReport[] = $br;
          }
        }
      }
    }
    return ['status' => 'success',  'data' => $BuyerReport];
  }

  function comparesalereport()
  {
    $this->getcompareDates();
    global $db;
    $BuyerReport = [];
    $db->sql = 'SELECT * FROM `persons`';
    $buyersql = $db->query();
    if ($buyersql->num_rows > 0) {
      while ($buyer = $buyersql->fetch_object()) {
        $br = [];

        // previous
        $db->sql = "SELECT sum(`sale_items`.`quantity` * `sale_items`.`price`) AS `amount`,
                       sum(`sale_items`.`quantity`) AS `item_qty`
                FROM `sale_items`
                WHERE `sale_items`.`sale_id` IN
                (SELECT `id` FROM `sales` WHERE `person_id` = $buyer->id
                AND `sales`.`status` != 'deleted'
                AND `created_datetime` >= '" . $this->pfromdate . "'
                AND `created_datetime` <= '" . $this->ptodate . "' )";
        //echo $sql;
        $saleorderqry = $db->query();

        $br['pfromdate'] = $this->pfromdate;
        $br['ptodate'] = $this->ptodate;

        if ($saleorderqry->num_rows > 0) {
          $row = $saleorderqry->fetch_object();
          $br['buyer'] = $buyer;
          $br['pamount'] = $row->amount;
          $br['pitem_qty'] = $row->item_qty;
          $br['seller_id'] = $buyer->id;
        }

        // current

        $db->sql = "SELECT sum(`sale_items`.`quantity` * `sale_items`.`price`) AS `amount`,
                       sum(`sale_items`.`quantity`) AS `item_qty`
                FROM `sale_items`
                WHERE `sale_items`.`sale_id` IN
                (SELECT `id` FROM `sales` WHERE `person_id` = $buyer->id
                AND `sales`.`status` != 'deleted'
                AND `created_datetime` >= '" . $this->fromdate . "'
                AND `created_datetime` <= '" . $this->todate . "' )";
        //echo $sql;
        $saleorderqry = $db->query();

        $br['fromdate'] = $this->fromdate;
        $br['todate'] = $this->todate;

        if ($saleorderqry->num_rows > 0) {
          $row = $saleorderqry->fetch_object();
          $br['buyer'] = $buyer;
          $br['amount'] = $row->amount;
          $br['item_qty'] = $row->item_qty;
          $br['seller_id'] = $buyer->id;
        }

        $BuyerReport[] = $br;
      }
    }
    return ['status' => 'success',  'data' => $BuyerReport];
  }
}
