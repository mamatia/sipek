<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);

if($_SESSION['user']['is_admin'] == '0'){
    header('Location:login.php');
}

if(isset($_GET['submit'])) {
    $sth = $db->prepare("select * from anggaran where periode_id = ?");
    $sth->execute(array());
}


$query = "select * from anggaran";

$statement = $db->prepare($query);
$statement->execute();
$hasil = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<?php include 'header.php'?>
&nbsp;
<div class="body" align="center">
    <h1 align="center">Tabel Anggaran</h1>
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
			<input type="submit" name="submit" value="filter"/>
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
