<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);

$date = date('Y-m-d');



$nama_bulan = array("Januari", "Februari", "Maret", "April", "Mei", "Juni",
        "Juli", "Agustus", "September", "Oktober", "November", "Desember");


if($_SESSION['user']['is_admin'] == '0'){
    header('Location:login.php');
}

if(isset($_POST['submit'])) {
    $date = "{$_POST['tahun']}-{$_POST['bulan']}-{$_POST['hari']}";
    $sth = $db->prepare("INSERT INTO anggaran(
                                        sumber,
                                        jumlah,
                                        tanggal_terima,
                                        periode_id)
                                    values(?, ?, ?, ?)");
    $sth->execute(array($_POST['sumber'],$_POST['jumlah'],$date,$_POST['periode_id']));
	$saved=true;
}

?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Data Anggaran</h1>
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
                            <label for="nama">Sumber</label>
                        </td>
                        <td valign="top" class="value ">
                            <input type="text" name="sumber" value="" id="nama" />

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="instansi">Jumlah</label>
                        </td>
                        <td valign="top" class="value ">
                            <input type="text" name="jumlah" value="" id="instansi" />

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="keperluan">Tanggal Terima</label>
                        </td>
						<td valign="top" class="value ">
                           <select name="hari">
							<?php for($h = 1; $h <= 31; $h++):?>
								<?php $selected = ($h == date('d'))?'selected="selected"':''?>
									<option <?php echo $selected?> value="<?php echo $h?>">
										<?php echo $h?>
									</option>
							<?php endfor ?>
						</select>

						<select name="bulan">
							<?php for($b = 1; $b <= 12; $b++):?>
								<?php $selected = ($b == date('m'))?'selected="selected"':''?>
									<option <?php echo $selected?> value="<?php echo $b?>">
										<?php echo $nama_bulan[$b-1]?>
									</option>
							<?php endfor ?>
						</select>

						<select name="tahun">
							<?php for($t = 2009; $t <= 2020; $t++):?>
								<?php $selected = ($t == date('Y'))?'selected="selected"':''?>
									<option <?php echo $selected?> value="<?php echo $t?>">
										<?php echo $t?>
									</option>
							<?php endfor ?>
						</select>
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
