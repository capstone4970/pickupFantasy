<?php

include "dbconnect.php";

?>

<center>
<h2>Update Player Pool Week</h2>
<form action="updateWeek.php" method="GET">
<select  name="week">
<option value="01">1</option>
<option value="02">2</option>
<option value="03">3</option>
<option value="04">4</option>
<option value="05">5</option>
<option value="06">6</option>
<option value="07">7</option>
<option value="08">8</option>
<option value="09">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<input type="submit" name="query"/>
</form>


<?
if(isset($_GET['week']) || $argv[1])
{
	if($argv[1])
	{
		$_POST['week'] = $argv[1];
	}
	
	$result = pg_prepare($connection, "temptable", 'create temp table temp1 as SELECT g."gameKey", g."gameID", se."NFLPlayerID", se."CurrentTeam", se."FantasyPosition", se."FirstName", se."LastName" FROM gamesofweeks as g, seasonplayerdata as se WHERE (g."homeTeam" = se."CurrentTeam" OR g."awayTeam" = se."CurrentTeam") AND g."gameID" LIKE $1');
	$result = pg_execute($connection, "temptable", array($_GET['week'].'%'));
	if(!$result)
	{
		echo "No temp table<br>";
	}

	$result = pg_prepare($connection, "update", 'update  weekplayerdata set "SlotID"=temp1."gameID" from temp1 where weekplayerdata."NFLPlayerID"=temp1."NFLPlayerID";');
	$result = pg_execute($connection, "update", array());
	if(!$result)
	{
		echo "No update<br>";
	}
	$zeros = '0000000';
	$result = pg_prepare($connection, "update2", 'update weekplayerdata set "SlotID" = '.$zeros.' WHERE "SlotID" NOT LIKE $1');
	$result = pg_execute($connection, "update2", array($_GET['week'].'%'));
	if(!$result)
	{
		echo "Update to players that are not playing did not work<br>";
	}
	
	$result = pg_prepare($connection, "playerdata", 'SELECT w."NFLPlayerID", s."FirstName", s."LastName", s."FantasyPosition", s."CurrentTeam", w."SlotID" from weekplayerdata as w, seasonplayerdata as s WHERE w."NFLPlayerID" = s."NFLPlayerID" ORDER BY w."SlotID";');
	$presult = pg_execute($connection, "playerdata", array());
	/*if(!$result)
	{
		echo "Player query did not execute<br>";
	}*/
	echo "<table border='1'>";
	$row = pg_fetch_assoc($presult);
	echo "<tr>";
	foreach($row as $key => $value)
	{
		echo "<th>$key</th>";
	}

	echo "</tr>";
	echo "<tr>";
	foreach($row as $res)
	{
		echo "<td>$res</td>";
	}
	echo "</tr>";
	while($row = pg_fetch_assoc($presult))
	{
		//print_r($row);

		echo "<tr>";
		
		foreach($row as $res)
		{
			echo "<td>$res</td>";
		}

		echo "</tr>";
	}
	echo "</table>";
	pg_close($connection);


}
else
{
	$result = pg_prepare($connection, "playerdata", 'SELECT w."NFLPlayerID", w."SlotID" from weekplayerdata as w ORDER BY "SlotID";');
	$presult = pg_execute($connection, "playerdata", array());
	/*if(!$result)
	{
		echo "Player query did not execute<br>";
	}*/
	echo "<table border='1'>";
	$row = pg_fetch_assoc($presult);
	echo "<tr>";
	foreach($row as $key => $value)
	{
		echo "<th>$key</th>";
	}

	echo "</tr>";
	echo "<tr>";
	foreach($row as $res)
	{
		echo "<td>$res</td>";
	}
	echo "</tr>";
	while($row = pg_fetch_assoc($presult))
	{
		//print_r($row);

		echo "<tr>";
		
		foreach($row as $res)
		{
			echo "<td>$res</td>";
		}

		echo "</tr>";
	}
	echo "</table>";
	pg_close($connection);
}
?>
