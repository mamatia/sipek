<?php 
session_start();
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}else if($_SESSION['user']['is_admin'] == '0'){
    header('Location:pegawai.php');
} else {
    header('Location:pegawai.php');
}

