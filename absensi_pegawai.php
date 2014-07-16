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

if(isset($_POST['submit'])) {
//	$sth = $db->prepare("SELECT * FROM  pegawai where nip = ?");
//	$sth->execute(array($_POST['nip']));
//	$pegawai = $sth->fetch(PDO::FETCH_ASSOC);
    $sth = $db->prepare("INSERT INTO presensi(
                                        nip,
                                        jumlah_hadir,
                                        jumlah_sakit,
                                        jumlah_izin,
										jumlah_tanpa_keterangan,
										periode_id)
                                    values(?, ?, ?, ?, ?, ?)");
    $sth->execute(array($_POST['nip'],$_POST['jumlah_hadir'],$_POST['jumlah_sakit'],$_POST['jumlah_izin'],$_POST['jumlah_tanpa_keterangan'],$_POST['periode_id']));
	$saved=true;
}

?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Data Absensi Pegawai</h1>
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
                            <label for="nama">NIP</label>
                        </td>
                        <td valign="top" class="value ">
                            <input type="text" name="nip" value="" id="nama" />
                        </td>
						</tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="keperluan">Jumlah Hadir</label>
                        </td>
						<td valign="top" class="value ">
                            <input type="text" name="jumlah_hadir" value="" id="instansi" />
                        </td>
                    </tr>
					<tr class="prop">
                        <td valign="top" class="name">
                            <label for="keperluan">Jumlah Sakit</label>
                        </td>
						<td valign="top" class="value ">
                            <input type="text" name="jumlah_sakit" value="" id="instansi" />
                        </td>
                    </tr>
					<tr class="prop">
                        <td valign="top" class="name">
                            <label for="keperluan">Jumlah Izin</label>
                        </td>
						<td valign="top" class="value ">
                            <input type="text" name="jumlah_izin" value="" id="instansi" />
                        </td>
                    </tr>
					<tr class="prop">
                        <td valign="top" class="name">
                            <label for="keperluan">Jumlah Tanpa Keterangan</label>
                        </td>
						<td valign="top" class="value ">
                            <input type="text" name="jumlah_tanpa_keterangan" value="" id="instansi" />
                        </td>
                    </tr>
					<tr>
					<td valign="top" class="name">
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
        </div>
        <div class="buttons" align="center">
            <span class="button"><input class="save" name="submit" type="submit" value="Create" /></span>
        </div>
    </form>
