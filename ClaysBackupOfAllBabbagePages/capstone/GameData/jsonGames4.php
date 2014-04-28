
<form action="jsonGames4.php" method="POST">
	<input type="file" name="file">
	<input type="submit" name="submit">
</form>


<?php

date_default_timezone_set("America/Chicago");


if(isset($_POST['submit']))
{
	$away = "";
	$home = "";
	$date = "";
	$gameKey = 0;
	$week = 0;

	$time="";
	$day2 ="";

	$file = fopen("ReducedSeasonFileWithCorrectTimezone.txt", "r") or exit("Unable to open");
	echo "[<br>";
	while(!feof($file))
	{
		$string = fgets($file);
		if(strpos($string,"GameID"))
		{
			$marker = strpos($string, ":");
			$gameID = substr($string, $marker+1, 6);
		
			//echo $gameID;
			$gameID = '"GameID":"'.$gameID.'",<br>"';
		}
		if(strpos($string,"AwayTeam"))
		{
			$marker = strlen($string);
			$temp = substr($string, 0, $marker-4);
			$away = $temp."<br>";
			echo $gameKey.$gameID.$time.$date.$home.$away."},<br>";
		
		}
		if(strpos($string,"Time"))
		{
			$time = $string."<br>";
		}
		if(strpos($string,"HomeTeam"))
		{
			$home = $string."<br>";
		}
		if(strpos($string,"Date"))
		{
			$date = $string."<br>";
		}
		if(strpos($string,"GameKey"))
		{
			$gameKey = "{<br>".$string."<br>";
		}
		/*if(strpos($string,"Week"))
		{
			$week = $string."<br>},<br>";

			echo $gameKey.'"GameID":,</br>'.$time2.$day2.$home.$away.$week;
		}*/
	
	
	}	
		echo "]<br>";
	fclose($file);
}
?>

