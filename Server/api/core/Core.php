<?php
include_once(__DIR__.'/Optimizer.php');

include_once(__DIR__.'/traits/Element.php');
include_once(__DIR__.'/traits/Singleton.php');

include_once(__DIR__.'/DB.php');
include_once(__DIR__.'/Model.php');

include_once(__DIR__.'/RESTAPI.php');

$show_sql_error = true;
function error_sql($error)
{
    global $show_sql_error;
    if($show_sql_error === true)
    {
        throw new Exception($error);
    }
    throw new Exception("Database Error");
}