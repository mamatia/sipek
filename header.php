<?php
if(!isset($_SESSION)){
	session_start();
}
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<title>SIPEK DISKOMINFO</title>
	<link href="stylesheets/main.css" media="screen" rel="stylesheet" type="text/css" />
	<style type="text/css" media="print"></style>
	<script type="text/javascript" src="js/mootools-core.js"></script>
</head>
<body>
   <div id="spinner" class="spinner" style="display:none;">
			<img src="/images/spinner.gif" alt="Spinner" />
	</div>
	<div id="grailsLogo" class="logo">
		<img align="center" src="images/logo.jpg" alt="Diskominfo" border="0" />
	</div>

	<div class="nav">

		<?php if(isset($_SESSION['user'])):?>
			<?php if($_SESSION['user']['is_admin']):?>
				<span class="menuButton"><a href="view_pegawai.php" class="list">Data Pegawai</a></span>
				<span class="menuButton"><a href="anggaran_view.php" class="list">Data Anggaran</a></span>
				<span class="menuButton"><a href="inventaris_view.php" class="list">Data Inventaris</a></span>
				<span class="menuButton"><a href="program_kerja_view.php" class="list">Data Program Kerja</a></span>
				<span class="menuButton"><a href="absensi_pegawai.php" class="list">Data Absensi Pegawai</a></span>
			<?php else:?>
				<span class="menuButton"><a href="periode.php" class="list">Periode</a></span>
				<span class="menuButton"><a href="" class="list">View Data</a></span>
			<?php endif?>
			<span class="menuButton"><a href="logout.php" class="list">Logout (<?php echo $_SESSION['user']['username'] ?>)</a></span>
		<?php else:?>
			<span class="menuButton"><a href="login.php" class="list">Login</a></span>
		<?php endif?>

	</div>
