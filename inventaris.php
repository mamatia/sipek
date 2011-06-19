<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['pengguna']['is_admin'] == '0'){
    header('Location:login.php');
}

$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);
	
if(isset($_POST['submit'])) {
    $sth = $db->prepare("INSERT INTO inventaris(
                                        jenis,
                                        jumlah,
                                        kondisi,
                                        periode_id)
                                    values(?, ?, ?, ?)");
    $sth->execute(array($_POST['jenis'],$_POST['jumlah'],$_POST['kondisi'],$_POST['periode_id']));
	$saved=true;
}

?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Data Inventaris</h1>
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
                            <label for="nama">Jenis</label>
                        </td>
                        <td valign="top" class="value ">
                            <input type="text" name="jenis" value="" id="nama" />

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
                            <label for="kondisi">Kondisi</label>
                        </td>
						<td valign="top" class="value">
                            <select name="kondisi">
                                <option>Baik</option>
								<option>Cukup</option>
								<option>Buruk</option>
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
            <span class="button"><input class="save" name="submit" type="submit" value="Create"/></span>
        </div>
    </form>