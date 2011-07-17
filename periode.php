<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '1'){
    header('Location:login.php');
}


$query = "select * from periode";
$statement = $db->prepare($query);
$statement->execute();
$listPeriode = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Tabel Periode Kerja</h1>
	<div class="list" align="center">
		<table align="center">

			<thead>
				<tr class="prop">
					<th valign="top" class="name">No</th>
					<th valign="top" class="name">Nama</th>
					<th class="name">&nbsp;</th>
				</tr>
			</thead>
			 <tbody border='1' align="center">
				<?php $i= 1; foreach($listPeriode as $periode):?>
				<tr>
					<td><?php $i; echo $i++ ?></td>
					<td><?php echo $periode['nama']?></td>
					<td>
						<?php if($periode['terisi_bobot']):?>
							<a href="pembobotan_view.php?periode_id=<?php echo $periode['id']?>">lihat laporan kinerja</a>
						<?php else:?>
							<span class="menuButton"><a href="pembobotan_add.php?periode_id=<?php echo $periode['id'] ?>" class="create">Isi pembobot</a></span>
						<?php endif ?>
					</td>
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>
	</div>

	<div class="body">
		<span class="menuButton"><a href="pembobotan_add.php" class="create">Pembobotan</a></span>
	</div>
</div>
