<form action="jsonrecode.php" method="POST">
	<input type="text" name="file">
	<input type="submit" name="submit">
</form>


<?php

if(isset($_POST['submit']))
{
	$jsonOriginal = $_POST['file']; 

	
	$jsonOriginal = json_decode($jsonOriginal, true); 
	foreach (array_keys($jsonOriginal) as $key) { 
		//unset($jsonOriginal[$key]['badField']);
		
	}	
	$jsonNew = json_encode($jsonOriginal); 
	echo $jsonNew; 

}

