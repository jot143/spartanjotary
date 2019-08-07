<?php

function getCurl($url)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 4);
    $json = curl_exec($ch);
    if (!$json) {
        echo curl_error($ch);
    }
    curl_close($ch);

    return json_decode($json);
}
