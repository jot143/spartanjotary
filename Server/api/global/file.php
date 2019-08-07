<?php
function upload_file($file)
{
    global $file_upload_dir;
    $filename = uniqid() . $file['name'];
    $desPath = $file_upload_dir . $filename;
    $tmpfile = $file['tmp_name'];
    move_uploaded_file($tmpfile, $desPath);

    return $filename;
}
