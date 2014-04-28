<form action="tweakSeason.php" method="POST">
	<input type="file" name="file">
	<input type="submit" name="submit">
</form>


<?php
if(isset($_POST['submit']))
{
	
	$file = fopen("Combined.txt", "r") or exit("Unable to open");

	$flag = 0;
	$bracketFlat = 0;

	//echo "[<br>";
	while(!feof($file))
	{
		$string = fgets($file);

		/*if(strpos($string, "InitialAuctionValue"))
		{
			$flag = 1;
			echo $string."<br>";
		}*/
		/*else*/
		if(strpos($string,"InitialAuctionValue"))
		{
			echo $string."<br>";
			$string = fgets($file);
			echo $string."<br>";
		}
		else if(strpos($string,"CurrentAuctionValue" ))
		{
			//preg_match_all('!\d+!',$string,$matches);
			$int = filter_var($string, FILTER_SANITIZE_NUMBER_INT);
		//	echo $int."<br>";
			if($flag!=1)
			{
				echo '"InitialAuctionValue":'.$int.',<br>';
				
			}
			echo $string.',<br>';
		}
	/*	else if(strpos($string, "}"))
		{
			$flag=0;
			echo $string."<br>";
		}*/
		else
		{
			echo $string."<br>";
		}
	}
			$playerID=$string."<br>";
			//echo "]<br>";
	fclose($file);
}
?>

