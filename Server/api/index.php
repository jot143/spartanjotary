<?php
header('Access-Control-Allow-Origin: *');
// error_reporting(E_ALL);
// ini_set('display_errors', "On");

// header('Access-Control-Allow-Origin : *');
// // header('Access-Control-Allow-Methods : POST, GET, OPTIONS, PUT, DELETE');
// if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
//   header("HTTP/1.1 200 OK");
//   die();
// }


$starttime = microtime(true);

require_once(__DIR__ . '/define.php');


date_default_timezone_set('Asia/Kolkata');


spl_autoload_register('myAutoloader');
function myAutoloader($className)
{
  if (file_exists(__DIR__ . '/class/' . $className . '.php')) {
    include_once __DIR__ . '/class/' . $className . '.php';
    return;
  }
}



foreach (glob('global/*.php') as $filename) {
  include_once $filename;
}

include_once(__DIR__ . '/core/Core.php');

$db = (new DB())->connect($database['host'], $database['user'], $database['password'], $database['database']);

$restapi = new RESTAPI();
$restapi->getRequest();


// echo microtime(true) - $starttime;
