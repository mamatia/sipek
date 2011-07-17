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


if(isset($_POST['submit'])) {
	$sth = $db->prepare("INSERT INTO pegawai(
										nama,
										nip,
										jabatan,
										golongan,
										pend_formal,
										status)
									values(?, ?, ?, ?, ?, ?)");
	$sth->execute(array($_POST['nama'],$_POST['nip'],$_POST['jabatan'],$_POST['golongan'],$_POST['pend_formal'],$_POST['status']));
	$saved=true;
}
?>

<?php include 'header.php'?>
<div class="body" align="center">
	<h1 align="center">Data Pegawai</h1>
	<?php if(isset($saved)):?>
	<div class="message">
		Data Tersimpan!
	</div>
	<?php endif?>
	&nbsp;
	<form  method="post">
		<div class="dialog" align="center">
			<table align="center">
				<tbody align="center">

					<tr class="prop">
						<td valign="top" class="name">
							<label for="nama">Nama</label>
						</td>
						<td valign="top" class="value ">
							<input type="text" name="nama" value="" id="nama" />

						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="instansi">NIP</label>
						</td>
						<td valign="top" class="value ">
							<input type="text" name="nip" value="" id="instansi" />

						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="keperluan">Jabatan</label>
						</td>
						<td valign="top" class="value ">
							<input type="text" name="jabatan" value="" id="keperluan" /></textarea>
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="name">Golongan</label>
						</td>
						<td valign="top" class="value">
							<select name="golongan">
								<option>II A</option>
								<option>II B</option>
								<option>II C</option>
								<option>III A</option>
								<option>III B</option>
								<option>III C</option>
								<option>IV A</option>
								<option>IV B</option>
								<option>IV C</option>
							</select>
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="instansi">Pendidikan Formal</label>
						</td>
						<td valign="top" class="value ">
							<input type="text" name="pend_formal" value="" id="instansi" />
						</td>
						<tr class="prop">
						<td valign="top" class="name">
							<label for="instansi">Status</label>
						</td>
						<td valign="top" class="value ">
							<select name="status">
								<option>aktif</option>
								<option>tidak aktif</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="buttons" align="center">
			<span class="button">
				<input class="save" name="submit" type="submit" value="Create"/>
			</span>
		</div>
	</form>
</div>
