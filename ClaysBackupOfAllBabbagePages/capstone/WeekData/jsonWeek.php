<form action="jsonWeek.php" method="POST">
	<input type="file" name="file">
	<input type="submit" name="submit">
</form>


<?php
if(isset($_POST['submit']))
{
	
	$file = fopen("CombinedV2.txt", "r") or exit("Unable to open");

	$idFlag = array();
	$auctionFlag = 0;
	$bracketFlag = 0;
	$skipFlag = 0;
	echo "[<br>";

	while(!feof($file))
	{
		$string = fgets($file);	
	
		if(strpos($string,"NFLPlayerID" ))
		{
			//preg_match_all('!\d+!',$string,$matches);
			$int = filter_var($string, FILTER_SANITIZE_NUMBER_INT);
	//		echo $int;
			if(in_array($int, $idFlag))
			{
				$skipFlag = 5;
	//			echo "skipflag";
			}
			else
			{
	//			echo "stored";
				$idFlag[] = $int;	
				$skipFlag = 0;
			}

			$nflID = '"NFLPlayerID":'.$int.',<br>';
		}
		if(strpos($string,"CurrentAuctionValue") &&$bracketFlag==0 &&$skipFlag == 0)
		{
			
			$auction = $string."<br>";
			echo "{<br>";
			echo $nflID.'"SlotID":0,<br>';
			echo $auction.'"FantasyPoints":0,<br>"Passyds":0,<br>"Rushyds":0,<br>"Rcvyds":0,<br>"Fumbles":0,<br>"TDPass":0,<br>"TwoPointPass":0,<br>"TwoPointRush":0,<br>"TDRush":0,<br>"TDRcv":0,<br>"TwoPointRcv":0,<br>"ExtraPoint":0,<br>"FieldGoal":0<br>},<br>';
			$bracketFlag = 1;
		}

		if(strpos($string, "}"))
		{
			$bracketFlag = 0;
		}

		$bracketFlag = 0;
	
	}
	echo "]<br>";
	fclose($file);
}
?>

