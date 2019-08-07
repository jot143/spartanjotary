<?php
function reply($message, $status = 'error',  $data = false)
{
    return ['status' => $status, 'message' => $message, 'data' => $data];
}
