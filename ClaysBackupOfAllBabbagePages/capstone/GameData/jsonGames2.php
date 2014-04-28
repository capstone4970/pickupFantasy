<form action="jsonGames2.php" method="POST">
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

	$file = fopen("ReducedSeasonFile.txt", "r") or exit("Unable to open");
	echo "[<br>";
	while(!feof($file))
	{
		$string = fgets($file);
		if(strpos($string,"AwayTeam"))
		{
			$away = $string."<br>";
		}
		if(strpos($string,"HomeTeam"))
		{
			$home = $string."<br>";
		}
		if(strpos($string,"Date"))
		{
			//$date = $string."<br>";

			$marker = strpos($string, "(");
			$marker2 = strpos($string, "-");
			$division = substr($string, $marker2+1, 4);

			if($division == '0400')
			{
				$div = 1000;
			}
			else
			{
				$div = 1000;
			}
			$epoch = substr($string, $marker+1, 13);
			$epoch = $epoch/1000;
			//echo "<br>".$epoch."<br>";
			$dt = new DateTime("@$epoch");
			$dt = $dt->format('m-d-Y h:i:s');
			//echo $dt;
			$date = '"Date":"'.$dt.'",<br>';
		
		}
		if(strpos($string,"GameKey"))
		{
			$gameKey = "{<br>".$string."<br>";
		}
		if(strpos($string,"Week"))
		{
			$week = $string."<br>},<br>";

			echo $gameKey.$date.$home.$away.$week;
		}
	
	
	}	
		echo "]<br>";
	fclose($file);
}
?>

