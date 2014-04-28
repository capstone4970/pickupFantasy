<form action="jsonGames3.php" method="POST">
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

	$time2="";
	$day2 ="";

	$file = fopen("ReducedSeasonFileWithDates.txt", "r") or exit("Unable to open");
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
			$day = substr($string, 8, 10);
			$time = substr($string, 19, 8);
			$ftime = substr($time, 0, 2);
			//echo $ftime;
			$ltime = substr($time, 2,6);
			//echo $ltime;
			if($ftime+7 > 12)
			{
				if($ftime+7>24)
				{
					$ftime = $ftime-12;
				}
				//echo $ftime;
				$ftime = $ftime-5;
				if($ftime < 10)
				{
					$temp = $ftime;
					$ftime= "0".$ftime;
				}
			}
			else
			{
				$ftime = $ftime+7;
				if($ftime <10)
				{
					$temp = $ftime;
					$ftime = "0".$ftime;
				}
			}
			$time = $ftime.$ltime;
			$time2 = '"Time":"'.$time.'",<br>';
			$day2	= '"Date":"'.$day.'",<br>';	
		}
		if(strpos($string,"GameKey"))
		{
			$gameKey = "{<br>".$string."<br>";
		}
		if(strpos($string,"Week"))
		{
			$week = $string."<br>},<br>";

			echo $gameKey.'"GameID":,</br>'.$time2.$day2.$home.$away.$week;
		}
	
	
	}	
		echo "]<br>";
	fclose($file);
}
?>

