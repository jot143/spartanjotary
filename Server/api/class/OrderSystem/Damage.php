<?php
class Damage
{
    public $add_fields = ['description', 'items', 'created_by'];
    public $object = 'damage';
    public $model = 'damages';
    public $model_child;
    public $model_id;
    public $inventryFn = 'stockOut';
    public $inventryReverseFn = 'stockInReverse';

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
