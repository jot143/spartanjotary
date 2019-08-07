<?php

function sendNotificationByPlayerID($title, $allPlayerID)
{
    global $onesignal;
    $content = array(
        'en' => $title,
    );
    $fields = array(
        'app_id' => $onesignal['app_id'],
        'include_player_ids' => $allPlayerID,
        'icon' => 'lunchar',
        'sound' => 'on_the_way_sound',
        'android_led_color' => 'FF0000FF',
        'android_accent_color' => 'FFFFFF',
        'data' => array('foo' => 'bar', 'type' => 'request'),
        'contents' => $content,
    );
    $fields = json_encode($fields);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://onesignal.com/api/v1/notifications');
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $response = curl_exec($ch);
    curl_close($ch);

    return $response;
}
