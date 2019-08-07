<?php

function sendSimpleEmail($email, $subject, $message)
{

    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
    $headers .= 'From: ' . EMAIL_SENDER . "\r\n" .
        'Reply-To: ' . EMAIL_SENDER . "\r\n" . 'X-Mailer: PHP/' . phpversion();
    mail($email, $subject, $message, $headers);
}
