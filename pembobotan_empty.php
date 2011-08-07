<?php
session_start();
include 'connect.php';

$sth = $db->prepare('DELETE FROM bobot WHERE periode_id = :periode_id');
$sth->execute(array('periode_id' => $_GET['periode_id']));

$sth = $db->prepare('DELETE FROM bobot_kriteria WHERE periode_id = :periode_id');
$sth->execute(array('periode_id' => $_GET['periode_id']));

$sth = $db->prepare('DELETE FROM kpi WHERE periode_id = :periode_id');
$sth->execute(array('periode_id' => $_GET['periode_id']));

$sth = $db->prepare('UPDATE periode SET terisi_bobot = 0 WHERE id =:periode_id');
$sth->execute(array('periode_id' => $_GET['periode_id']));

header('Location:periode.php');
