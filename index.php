<?php 
session_start();
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}else if($_SESSION['user']['is_admin'] == '0'){
    header('Location:periode.php');
} else {
    header('Location:view_pegawai.php');
}

