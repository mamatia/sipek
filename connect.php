<?php

$dbdriver   = 'mysql';
$dbname     = 'sipek';
$dbhost     = '127.0.0.1';
$dbuser     = 'root';
$dbpassword = '';

$db = new PDO("$dbdriver:dbname=$dbname;host=$dbhost",$dbuser,$dbpassword);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
