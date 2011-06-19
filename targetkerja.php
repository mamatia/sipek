<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

$date = date('Y-m-d');

$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);

$nama_bulan = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", 
        "Juli", "Agustus", "September", "Oktober", "November", "Desember");


if($_SESSION['pengguna']['is_admin'] == '0'){
    header('Location:login.php');
}

if(isset($_POST['submit'])) {
    $date = "{$_POST['tahun']}-{$_POST['bulan']}-{$_POST['hari']}";
    $sth = $db->prepare("INSERT INTO program_kerja(
                                        nama,
                                        target_anggaran,
                                        riil_anggaran,
										tanggal_mulai,
										tanggal_target_selesai,
										riil_tanggal_selesai,
                                        periode_id)
                                    values(?, ?, ?, ?, ?, ?, ?)");
    $sth->execute(array($_POST['nama'],$_POST['target_anggaran'],$_POST['riil_anggaran'],$date,$date,$date,$_POST['periode_id']));
	$saved=true;
}


?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Data Program Kerja</h1>
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
                            <label for="nama">Nama:</label>
                        </td>
                        <td valign="top" class="value ">
                            <input type="text" name="nama" value="" id="nama" />

                        </td>
                    </tr> 
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="instansi">Target Anggaran:</label>
                        </td>
                        <td valign="top" class="value ">
                            <input type="text" name="target_anggaran" value="" id="instansi" />

                        </td>
                    </tr> 
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="keperluan">Riil Anggaran:</label>
                        </td>
						<td valign="top" class="value ">
                            <input type="text" name="riil_anggaran" value="" id="instansi" />
                        </td>
                    </tr>    
					<tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="tanggal_mulai">Tanggal Mulai:</label>
						</td>
					<td valign="top" class="name">
						
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
					</tr>
					
					<tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="tanggal_mulai">Target Tanggal Selesai:</label>
						</td>
						<td valign="top" class="name">
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
					<tr class="prop">
						<td valign="top" class="name">
							<label for="tanggal_mulai">Riil Tanggal Selesai :</label>
						</td>
					<td valign="top" class="name">
						
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