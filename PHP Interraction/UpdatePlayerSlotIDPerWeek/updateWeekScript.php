<?php
include "dbconnect.php";
$zero = '0';
$result = pg_prepare($connection, "updateauction", "update  seasonplayerdata set \"CurrentAuctionValue\"=w.\"FantasyPoints\" from weekplayerdata w where w.\"NFLPlayerID\"=seasonplayerdata.\"NFLPlayerID\" AND w.\"SlotID\" <> '0'");
//$result = pg_prepare($connection, "updateauction", 'update  seasonplayerdata set "CurrentAuctionValue"=w."FantasyPoints" from weekplayerdata w where w."NFLPlayerID"=seasonplayerdata."NFLPlayerID" AND w."SlotID" <> '.$zero);
$result = pg_execute($connection, "updateauction", array());
if(!$result)
{
	echo "No update<br>";
}



$curl = curl_init();
// Set some options - we are passing in a useragent too here
	curl_setopt_array($curl, array(
    		CURLOPT_RETURNTRANSFER => 1,
   		 CURLOPT_URL => 'http://babbage.cs.missouri.edu/~cssgf3/capstone/changevalues/updateWeek.php?week='.$argv[1],
   		 CURLOPT_USERAGENT => 'Simulating Player Game'
		));
	// Send the request & save response to $resp
	$resp = curl_exec($curl);
// Close request to clear up some resources
	curl_close($curl);
$result = pg_prepare($connection, "clearweekdata", 'update weekplayerdata set "CurrentAuctionValue" = s."CurrentAuctionValue", "FantasyPoints"=0, "Passyds" = 0, "Rushyds"=0, "Rcvyds"=0, "Fumbles"=0, "TDPass"=0, "TwoPointPass" = 0, "TwoPointRush" = 0, "TDRush"= 0, "TDRcv" = 0, "TwoPointRcv"=0, "ExtraPoint" = 0, "FieldGoal"=0 from seasonplayerdata s where s."NFLPlayerID" = weekplayerdata."NFLPlayerID";');
$result = pg_execute($connection, "clearweekdata", array());
if(!$result)
{
	echo "No update<br>";
}

?>


