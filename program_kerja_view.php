<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '0'){
    header('Location:login.php');
}

$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);

if(isset($_GET['submit'])) {
    $sth = $db->prepare("select * from program_kerja where periode_id = ?");
    $sth->execute(array($_GET['periode_id']));
} else {
	$sth = $db->prepare("select pk.*, jp.nama jp_nama from program_kerja pk left join jenis_pelayanan jp on pk.jenis_pelayanan_id = jp.id");
	$sth->execute();
}
$hasil = $sth->fetchAll(PDO::FETCH_ASSOC);

?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">Tabel Program Kerja</h1>
&nbsp;

&nbsp;
<form method="get">
<table>
	<tr>
		<td valign="center" class="name">
            <label for="Periode">Periode</label>
        </td>
		<td valign="top" class="value">
            <select name="periode_id">
            <?php foreach($listPeriode as $periode):?>
                <option value="<?php echo $periode['id'] ?>"><?php echo $periode['nama']?></option>
            <?php endforeach?>
            </select>
        </td>
		<td>
			<input type="submit" name="submit" value="Filter"/>
		</td>
	</tr>
</table>	
</form>
&nbsp;
       <div class="list" align="center">
            <table align="center">

                <thead>
                    <tr>
                        <th valign="top" class="name">No</th>
						<th valign="top" class="name">Nama</th>
						<th valign="top" class="name">Jenis Pelayanan</th>
						<th valign="top" class="name">Target Anggaran</th>
						<th valign="top" class="name">Riil Anggaran</th>
						<th valign="top" class="name">Tanggal Mulai</th>
						<th valign="top" class="name">Target Tanggal Selesai</th>
						<th valign="top" class="name">Riil Tanggal Selesai</th>
                    </tr>
				</thead>
				<tbody align="center" border="1">
					<?php $i= 1; foreach($hasil as $baris):?>
                    <tr>
						<td><?php $i; echo $i++ ?></td>
						<td><?php echo $baris['nama']?></td>
						<td><?php echo $baris['jp_nama']?></td>
						<td><?php echo $baris['target_anggaran']?></td>
						<td><?php echo $baris['riil_anggaran']?></td>
						<td><?php echo $baris['tanggal_mulai']?></td>
						<td><?php echo $baris['tanggal_target_selesai']?></td>
						<td><?php echo $baris['riil_tanggal_selesai']?></td>
					</tr>
					<?php endforeach ?>
               </tbody>
            </table>
        </div>
&nbsp;
		<div class="body">
			<span class="menuButton"><a href="targetkerja.php" class="create">Tambah Data</a></span>
		</div>
