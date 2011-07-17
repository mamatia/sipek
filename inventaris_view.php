<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '0'){
    header('Location:login.php');
}


$query = "select * from inventaris";

$statement = $db->prepare($query);
$statement->execute();
$hasil = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">Tabel Inventaris</h1>
&nbsp;
       <div class="list" align="center">
            <table align="center">

                <thead>
                    <tr>
                        <th valign="top" class="name">No</th>
						<th valign="top" class="name">Jenis</th>
						<th valign="top" class="name">Jumlah</th>
						<th valign="top" class="name">Kondisi</th>
                    </tr>
				</thead>
				<tbody align="center" border="1">
					<?php $i= 1; foreach($hasil as $baris):?>
                    <tr>
						<td><?php $i; echo $i++ ?></td>
						<td><?php echo $baris['jenis']?></td>
						<td><?php echo $baris['jumlah']?></td>
						<td><?php echo $baris['kondisi']?></td>
					</tr>
					<?php endforeach ?>
               </tbody>
            </table>
        </div>
&nbsp;
		<div class="body">
			<span class="menuButton"><a href="inventaris.php" class="create">Tambah Data</a></span>
		</div>
