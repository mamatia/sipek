<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '0'){
    header('Location:login.php');
}

$query = "select pk.*, jp.nama jp_nama from program_kerja pk left join jenis_pelayanan jp on pk.jenis_pelayanan_id = jp.id";

$statement = $db->prepare($query);
$statement->execute();
$hasil = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">Tabel Program Kerja</h1>
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
