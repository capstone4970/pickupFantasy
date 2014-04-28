<?php
include "dbconnect.php";
if($_GET['playerid']||$argv[1])
{
	if($argv[1])
	{
		$_GET['playerid'] = $argv[1];
	}
	$curl = curl_init();
// Set some options - we are passing in a useragent too here
	curl_setopt_array($curl, array(
    		CURLOPT_RETURNTRANSFER => 1,
   		 CURLOPT_URL => 'http://babbage.cs.missouri.edu/~cssgf3/capstone/simulation/jsonGenerator.php?playerid='.$_GET['playerid'],
   		 CURLOPT_USERAGENT => 'Simulating Player Game'
		));
	// Send the request & save response to $resp
	$resp = curl_exec($curl);
// Close request to clear up some resources
	curl_close($curl);

	//var_dump(json_decode($resp,true));
	$jsonArray = json_decode($resp, true);
	//echo $jsonArray['PassingYards'];

	$passyds= $jsonArray['PassingYards'];
	$rushyds= $jsonArray['RushingYards'];
	$rcvyds= $jsonArray['ReceivingYards'];
	$fumbles= $jsonArray['Fumbles'];
	$tdpass= $jsonArray['PassingTouchdowns'];
	$twopass= $jsonArray['TwoPointConversionPasses'];
	$tworush= $jsonArray['TwoPointConversionRuns'];
	$tdrush= $jsonArray['RushingTouchdown'];
	$tdrcv =$jsonArray['ReceivingTouchdowns'];
	$tworcv= $jsonArray['TwoPointConversionReceptions'];
	$extrapoint= $jsonArray['ExtraPointsMade'];
	$fieldgoal = $jsonArray['FieldGoalsMade'];

	$result = pg_prepare($connection, "updateplayer", 'update weekplayerdata set "Passyds"=$1, "Rushyds"=$2, "Rcvyds"=$3, "Fumbles"=$4,
"TDPass"=$5, "TwoPointPass"=$6, "TwoPointRush"=$7, "TDRush"=$8, "TDRcv"=$9,
"TwoPointRcv"=$10, "ExtraPoint"=$11, "FieldGoal"=$12 WHERE id=$13');

	$result = pg_execute($connection, "updateplayer", array($passyds, $rushyds, $rcvyds, $fumbles, $tdpass, $twopass, $tworush, $tdrush, $tdrcv, $tworcv, $esxtrapoint, $fieldgoal,$_GET['playerid']));
	if(!$result)
	{
		echo "Failure To Updatebr>";
		exit;
	}
	



	
}
/*
if($_GET['team']||$argv[1])
{
	if($argv[1])
	{
		$_GET['playerid'] = $argv[1];
	}
	$curl = curl_init();
// Set some options - we are passing in a useragent too here
	curl_setopt_array($curl, array(
    		CURLOPT_RETURNTRANSFER => 1,
   		 CURLOPT_URL => 'http://babbage.cs.missouri.edu/~cssgf3/capstone/simulation/jsonGenerator.php?playerid='.$_GET['playerid'],
   		 CURLOPT_USERAGENT => 'Simulating Player Game'
		));
	// Send the request & save response to $resp
	$resp = curl_exec($curl);
// Close request to clear up some resources
	curl_close($curl);

	//var_dump(json_decode($resp,true));
	$jsonArray = json_decode($resp, true);
	//echo $jsonArray['PassingYards'];

	$passyds= $jsonArray['PassingYards'];
	$rushyds= $jsonArray['RushingYards'];
	$rcvyds= $jsonArray['ReceivingYards'];
	$fumbles= $jsonArray['Fumbles'];
	$tdpass= $jsonArray['PassingTouchdowns'];
	$twopass= $jsonArray['TwoPointConversionPasses'];
	$tworush= $jsonArray['TwoPointConversionRuns'];
	$tdrush= $jsonArray['RushingTouchdown'];
	$tdrcv =$jsonArray['ReceivingTouchdowns'];
	$tworcv= $jsonArray['TwoPointConversionReceptions'];
	$extrapoint= $jsonArray['ExtraPointsMade'];
	$fieldgoal = $jsonArray['FieldGoalsMade'];

	$result = pg_prepare($connection, "updateplayer", 'update weekplayerdata set "Passyds"=$1, "Rushyds"=$2, "Rcvyds"=$3, "Fumbles"=$4,
"TDPass"=$5, "TwoPointPass"=$6, "TwoPointRush"=$7, "TDRush"=$8, "TDRcv"=$9,
"TwoPointRcv"=$10, "ExtraPoint"=$11, "FieldGoal"=$12 WHERE id=$13');

	$result = pg_execute($connection, "updateplayer", array($passyds, $rushyds, $rcvyds, $fumbles, $tdpass, $twopass, $tworush, $tdrush, $tdrcv, $tworcv, $esxtrapoint, $fieldgoal,$_GET['playerid']));
	if(!$result)
	{
		echo "Failure To Updatebr>";
		exit;
	}
	



	
}*/
	
?>

<center>
<h2>Game Simulator</h2>
<h4>Enter Player Number You Wish To Simulate Play For</h4>
<form action="gameUpdaterIndivPlayer.php" method="GET">
<label for="playerid">Player ID:</label>
<input type="text" name="playerid" id="playerid"/>
<input type="submit" name="playerSubmit" value="Submit Player"/>
</form>
<br><br>
</center>

