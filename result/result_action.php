<?php
include "include_script.php";

if(isset($_POST['delete_fun'])){
	$data=$_POST['delete_fun'];
	$res=$db->sql_action("assessment","delete",$data);
	print_r($res);
}

if(isset($_POST['update_table'])){
	$data=$_POST['update_table'];
	$res=$db->sql_action("result","update",$data);
}

if(isset($_POST['add_table'])){
	$data=array();
	$data['name']="-";
	$res=$db->sql_action("assessment","insert",$data);
	print_r($res);
}


if(isset($_POST['get_table'])){
	$a_id=$_POST['get_table'];
	$sql="select 
		id,name,co1,co2,co3,co4,co1+co2+co3+co4 as total,exam_in_taken,(co1+co2+co3+co4)/exam_in_taken as ratio
		from assessment where id=$a_id";
	$ex_info=$db->get_sql_array($sql);
	$ex_info=$ex_info[0];
	$ratio=$ex_info['ratio'];
	$obtained=$ex_info['exam_in_taken']*$ex_info['ratio'];
	if($ratio==0)$ratio=1;
	$t_co1=$ex_info['co1']/$ratio;
	$t_co2=$ex_info['co2']/$ratio;
	$t_co3=$ex_info['co3']/$ratio;
	$t_co4=$ex_info['co4']/$ratio;

	echo $ex_info['name'];
?>

<table width="100%" cellspacing=0>
	<tr>
		<td class="td_class1">Student ID</td>
		<td class="td_class1">Student Name</td>
		<td class="td_class1">Co1 (<?php echo $t_co1; ?>)</td>
		<td class="td_class1">Co2 (<?php echo $t_co2; ?>)</td>
		<td class="td_class1">Co3 (<?php echo $t_co3; ?>)</td>
		<td class="td_class1">Co4 (<?php echo $t_co4; ?>)</td>
		<td class="td_class1">Total (<?php echo $ex_info['exam_in_taken']; ?>)</td>
		<td class="td_class1">Obtained (<?php echo $obtained; ?>)</td>
	</tr>
	<?php 
		$sql="select * from student";
		$info=$db->get_sql_array($sql);
		foreach ($info as $key => $value) {
			
			$student_name=$value['name'];
			$student_id=$value['student_id'];
			$sql="select * from result where student_id='$student_id' and a_id=$a_id";
			$info1=$db->get_sql_array($sql);
			if(!isset($info1[0])){
				$data=array();
				$data['student_id']=$student_id;
				$data['co1']=0;
				$data['co2']=0;
				$data['co3']=0;
				$data['co4']=0;
				$data['a_id']=$a_id;
				$res=$db->sql_action("result","insert",$data);

				$sql="select * from result where student_id='$student_id'";
				$info1=$db->get_sql_array($sql);
			}
			if(isset($info1[0])){
				$info1=$info1[0];
				$co1=$info1['co1'];
				$co2=$info1['co2'];
				$co3=$info1['co3'];
				$co4=$info1['co4'];
			}

			$total=(float)$co1+$co2+$co3+$co4;
			$obtained=$total*$ratio;

			
			$id=$info1['id'];

			
	?>
	<tr>
		<td class="td_class2">
			<input type="text" class="input_calss2" value="<?php echo $student_id; ?>" readonly>
		</td>
		<td class="td_class2">
			<input type="text" class="input_calss2" value="<?php echo $student_name; ?>" readonly>
		</td>
		
		<td class="td_class2">
			<input type="text" onkeyup="update(<?php echo $id; ?>,<?php echo $ratio; ?>)" id="co1_<?php echo $id; ?>" class="input_calss1" value="<?php echo $co1; ?>">
		</td>
		<td class="td_class2">
			<input type="text" onkeyup="update(<?php echo $id; ?>,<?php echo $ratio; ?>)" id="co2_<?php echo $id; ?>" class="input_calss1" value="<?php echo $co2; ?>">
		</td>
		<td class="td_class2">
			<input type="text" onkeyup="update(<?php echo $id; ?>,<?php echo $ratio; ?>)" id="co3_<?php echo $id; ?>" class="input_calss1" value="<?php echo $co3; ?>">
		</td>
		<td class="td_class2">
			<input type="text" onkeyup="update(<?php echo $id; ?>,<?php echo $ratio; ?>)" id="co4_<?php echo $id; ?>" class="input_calss1" value="<?php echo $co4; ?>">
		</td>
		<td class="td_class2">
			<input type="text" id="total_<?php echo $id; ?>" class="input_class" value="<?php echo $total; ?>" readonly>
		</td>
		<td class="td_class2">
			<input type="text" id="ob_<?php echo $id; ?>" class="input_calss1" value="<?php echo $obtained; ?>" readonly>
		</td>
		
	</tr>
	<?php } ?>
</table>

<?php

}

?>