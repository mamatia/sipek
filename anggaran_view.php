<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['pengguna']['is_admin'] == '1'){
    header('Location:login.php');
}


$query = "select * from anggaran";

$statement = $db->prepare($query);
$statement->execute();
$hasil = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">Tabel Periode Kerja</h1>
&nbsp;
       <div class="list" align="center">
            <table align="center">
               
                <thead>
                    <tr class="prop">
                        <th valign="top" class="name">No</th>
						<th valign="top" class="name">Sumber</th>
						<th valign="top" class="name">Jumlah</th>
						<th valign="top" class="name">Tanggal Terima</th>
                    </tr> 
				</thead>
				<tbody align="center" border="1">
					<?php $i= 1; foreach($hasil as $baris):?>
                    <tr>
						<td><?php $i; echo $i++ ?></td>
						<td><?php echo $baris['sumber']?></td>
						<td><?php echo $baris['jumlah']?></td>
						<td><?php echo $baris['tanggal_terima']?></td>
					</tr>
					<?php endforeach ?>
               </tbody>
            </table>
        </div>
&nbsp;
		<div class="body">
			<span class="menuButton"><a href="anggaran.php" class="create">Tambah Data</a></span>
		</div>        