<?php
session_start();
include 'connect.php';
if(!isset($_SESSION['user'])){
    header('Location:login.php');
}

if($_SESSION['user']['is_admin'] == '1'){
    header('Location:login.php');
}

if(isset($_POST['submit'])) {
    $sth = $db->prepare("INSERT INTO periode(
                                        nama)
                                    values(?)");
    $sth->execute(array($_POST['nama']));
	$saved=true;
}
?>

<?php include 'header.php'?>
<div class="body" align="center">
    <h1 align="center">Tambah Periode</h1>
	<?php if(isset($saved)):?>
	<div class="message">
		Data Tersimpan!
	</div>
	<?php endif?>
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
                </tbody>
            </table>
        </div>
        <div class="buttons" align="center">
            <span class="button"><input class="save" name="submit" type="submit" value="Create"/></span>
        </div>
    </form>
