<?php
class Purchase
{
    public $add_fields = [
        'bill_to', 'contact_number',
        'contact_person', 'created_by',
        'delivery_date', 'delivery_terms', 'description',
        'gst_type',  'items', 'person_id', 'name', 'payment_terms', 'quotation_ref', 'ship_to', 'ship_via', 'type'
    ];
    public $object = 'purchase';
    public $model = 'purchases';
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
