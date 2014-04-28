<form action="jsonWeekly2.php" method="POST">
	<input type="file" name="file">
	<input type="submit" name="submit">
</form>


<?php
if(isset($_POST['submit']))
{
	
	$file = fopen("San Diego Roster Updated.txt", "r") or exit("Unable to open");

	$seasonFlag = 0;	
	$teamFlag = 0;
	$positionFlag = 0;
	$fnameFlag =0;
	$lnameFlag = 0;
	$pointsFlag = 0;
	$idFlag	= array();

	echo "[<br>";
	while(!feof($file))
	{
		$string = fgets($file);
		if(strpos($string,"CurrentTeam")&&$teamFlag==0)
		{
			$teamFlag =1;
			echo "{<br>";
			echo $string. "<br>";
		}
		if(strpos($string,"FantasyPosition")&&$positionFlag==0)
		{
			$positionFlag=1;
			echo $string."<br>";
		}
		if(strpos($string,"FirstName")&&$fnameFlag==0)
		{
			$fnameFlag = 1;
			echo $string. "<br>";
		}
		if(strpos($string,"LastName")&&$lnameFlag==0)
		{
			$lnameFlag=1;
			echo $string."<br>";
		}
		if(strpos($string,"PlayerSeasonID"))
		{
			$seasonFlag=0;
		}
		if(strpos($string,"PlayerSeason")&&$seasonFlag==0)
		{
			if(strpos($string,'"PlayerSeason":null'))
			{
				echo '"FantasyPoints":0</br>';
				echo "},<br>";
				$pointsFlag=1;
			
				$teamFlag=$positionFlag=$fnameFlag=$lnameFlag=$pointsFlag=0;
			}
		}
	
		if(strpos($string, "FantasyPoints")&&$pointsFlag==0)
		{
			if(strpos($string, "CustomD365FantasyPoints"))
			{
				//continue;
			}
			else if(strpos($string, "FantasyPointsPPR"))
			{
				fgets($file);
			}
			else
			{
				$pointsFlag=1;
				$newString = explode(",",$string);
				echo $newString[0]."<br>";
				echo "},<br>";
				$teamFlag=$positionFlag=$fnameFlag=$lnameFlag=$pointsFlag=0;
			}
		}
		if(strpos($string,"PlayerID" ))
		{
			//preg_match_all('!\d+!',$string,$matches);
			$int = filter_var($string, FILTER_SANITIZE_NUMBER_INT);
		//	echo $int."<br>";
			if(in_array($int, $idFlag))
			{
			//	continue;
			}
			else
			{
				$idFlag[] = $int;	
				echo $string."<br>";
				/*if($pointsFlag !=0 && $positionFlag !=0)
				{
					echo "},<br>";
				
					$teamFlag=$positionFlag=$fnameFlag=$lnameFlag=$pointsFlag=0;
				}
				$teamFlag=$fnameFlag=$lnameFlag=0;*/
			}
		}
	}
	echo "]<br>";
	fclose($file);
}
?>

