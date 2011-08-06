<?php
session_start();
include 'connect.php';

if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '1'){
    header('Location:login.php');
}
?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">View Data</h1>
&nbsp;
	<div class="list" align="center">
		<table>
			<tr><td><a href="Copy of view_pegawai.php" class="create">Data Pegawai</a></td></tr>
			<tr><td><a href="Copy of anggaran_view.php" class="create">Data Anggaran</a></td></tr>
			<tr><td><a href="Copy of inventaris_view.php" class="create">Data Inventaris</a></td></tr>
			<tr><td><a href="Copy of program_kerja_view.php" class="create">Data Program Kerja</a></td></tr>
			<tr><td><a href="Copy of absensi_view.php" class="create">Data Kehadiran Pegawai</a></td></tr>
		</table>
	</div>
</div>