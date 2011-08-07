<?php
session_start();
include 'connect.php';
$sth = $db->prepare('
		SELECT
		parent_kriteria.id parent_id,
		parent_kriteria.nama parent_name,
		child_kriteria.id child_id,
		child_kriteria.nama child_name,
		bobot_kriteria.nilai bobot,
		kpi.nilai hasil,
		kpi.periode_id kpi_periode_id,
		bobot_kriteria.periode_id bobot_kriteria_periode_id
		FROM  kriteria parent_kriteria
		LEFT JOIN kriteria child_kriteria ON child_kriteria.parent_id = parent_kriteria.id
		LEFT JOIN kpi ON kpi.kriteria_id = child_kriteria.id
		LEFT JOIN bobot_kriteria ON bobot_kriteria.kriteria_id = child_kriteria.id
		WHERE kpi.`periode_id` = ? AND bobot_kriteria.periode_id = ?
');
$sth->execute(array($_GET['periode_id'],$_GET['periode_id']));
$listKriteria = $sth->fetchAll (PDO::FETCH_ASSOC);

$sth = $db->prepare("SELECT * FROM  periode");
$sth->execute();
$listPeriode = $sth->fetchAll(PDO::FETCH_ASSOC);
?>
<?php include 'header.php'?>
<div class="body">

	<form method="get" id="filter" action="pembobotan_view.php">
		<table>
			<tr>
				<td valign="center" class="name">
					<label for="Periode">Periode</label>
				</td>
				<td valign="top" class="value">
					<select name="periode_id" id="periode_id">
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


	<table class="dialog">
		<thead>
			<tr>
				<th>No.</th>
				<th>Perpektif</th>
				<th>Sasaran Strategis</th>
				<th>Bobot</th>
				<th>Hasil</th>
				<th>Keterangan</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach($listKriteria as $i => $kriteria):?>
			<tr>
				<td><?php echo $i + 1?></td>
				<td><?php echo $kriteria['parent_name']?></td>
				<td><?php echo $kriteria['child_name']?></td>
				<td><?php echo $kriteria['bobot']?></td>
				<td><?php echo $kriteria['hasil']?></td>
				<td>&nbsp;</td>
			</tr>
			<?php endforeach?>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	document.id('periode_id').addEvent('change',function(){
		//document.id('filter').submit();
	});

	document.id('periode_id').set('value',<?php echo $_GET['periode_id'] ?>);
</script>
<?php include 'footer.php' ?>
