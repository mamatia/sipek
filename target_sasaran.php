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

/*if(isset($_POST['submit'])) {
  $sth = $db->prepare("INSERT INTO presensi(
                                        pegawai_id,
                                        jumlah_hadir,
                                        jumlah_sakit,
                                        jumlah_izin,
										jumlah_tanpa_keterangan,
										periode_id)
                                    values(?, ?, ?, ?, ?, ?)");
	$sth->execute(array($_POST['pegawai_id'],$_POST['jumlah_hadir'],$_POST['jumlah_sakit'],$_POST['jumlah_izin'],$_POST['jumlah_tanpa_keterangan'],$_POST['periode_id']));
	$saved=true;
}
*/
?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Data Target Sasaran Strategis</h1>
	<?php if(isset($saved)):?>
	<div class="message">
		Data Tersimpan!
	</div>
	<?php endif?>
	&nbsp;

<form method="post">

<div class="dialog" align="center">
            <table align="center">
                <tbody align="center">
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
					</tr>
					</tbody>
</table>
&nbsp;

		<table border="0">
			<tr>
			<td colspan="5"><h3>Perspektif Finansial</h3></td>
			</tr>

			<tr>
				<td width="">No.</td>
				<td><u>Sasaran Strategis</u></td>
				<td><u>Formulasi</u></td>
				<td colspan="2"><u>Input</u></td>
			<tr>
				<td>1.</td>
				<td>Anggaran Masuk</td>
				<td>Jumlah Uang masuk</td>
				<td colspan="2">Rp.<input type="text" value="" name=""></td>
			</tr>

		<tr>
		<td><td>
		</tr>

			<tr rowspan="2">
				<td rowspan="2">2.</td>
				<td rowspan="2">Penggunaan Anggaran</td>
				<td>Cash out</td>
				<td>Rp.<input type="text" value="" name=""></td>
			</tr>
			<tr>
				<td>Cash in</td>
				<td>Rp.<input type="text" value="" name=""></td>
			</tr>

			<tr>
			<td></td>
			</td>

			<tr>
				<td>3.</td>
				<td>Efektivitas Anggaran</td>
				<td>Target Penggunaan Anggaran</td>
				<td>Rp.<input type="text" value="" name=""></td>
			</tr>
			<tr><td></td></tr>
			</table>

			<br><br>
		<table border="0">
			<tr>
			<td colspan="5"><h3>Perspektif Pelanggan</h3></td>
			</tr>

			<tr>
				<td><u>No.</u></td>
				<td><u>Sasaran Strategis</u></td>
				<td><u>Formulasi</u></td>
				<td colspan="2"><u>Input</u></td>

			<tr>
				<td>1.</td>
				<td>Kepuasan Pelayanan Publik</td>
				<td>Jumlah Keluhan Terlayani</td>
				<td><input type="text" value="" name=""></td>
			</tr>
			<tr><td></td></tr>
		</table>
		<br><br>
				<table border="0">
			<tr>
			<td colspan="5"><h3>Perspektif Bisnis Internal</h3></td>
			</tr>
			<tr>
				<td><u>No.</u></td>
				<td><u>Sasaran Strategis</u></td>
				<td><u>Formulasi</u></td>
				<td colspan="2"><u>Input</u></td>
			<tr>
			<tr rowspan="2">
				<td rowspan="2">1.</td>
				<td rowspan="2">Kepuasan Kerja Pegawai</td>
				<td>Jumlah Pegawai Kehadiran Penuh</td>
				<td><input type="text" value="" name=""></td>
				<td rowspan="2">x 100%</td>
			</tr>
			<tr>
				<td>Total Jumlah pegawai</td>
				<td><input type="text" value="" name=""></td>
			</tr>


		<tr>
		<td><td>
		</tr>

			<tr rowspan="2">
				<td rowspan="2">2.</td>
				<td rowspan="2">Peningkatan Kualitas Pegawai</td>
				<td>Jumlah Kerja Terselesaikan</td>
				<td><input type="text" value="" name=""></td>
				<td rowspan="2">x 100%</td>
			</tr>
			<tr>
				<td>Target Kerja</td>
				<td><input type="text" value="" name=""></td>
			</tr>

			<tr>
			<td></td>
			</td>

			<tr rowspan="2">
				<td rowspan="2">3.</td>
				<td rowspan="2">Kualitas Sarana Prasarana</td>
				<td>Jumlah S/P Layak Pakai</td>
				<td><input type="text" value="" name=""></td>
				<td rowspan="2">x 100%</td>
			</tr>
			<tr>
				<td>Total Jumlah S/P</td>
				<td><input type="text" value="" name=""></td>
			</tr>
			<tr><td></td></tr>
		</table>
		<br><br>


		<table border="0">
			<tr>
			<td colspan="5"><h3>Perspektif Pembelajaran dan Pertumbuhan</h3></td>
			</tr>

			<tr>
				<td width="">No.</td>
				<td><u>Sasaran Strategis</u></td>
				<td><u>Formulasi</u></td>
				<td colspan="2"><u>Input</u></td>
			<tr>
				<td>1.</td>
				<td>Kualitas SDM</td>
				<td>Jumlah Penugasan Keluar</td>
				<td colspan="2"><input type="text" value="" name=""></td>
			</tr>

		<tr>
		<td><td>
		</tr>

			<tr rowspan="2">
				<td rowspan="2">2.</td>
				<td rowspan="2">Efektivitas Komunikasi</td>
				<td>Jumlah Pertemuan Rapat</td>
				<td><input type="text" value="" name=""></td>
				<td rowspan="2">x 100%</td>
			</tr>
			<tr>
				<td>Jumlah Target Pertemuan Rapat</td>
				<td><input type="text" value="" name=""></td>
			</tr>

			<tr>
			<td></td>
			</td>
			</table>

			<br><br>
		<div class="buttons" align="center">
            <span class="button"><input class="save" name="submit" type="submit" value="Create" /></span>
        </div>
</form>


