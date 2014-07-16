<?php
session_start();
include 'connect.php';
$sth = $db->prepare('DELETE FROM periode WHERE id = :id');
$sth->execute(array('id' => $_GET['periode_id']));
header('Location:periode.php');
