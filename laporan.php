<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '1'){
    header('Location:login.php');
}


$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);
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

&nbsp;
       <div class="list" align="center">
            <table align="center">

                <thead>
                    <tr>
                        <th valign="top" class="name">No</th>
						<th valign="top" class="name">Perspektif</th>
						<th valign="top" class="name">Sasaran Strategis</th>
						<th valign="top" class="name">Bobot</th>
						<th valign="top" class="name">Hasil</th>
                    </tr>
				</thead>
				<tbody align="center" border="1">
					<?php $i= 1;?>
                    <tr>
						<td><?php $i; echo $i++ ?></td>
						<td>Finansial</td>
						<td>Anggaran Masuk</td>
						<td>0.451</td>
						<td>Rp.1.000.000.000</td>
					</tr>
					<tr>
						<td><?php $i; echo $i++ ?></td>
						<td>Finansial</td>
						<td>Efektivitas Anggaran</td>
						<td>0.374</td>
						<td>98%</td>
					</tr>
               </tbody>
            </table>
        </div>
&nbsp;

<?php include 'footer.php' ?>
