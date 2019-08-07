<?php
trait Element{    
    function setVariable($key, $value){
        $this->$key = $value;
    }
    
    function setArgs(array $args) {
        foreach($args as $key => $value){
            $this->setVariable($key,$value);
        }
    }
}