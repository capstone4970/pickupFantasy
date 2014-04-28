<form action="jsonSeason.php" method="POST">
	<input type="file" name="file">
	<input type="submit" name="submit">
</form>


<?php
if(isset($_POST['submit']))
{
	
	$file = fopen("Washington Roster Updated.txt", "r") or exit("Unable to open");

	$seasonFlag = 0;	
	$teamFlag = 0;
	$positionFlag = 0;
	$fnameFlag =0;
	$lnameFlag = 0;
	$pointsFlag = 0;
	$idFlag	= array();
	$numberFlag = 0;
	$number=' ';
	$team = ' ';
	$position = ' ';
	$fname = ' ';
	$lname = ' ';
	$playerID = ' ';
	$fpoints = ' ';

	$cbsID = '"cbsID":0,<br>';
	$nerdID= '"nerdID":0,<br>';
	$iAuction;
	$curAuction;
	$projFantasyPoints ='"projFantasyPoints":0,<br>';
	$projFantasyMark= '"ProjFantasyPointsMark":0,<br>';
	$lastPlayed = '"LastPlayedPoints":0<br>';

	echo "[<br>";
	while(!feof($file))
	{
		$string = fgets($file);
		if(strpos($string,"Number")&&$numberFlag==0)
		{
			$number = $string."<br>";
			$numberFlag=1;
		}
		if(strpos($string,"CurrentTeam")&&$teamFlag==0)
		{
			$team = $string."<br>";
			$teamFlag =1;
			//echo "{<br>";
			//echo $string. "<br>";
		}
		if(strpos($string,"FantasyPosition")&&$positionFlag==0)
		{
			$position = $string."<br>";
			$positionFlag=1;
			//echo $string."<br>";
		}
		if(strpos($string,"FirstName")&&$fnameFlag==0)
		{
			$fname = $string."<br>";
			$fnameFlag = 1;
			//echo $string. "<br>";
		}
		if(strpos($string,"LastName")&&$lnameFlag==0)
		{
			$lname = $string."<br>";
			$lnameFlag=1;
			//echo $string."<br>";
		}
		if(strpos($string,"PlayerSeasonID"))
		{
			$seasonFlag=0;
		}
		if(strpos($string,"PlayerSeason")&&$seasonFlag==0)
		{
			if(strpos($string,'"PlayerSeason":null'))
			{
				//echo '"FantasyPoints":0</br>';
				//echo "},<br>";
				
				$pointsFlag=1;
				$po = 0;
				$fpoints = '"FantasyPoints":0<br>';	
		
				$iAuction = '"InitialAuctionValue":'.$po.',<br>';
				$curAuction = '"CurrentAuctionValue":'.$po.',<br>';
			
			echo "{<br>".$playerID.$cbsID.$nerdID.$team.$position.$number.$fname.$lname.$iAuction.$curAuction.$projFantasyPoints.$projFantasyMark.$lastPlayed."},<br>";
				
				$playerID=$team=$position=$number=$fname=$lname=$fpoints = ' ';
				$numberFlag=$teamFlag=$positionFlag=$fnameFlag=$lnameFlag=$pointsFlag=0;
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
				//echo $newString[0];
				//$p=filter_var($newString[0], FILTER_SANITIZE_NUMBER_FLOAT);
				$p = strpos($newString[0], ":");
				$p = substr($newString[0],$p+1);
				//echo "points:".$p;
				$points = $p/18; //16 regular, up to 4 playoff games
				if($points<0)
				{
					$points = 0;
				}
				else
				{
					$points = round($points);
				}
				$fpoints = '"FantasyPoints":'.$points.'<br>';
				//echo $points."<br>";
				$iAuction = '"InitialAuctionValue":'.$points.',<br>';
				$iAuction = '"CurrentAuctionValue":'.$points.',<br>';
					
				echo "{<br>".$playerID.$cbsID.$nerdID.$team.$position.$number.$fname.$lname.$iAuction.$curAuction.$projFantasyPoints.$projFantasyMark.$lastPlayed."},<br>";

				//echo "{<br>".$playerID.$team.$position.$number.$fname.$lname.$fpoints."},<br>";
				//echo "},<br>";
				

				$playerID=$team=$position=$number=$fname=$lname=$fpoints = ' ';
				$numberFlag=$teamFlag=$positionFlag=$fnameFlag=$lnameFlag=$pointsFlag=0;
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
				$playerID=$string."<br>";
				$idFlag[] = $int;	
				//echo $string."<br>";
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

