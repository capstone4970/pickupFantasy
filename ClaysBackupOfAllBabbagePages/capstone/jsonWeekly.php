<form action="jsonWeekly.php" method="POST">
	<input type="text" name="file">
	<input type="submit" name="submit">
</form>


<?php

if(isset($_POST['submit']))
{
	$jsonOriginal = $_POST['file']; 

	$jsonOriginal = json_decode($jsonOriginal, true); 
	echo $jsonOriginal;
	foreach (array_keys($jsonOriginal) as $key) { 
		//unset($jsonOriginal[$key]['badField']);
		unset($jsonOriginal[$key]['Active']);
		unset($jsonOriginal[$key]['Age']);
		unset($jsonOriginal[$key]['AverageDraftPosition']);
		unset($jsonOriginal[$key]['BirthDate']);
		unset($jsonOriginal[$key]['ByeWeek']);
		unset($jsonOriginal[$key]['College']);
		unset($jsonOriginal[$key]['CollegeDraftPick']);
		unset($jsonOriginal[$key]['CollegeDraftRound']);
		unset($jsonOriginal[$key]['CollegeDraftTeam']);
		unset($jsonOriginal[$key]['CollegeDraftYear']);
		unset($jsonOriginal[$key]['DepthDisplayOrder']);
		unset($jsonOriginal[$key]['DepthOrder']);	
		unset($jsonOriginal[$key]['DepthPosition']);
		unset($jsonOriginal[$key]['DepthPositionCategory']);
		unset($jsonOriginal[$key]['Experience']);
		unset($jsonOriginal[$key]['Height']);
		unset($jsonOriginal[$key]['HeightFeet']);
		unset($jsonOriginal[$key]['HeightInches']);
		unset($jsonOriginal[$key]['InjuryStatus']);
		unset($jsonOriginal[$key]['IsUndraftedFreeAgent']);
		unset($jsonOriginal[$key]['LatestNews']);
		unset($jsonOriginal[$key]['Name']);
		unset($jsonOriginal[$key]['PhotoUrl']);
		unset($jsonOriginal[$key]['PlayerSeason']);
		unset($jsonOriginal[$key]['PositionCategory']);
		unset($jsonOriginal[$key]['ShortName']);
		unset($jsonOriginal[$key]['Status']);
		unset($jsonOriginal[$key]['Team']);
		unset($jsonOriginal[$key]['UpcomingGameOpponent']);
		unset($jsonOriginal[$key]['UpcomingGameWeek']);
		unset($jsonOriginal[$key]['Weight']);
		

		//unset($jsonOriginal[$key]['CurrentTeam']);	
	}	
	$jsonNew = json_encode($jsonOriginal); 
	echo $jsonNew; 

}

