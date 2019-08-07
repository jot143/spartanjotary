<?php
class Challanin
{
    public $add_fields = ['type', 'person_id', 'name', 'cases', 'description', 'items', 'created_by'];
    public $object = 'challanin';
    public $model = 'challanins';
    public $model_child;
    public $model_id;
    public $inventryFn = 'stockIn';
    public $inventryReverseFn = 'stockOutReverse';
    function __construct()
    {
        $this->model_child = function ($str) {
            return $this->object . '_' . $str;
        };
        $this->model_id = function () {
            return $this->object . '_id';
        };
    }

    function __call($method, $args)
    {
        if (isset($this->$method) && $this->$method instanceof \Closure) {
            return call_user_func_array($this->$method, $args);
        }

        trigger_error("Call to undefined method " . get_called_class() . '::' . $method, E_USER_ERROR);
    }
}
