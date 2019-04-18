
<?php

include "include_script.php";

?>
<link rel="stylesheet" type="text/css" href="main.css">
<script type="text/javascript" src="script/result_script.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<?php
$sql="select * from assessment";
$info=$db->get_sql_array($sql);
?>

<div style="margin-left: 5%;margin-top:5%;"> <select id="select_exam" onchange="show_table()" style="margin:auto;"> </div>
 <option value="-1">Select Exam</option>
	<?php
		foreach ($info as $key => $value) {
	?>
		<option value="<?php echo $value['id']; ?>"><?php echo $value['name']; ?></option>
	<?php } ?>
</select>

<div style="margin-bottom: 10px;"></div>
<div id="result_table"></div>
