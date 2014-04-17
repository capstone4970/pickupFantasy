<?php
include "dbconnect.php";

$userToPoints = array();
$tieArray = array();
$totalPoints = 0;
$k = 0;

$leagueResult = pg_prepare($connection, "getLeagues", 'SELECT "id", "numPlayers" FROM leagues;');
$leagueResult = pg_execute($connection, "getLeagues", array());
//print_r(var_dump($leagueResult));
//$leagueRow = pg_fetch_assoc($leagueResult);
//print_r(var_dump($leagueRow));
for($i=0;$i<pg_num_rows($leagueResult);$i++)
{
	
	$leagueRow = pg_fetch_assoc($leagueResult);
//	echo $leagueRow['id'];
	//echo "league row ".$leagueRow['leagueID'];
	//$rosterResult = pg_prepare($connection, "getRosters", "SELECT \"rosterID\", \"username\", \"qb\", \"flex\", \"k\", \"wr\", \"rb\" FROM rosters where \"leagueID\" = '$1'"); 
	//$rosterResult = pg_execute($connection, "getRosters", array($leagueRow['id']));
	//print_r(var_dump($rosterResult));
	$rosterResult = pg_query($connection, "SELECT \"rosterID\", \"username\", \"qb\", \"flex\", \"k\", \"wr\", \"rb\" FROM rosters where \"leagueID\" = '".$leagueRow['id']."'"); 
	//print_r(var_dump($rosterResult));
	for($j=0;$j<pg_num_rows($rosterResult);$j++)
	{
		
		$rosterRow = pg_fetch_assoc($rosterResult);	
		//print_r(var_dump($rosterRow));
			//echo $rosterRow[2+$k]."AHHA";
		/*$pointResult = pg_prepare($connection, "getQB", 'SELECT "FantasyPoints" FROM weekplayerdata WHERE id = $1');
		$pointResult = pg_execute($connection, "getQB", array($rosterRow['qb']));
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];*/
		//echo $rosterRow['qb']."<br>";
		$pointResult = pg_query($connection, "SELECT \"FantasyPoints\" FROM weekplayerdata WHERE \"NFLPlayerID\" = '".$rosterRow['qb']."'");
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
	
		$pointResult = pg_query($connection, "SELECT \"FantasyPoints\" FROM weekplayerdata WHERE \"NFLPlayerID\" = '".$rosterRow['flex']."'");
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
		
		$pointResult = pg_query($connection, "SELECT \"FantasyPoints\" FROM weekplayerdata WHERE \"NFLPlayerID\" = '".$rosterRow['wr']."'");
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
		
		$pointResult = pg_query($connection, "SELECT \"FantasyPoints\" FROM weekplayerdata WHERE \"NFLPlayerID\" = '".$rosterRow['k']."'");
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
		
		$pointResult = pg_query($connection, "SELECT \"FantasyPoints\" FROM weekplayerdata WHERE \"NFLPlayerID\" = '".$rosterRow['rb']."'");
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
		
	//	print_r(var_dump($pointRow));
	//	echo $pointRow['FantasyPoints'];
		/*$pointResult = pg_prepare($connection, "getFlex", 'SELECT "FantasyPoints" FROM weekplayerdata WHERE id = $1');
		$pointResult = pg_execute($connection, "getFlex", array($rosterRow['flex']));
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
		
		$pointResult = pg_prepare($connection, "getKick", 'SELECT "FantasyPoints" FROM weekplayerdata WHERE id = $1');
		$pointResult = pg_execute($connection, "getKick", array($rosterRow['k']));
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
			

		$pointResult = pg_prepare($connection, "getWR", 'SELECT "FantasyPoints" FROM weekplayerdata WHERE id = $1');
		$pointResult = pg_execute($connection, "getWR", array($rosterRow['wr']));
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];
	
		$pointResult = pg_prepare($connection, "getRB", 'SELECT "FantasyPoints" FROM weekplayerdata WHERE id = $1');
		$pointResult = pg_execute($connection, "getRB", array($rosterRow['rb']));
		$pointRow = pg_fetch_assoc($pointResult);
		$totalPoints = $totalPoints + $pointRow['FantasyPoints'];

		//echo $rosterRow['username'].": $totalPoints <br>";
		//$userToPoints = array($rosterRow['username'] => $totalPoints);
		$userToPoints[$rosterRow['username']] = $totalPoints;
		$totalPoints = 0;*/
		
		$userToPoints[$rosterRow['username']] = $totalPoints;
		$totalPoints = 0;

	}
	asort($userToPoints);	
	$userToPoints = array_reverse($userToPoints);
	//print_r(var_dump($userToPoints));
	//sort($userToPoints);
	//echo var_dump($userToPoints)."<br>";
	
	$tieArray = $userToPoints;
	//print_r(var_dump($tieArray));
	$tieArray = array_unique($tieArray, SORT_NUMERIC);
	//print_r(var_dump($tieArray));
	sort($tieArray);
	$tieArray = array_reverse($tieArray);
	//print_r(var_dump($tieArray));
	//echo $tieArray[0];	
	for($z=0;$z<sizeof($tieArray);$z++)
	{
		foreach($userToPoints as $use => $fantPoints)
		{
		//	echo $tieArray[$z] ." " . $fantPoints;
			//echo "$use has: $fantPoints and ".$tieArray[$use]."<br>";
			if($tieArray[$z]==$fantPoints)
			{
				//echo $use." gets ".($z+1)." place<br>";
				//unset($userToPoints[$use]);
				if($z == 0)
				{
					//echo "$use won<br>";
					$updateWinsresult = pg_query($connection, "UPDATE users set \"won\" = \"won\"+1 where \"username\" = '".$use."'");
				}
				else
				{
					//echo "$use lost<br>";
					$updateLossresult = pg_query($connection, "UPDATE users set \"lost\" = \"lost\"+1 where \"username\" = '".$use."'");
	
				}
				//echo "$use got ".($z+1)."<br>";
				$updatePreviousPlace = pg_query($connection, "UPDATE users set \"previousGamePlace\" = ".($z+1)." where \"username\" = '".$use."'");
					
			}
			else
			{
				//echo $use." gets ". ($z+1)." place<br>";
			}
		}
	}

	//enter in order of array with place	
	unset($tieArray);
	unset($userToPoints);
	$userToPoints = array(); 	
	$tieArray = array();
	

	//print_r(var_dump($userToPoints));
}


?>
