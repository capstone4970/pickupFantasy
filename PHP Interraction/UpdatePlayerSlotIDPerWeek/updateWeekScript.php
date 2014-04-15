<?php
include "dbconnect.php";
include "reviewLeagues.php";


$zero = '0';
$result = pg_prepare($connection, "updateauction", "update  seasonplayerdata set \"CurrentAuctionValue\"=w.\"FantasyPoints\" from weekplayerdata w where w.\"NFLPlayerID\"=seasonplayerdata.\"NFLPlayerID\" AND w.\"SlotID\" <> '0'");
//$result = pg_prepare($connection, "updateauction", 'update  seasonplayerdata set "CurrentAuctionValue"=w."FantasyPoints" from weekplayerdata w where w."NFLPlayerID"=seasonplayerdata."NFLPlayerID" AND w."SlotID" <> '.$zero);
$result = pg_execute($connection, "updateauction", array());
if(!$result)
{
	echo "No update<br>";
}

$presult = pg_prepare($connection, "getweek", 'SELECT * FROM weekNumber;');
$presult = pg_execute($connection, "getweek", array());
if (!$presult) {
  echo "An error occurred.\n";
  exit;
}
$row = pg_fetch_assoc($presult);
$weekNum = $row['weeknum'];
//echo var_dump($row);
$presult = pg_prepare($connection, "updateweek", 'Update weekNumber set weeknum=$1');
$presult = pg_execute($connection, "updateweek", array($weekNum+1));
if (!$presult) {
  echo "An error occurred.\n";
  exit;
}
if(($weekNum+1)<10)
{	
	$row['weeknum'] = $row['weeknum']+1;
	$row['weeknum'] = '0'.($row['weeknum']);	
}
else
{
	$row['weeknum'] = $row['weeknum'] + 1;
}
//echo $row['weeknum'];
//echo "hi";
$curl = curl_init();
// Set some options - we are passing in a useragent too here
	curl_setopt_array($curl, array(
    		CURLOPT_RETURNTRANSFER => 1,
   		 CURLOPT_URL => 'http://babbage.cs.missouri.edu/~cssgf3/capstone/changevalues/updateWeek.php?week='.$row['weeknum'],
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
	echo "Error clearing weekdata<br>";
}
/*
$result = pg_prepare($connection, "deleterosters", 'DELETE FROM rosters ;');
$result = pg_execute($connection, "deleterosters", array());
if (!$result) {
  echo "An error occurred resetting rosters.\n";
  exit;
}

$presult = pg_prepare($connection, "deleteleagues", 'DELETE FROM leagues;');
$presult = pg_execute($connection, "deleteleagues", array());
if (!$presult) {
  echo "An error occurred resetting leagues.\n";
  exit;
}

$presult = pg_prepare($connection, "clearusersdata", "UPDATE users set \"leagueName\" = '',\"rosterID\" = 0 ;");
$presult = pg_execute($connection, "clearusersdata", array());
if (!$presult) {
  echo "An error occurred resetting users rosterID and leaguename.\n";
  exit;
}*/
?>


