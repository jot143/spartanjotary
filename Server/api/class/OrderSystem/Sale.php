<?php
class Sale
{
    public $add_fields = [
        'items',
        'type', 'person_id', 'name', 'quotation_ref',  'purchase_ref',
        'gst_type', 'bill_to', 'ship_to', 'ship_via',
        'transport_mode', 'delivery_date', 'gr_no', 'gr_date',
        'contact_number', 'contact_person', 'description', 'cases', 'discount_percent', 'created_by'
    ];
    public $object = 'sale';
    public $model = 'sales';
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
