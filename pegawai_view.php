<?php
include 'connect.php';
session_start();
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '0'){
    header('Location:login.php');
}
$query = "select * from pegawai";
$statement = $db->prepare($query);
$statement->execute();
$hasil = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">Tabel Pegawai</h1>
&nbsp;
       <div class="list" align="center">
            <table align="center">

                <thead>
                    <tr>
                        <th valign="top" class="name">No</th>
						<th valign="top" class="name">NIP</th>
						<th valign="top" class="name">Nama</th>
						<th valign="top" class="name">Jabatan</th>
						<th valign="top" class="name">Golongan</th>
						<th valign="top" class="name">Pendidikan Formal</th>
						<th valign="top" class="name">Status</th>
                    </tr>
				</thead>
				<tbody align="center" border="1">
					<?php $i= 1; foreach($hasil as $baris):?>
                    <tr>
						<td><?php $i; echo $i++ ?></td>
						<td><?php echo $baris['nip']?></td>
						<td><?php echo $baris['nama']?></td>
						<td><?php echo $baris['jabatan']?></td>
						<td><?php echo $baris['golongan']?></td>
						<td><?php echo $baris['pendidikan_formal']?></td>
						<td><?php echo $baris['status']?></td>
					</tr>
					<?php endforeach ?>
               </tbody>
            </table>
        </div>
&nbsp;
		<div class="body">
			<span class="menuButton"><a href="pegawai.php" class="create">Tambah Data</a></span>
		</div>
