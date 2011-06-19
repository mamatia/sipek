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
				<span class="menuButton"><a href="pegawai.php" class="list">Data Pegawai</a></span>
				<span class="menuButton"><a href="anggaran_view.php" class="list">Data Anggaran</a></span>
				<span class="menuButton"><a href="inventaris.php" class="create">Data Inventaris</a></span>
				<span class="menuButton"><a href="targetkerja.php" class="create">Data Program Kerja</a></span>
				<span class="menuButton"><a href="absensi_pegawai.php" class="create">Data Absensi Pegawai</a></span>
			<?php else:?>
				<span class="menuButton"><a href="periode.php" class="create">Periode</a></span>
				<span class="menuButton"><a href="pembobotan_add.php" class="create">Bobot AHP</a></span>
				<span class="menuButton"><a href="target_sasaran.php" class="create">Input Target Sasaran Strategis</a></span>
				<span class="menuButton"><a href="" class="create">View Target Sasaran Strategis</a></span>
				<span class="menuButton"><a href="" class="create">View Laporan</a></span>
			<?php endif?>
			<span class="menuButton"><a href="logout.php" class="list">Logout (<?php echo $_SESSION['user']['username'] ?>)</a></span>
		<?php else:?>
			<span class="menuButton"><a href="login.php" class="list">Login</a></span>
		<?php endif?>

	</div>
