<?php
/*Right now this works off the id from heroku, cannot search in where clause using NFLPlayerID*/
include "dbconnect.php";
if($_GET['playerid'])
{
	$passyds= $rushyds= $rcvyds= $fumbles= $tdpass= $twopass= $tworush= $tdrush= $tdrcv =$tworcv= $extrapoint= $fieldgoal = 0;

	$result = pg_prepare($connection, "playerquery", 'select w."Passyds", w."Rushyds", w."Rcvyds", w."Fumbles", w."TDPass", w."TwoPointPass", w."TwoPointRush", w."TDRush", w."TDRcv", w."TwoPointRcv", w."ExtraPoint", w."FieldGoal", s."FantasyPosition" FROM seasonplayerdata as s
	INNER JOIN weekplayerdata as w ON  w."NFLPlayerID" = s."NFLPlayerID" WHERE w.id = $1 ');

	$result = pg_execute($connection, "playerquery", array($_GET['playerid']));
	if(!$result)
	{
		echo "No Player With That ID<br>";
		exit;
	}
	
	$row = pg_fetch_assoc($result);
	
	if($row['FantasyPosition'] == "QB")
	{
		$passyds = rand(0,20);
		$rushyds = rand(0,5);
		$fumbles = rand(0,1);
		//$fumbles = round($fumbles/20);
		$tdpass = rand(0,1);
		//$tdpass = round($tdpass/3);
		$twopass = rand(0,1);	
		$twopass = round($twopass/40);
	}
	else if($row['FantasyPosition'] == "K")
	{
		$extrapoint = rand(0,1);
		$fieldgoal = rand(0,1);
	
	}		
	else if($row['FantasyPosition'] == "TE")
	{
		$rcvyds = rand(0,20);
		$fumbles= rand(0,1);
		//$fumbles  = round($fumbles/20);
		$tdrcv = rand(0,1);
		$tworcv = rand(0,1);
		//$tworcv = round($tworcv/40);
	}
	else if($row['FantasyPosition'] == "WR")
	{
		$rcvyds = rand(0,20);
		$fumbles= rand(0,1);
		//$fumbles  = round($fumbles/20);
		$tdrcv = rand(0,1);
		$tworcv = rand(0,1);
		//$tworcv = round($tworcv/40);

	}
	else if($row['FantasyPosition'] == "RB")
	{
		$rushyds = rand(0,20);
		$fumbles = rand(0,1);
		//$fumbles = round($fumbles/20);
		$tdrush = rand(0,1);
		$tworush = rand(0,1);	
		//$tworush = round($tworush/40);
	}
	else
	{
		echo "Non-applicable Position Related to this ID";
		exit;
	}

	$passyds += $row['Passyds'];
	$rushyds += $row['Rushyds'];
	$rcvyds += $row['Rcvyds'];
	$fumbles += $row['Fumbles'];
	$tdpass += $row['TDPass'];
	$twopass += $row['TwoPointPass'];
	$tworush += $row['TwoPointRush'];
	$tdrush += $row['TDRush'];
	$tdrcv += $row['TDRcv'];
	$tworcv += $row['TwoPointRcv'];
	$extrapoint += $row['ExtraPoint'];
	$fieldgoal += $row['FieldGoal'];

	echo '{
        "Activated": 1,
        "AssistedTackles": 0,
        "BlockedKickReturnTouchdowns": 0,
        "BlockedKicks": 0,
        "DefensiveTouchdowns": 0,
        "ExtraPointsAttempted": 4,
        "ExtraPointsMade": '.$extrapoint.',
        "FantasyPoints": 8,
        "FantasyPosition": "K",
        "FieldGoalPercentage": 50,
        "FieldGoalReturnTouchdowns": 0,
        "FieldGoalsAttempted": 4,
        "FieldGoalsLongestMade": 56,
        "FieldGoalsMade": '.$fieldgoal.' ,
        "FumbleReturnTouchdowns": 0,
        "FumbleReturnYards": 0,
        "Fumbles": '.$fumbles.',
        "FumblesForced": 0,
        "FumblesLost": 0,
        "FumblesOutOfBounds": 0,
        "FumblesOwnRecoveries": 0,
        "FumblesRecovered": 0,
        "InterceptionReturnTouchdowns": 0,
        "InterceptionReturnYards": 0,
        "Interceptions": 0,
        "KickReturnFairCatches": 0,
        "KickReturnLong": 0,
        "KickReturnTouchdowns": 0,
        "KickReturnYards": 0,
        "KickReturnYardsPerAttempt": 0,
        "KickReturns": 0,
        "MiscAssistedTackles": 0,
        "MiscSoloTackles": 0,
        "Name": "Billy Cundiff",
        "Number": 5,
        "OffensiveTouchdowns": 0,
        "PassesDefended": 0,
        "PassingAttempts": 0,
        "PassingCompletionPercentage": 0,
        "PassingCompletions": 0,
        "PassingInterceptions": 0,
        "PassingLong": 0,
        "PassingRating": 0,
        "PassingSackYards": 0,
        "PassingSacks": 0,
        "PassingTouchdowns": '.$tdpass.',
        "PassingYards": '.$passyds.',
        "PassingYardsPerAttempt": 0,
        "PassingYardsPerCompletion": 0,
        "Played": 1,
        "PlayerID": '.$_GET['playerid'].',
        "Position": "K",
        "PositionCategory": "ST",
        "PuntAverage": 0,
        "PuntInside20": 0,
        "PuntNetAverage": 0,
        "PuntReturnFairCatches": 0,
        "PuntReturnLong": 0,
        "PuntReturnTouchdowns": 0,
        "PuntReturnYards": 0,
        "PuntReturnYardsPerAttempt": 0,
        "PuntReturns": 0,
        "PuntTouchbacks": 0,
        "PuntYards": 0,
        "Punts": 0,
        "QuarterbackHits": 0,
        "ReceivingLong": 0,
        "ReceivingTargets": 0,
        "ReceivingTouchdowns": '.$tdrcv.',
        "ReceivingYards": '.$rcvyds.',
        "ReceivingYardsPerReception": 0,
        "ReceivingYardsPerTarget": 0,
        "ReceptionPercentage": 0,
        "Receptions": 0,
        "RushingAttempts": 0,
        "RushingLong": 0,
        "RushingTouchdowns": '.$tdrush.',
        "RushingYards": '.$rushyds.',
        "RushingYardsPerAttempt": 0,
        "SackYards": 0,
        "Sacks": 0,
        "Safeties": null,
        "Season": 0,
        "ShortName": "B.Cundiff",
        "SoloTackles": 0,
        "SpecialTeamsAssistedTackles": 0,
        "SpecialTeamsSoloTackles": 0,
        "SpecialTeamsTouchdowns": 0,
        "Started": 0,
        "Tackles": 0,
        "TacklesForLoss": 0,
        "Team": "WAS",
        "Touchdowns": 0,
        "TwoPointConversionPasses": '.$twopass.',
        "TwoPointConversionReceptions": '.$tworcv.',
        "TwoPointConversionRuns": '.$tworush.',
        "GameDate": "/Date(-62135578800000-0500)/",
        "HomeOrAway": "AWAY",
        "IsGameOver": true,
        "Opponent": "NO",
        "PlayerGameID": 3506359,
        "PlayingSurface": "Artificial",
        "Week": 0
    }';

}
else if($_GET['team1'] || /*$_GET['team2'] || */$argv[1] /*|| $argv[2]*/)
{
	if($argv[1])
	{
		$_GET['team1'] = $argv[1];
	}
/*	if($argv[2])
	{
		$_GET['team2'] = $argv[2];
	}*/
	$json1;
	$json2;
	$playerid;
	$position;
	$passyds= $rushyds= $rcvyds= $fumbles= $tdpass= $twopass= $tworush= $tdrush= $tdrcv =$tworcv= $extrapoint= $fieldgoal = 0;

	$result = pg_prepare($connection, "playerquery", 'select w.id, w."Passyds", w."Rushyds", w."Rcvyds", w."Fumbles", w."TDPass", w."TwoPointPass", w."TwoPointRush", w."TDRush", w."TDRcv", w."TwoPointRcv", w."ExtraPoint", w."FieldGoal", s."FantasyPosition" FROM seasonplayerdata as s
	INNER JOIN weekplayerdata as w ON  w."NFLPlayerID" = s."NFLPlayerID" WHERE s."CurrentTeam" = $1 ');
	$positionflag = 0;
	$flag = 0;
	if($_GET['team1'])
	{
		$result = pg_execute($connection, "playerquery", array($_GET['team1']));
		if(!$result)
		{
			echo "No Team Name Like The One Entered";
			exit;
		}
		while($row = pg_fetch_assoc($result))
		{
			$position = $row['FantasyPosition'];	
			if($row['FantasyPosition'] == "QB")
			{
				$passyds = rand(0,20);
				$rushyds = rand(0,5);
				$fumbles = rand(0,1);
				//$fumbles = round($fumbles/20);
				$tdpass = rand(0,1);
				//$tdpass = round($tdpass/3);
				$twopass = rand(0,1);	
				$twopass = round($twopass/40);
			}
			else if($row['FantasyPosition'] == "K")
			{
				$extrapoint = rand(0,1);
				$fieldgoal = rand(0,1);
	
			}			
			else if($row['FantasyPosition'] == "TE")
			{
				$rcvyds = rand(0,20);
				$fumbles= rand(0,1);
				//$fumbles  = round($fumbles/20);
				$tdrcv = rand(0,1);
				$tworcv = rand(0,1);
				//$tworcv = round($tworcv/40);
			}
			else if($row['FantasyPosition'] == "WR")
			{
				$rcvyds = rand(0,20);
				$fumbles= rand(0,1);
				//$fumbles  = round($fumbles/20);
				$tdrcv = rand(0,1);
				$tworcv = rand(0,1);
				//$tworcv = round($tworcv/40);
	
			}
			else if($row['FantasyPosition'] == "RB")
			{
				$rushyds = rand(0,20);
				$fumbles = rand(0,1);
				//$fumbles = round($fumbles/20);
				$tdrush = rand(0,1);
				$tworush = rand(0,1);	
				//$tworush = round($tworush/40);
			}
			else
			{
				$positionflag=1;
				//echo "Non-applicable Position Related to this ID";
				//exit;
			}
			if($positionflag == 0)
			{	
			$playerid = $row['id'];
			$passyds += $row['Passyds'];
			$rushyds += $row['Rushyds'];
			$rcvyds += $row['Rcvyds'];
			$fumbles += $row['Fumbles'];
			$tdpass += $row['TDPass'];
			$twopass += $row['TwoPointPass'];
			$tworush += $row['TwoPointRush'];
			$tdrush += $row['TDRush'];
			$tdrcv += $row['TDRcv'];
			$tworcv += $row['TwoPointRcv'];
			$extrapoint += $row['ExtraPoint'];
			$fieldgoal += $row['FieldGoal'];
			if($flag ==0)
			{
				$json1 = "[";
				$flag = 1;
			}
			$json1 =$json1.'{
        			"Activated": 1,
    				"AssistedTackles": 0,
        			"BlockedKickReturnTouchdowns": 0,
        			"BlockedKicks": 0,
      				  "DefensiveTouchdowns": 0,
			        "ExtraPointsAttempted": 4,
   				     "ExtraPointsMade": '.$extrapoint.',
     				   "FantasyPoints": 8,
  			      "FantasyPosition": "K",
			        "FieldGoalPercentage": 50,
        			"FieldGoalReturnTouchdowns": 0,
			        "FieldGoalsAttempted": 4,
			        "FieldGoalsLongestMade": 56,
			        "FieldGoalsMade": '.$fieldgoal.' ,
     				   "FumbleReturnTouchdowns": 0,
     				   "FumbleReturnYards": 0,
			        "Fumbles": '.$fumbles.',
    				    "FumblesForced": 0,
			        "FumblesLost": 0,
			        "FumblesOutOfBounds": 0,
			        "FumblesOwnRecoveries": 0,
			        "FumblesRecovered": 0,
			        "InterceptionReturnTouchdowns": 0,
			        "InterceptionReturnYards": 0,
  				      "Interceptions": 0,
			        "KickReturnFairCatches": 0,
			        "KickReturnLong": 0,
			        "KickReturnTouchdowns": 0,
			        "KickReturnYards": 0,
			        "KickReturnYardsPerAttempt": 0,
  				      "KickReturns": 0,
    				    "MiscAssistedTackles": 0,
				        "MiscSoloTackles": 0,
     				   "Name": "Billy Cundiff",
     				   "Number": 5,
   				     "OffensiveTouchdowns": 0,
     				   "PassesDefended": 0,
      				  "PassingAttempts": 0,
     				   "PassingCompletionPercentage": 0,
			        "PassingCompletions": 0,
			        "PassingInterceptions": 0,
			        "PassingLong": 0,
			        "PassingRating": 0,
			        "PassingSackYards": 0,
			        "PassingSacks": 0,
			        "PassingTouchdowns": '.$tdpass.',
			        "PassingYards": '.$passyds.',
			        "PassingYardsPerAttempt": 0,
   				     "PassingYardsPerCompletion": 0,
       				 "Played": 1,
       				 "PlayerID": '.$playerid.',
			        "Position": "'.$position.'",
			        "PositionCategory": "ST",
			        "PuntAverage": 0,
			        "PuntInside20": 0,
			        "PuntNetAverage": 0,
			        "PuntReturnFairCatches": 0,
       				 "PuntReturnLong": 0,
    			    "PuntReturnTouchdowns": 0,
   			     "PuntReturnYards": 0,
   			     "PuntReturnYardsPerAttempt": 0,
 			       "PuntReturns": 0,
    			    "PuntTouchbacks": 0,
  				      "PuntYards": 0,
    			    "Punts": 0,
      			  "QuarterbackHits": 0,
   			     "ReceivingLong": 0,
  			      "ReceivingTargets": 0,
  			      "ReceivingTouchdowns": '.$tdrcv.',
  			      "ReceivingYards": '.$rcvyds.',
  			      "ReceivingYardsPerReception": 0,
  			      "ReceivingYardsPerTarget": 0,
   			     "ReceptionPercentage": 0,
   			     "Receptions": 0,
			        "RushingAttempts": 0,
  					     "RushingLong": 0,
  				      "RushingTouchdowns": '.$tdrush.',
     			   "RushingYards": '.$rushyds.',
     			   "RushingYardsPerAttempt": 0,
    			    "SackYards": 0,
   			     "Sacks": 0,
    			    "Safeties": null,
     			   "Season": 0,
   			     "ShortName": "B.Cundiff",
   				     "SoloTackles": 0,
   			     "SpecialTeamsAssistedTackles": 0,
   			     "SpecialTeamsSoloTackles": 0,
      				  "SpecialTeamsTouchdowns": 0,
        			"Started": 0,
        			"Tackles": 0,
      				  "TacklesForLoss": 0,
     				   "Team": "WAS",
      				  "Touchdowns": 0,
        			"TwoPointConversionPasses": '.$twopass.',
      				  "TwoPointConversionReceptions": '.$tworcv.',
     				   "TwoPointConversionRuns": '.$tworush.',
    			    "GameDate": "/Date(-62135578800000-0500)/",
  			      "HomeOrAway": "AWAY",
  			      "IsGameOver": true,
   			     "Opponent": "NO",
   			     "PlayerGameID": 3506359,
  			      "PlayingSurface": "Artificial",
   			     "Week": 0
    			},';
			}	
			$playerid =$passyds= $rushyds= $rcvyds= $fumbles= $tdpass= $twopass= $tworush= $tdrush= $tdrcv =$tworcv= $extrapoint= $fieldgoal = 0;
			$positionflag = 0;

		}
		$json1 = rtrim($json1, ",");
		$json1 = $json1."]";
		echo $json1;		
	}/*
	$flag = 0;
	$positionflag = 0;
	if($_GET['team2'])
	{
		$result = pg_execute($connection, "playerquery", array($_GET['team2']));
		if(!$result)
		{
			echo "No Team Name Like The One Entered";
			exit;
		}
		while($row = pg_fetch_assoc($result))
		{
			$position = $row['FantasyPosition'];	
			if($row['FantasyPosition'] == "QB")
			{
				$passyds = rand(0,20);
				$rushyds = rand(0,5);
				$fumbles = rand(0,1);
				//$fumbles = round($fumbles/20);
				$tdpass = rand(0,1);
				//$tdpass = round($tdpass/3);
				$twopass = rand(0,1);	
				$twopass = round($twopass/40);
			}
			else if($row['FantasyPosition'] == "K")
			{
				$extrapoint = rand(0,1);
				$fieldgoal = rand(0,1);
	
			}			
			else if($row['FantasyPosition'] == "TE")
			{
				$rcvyds = rand(0,20);
				$fumbles= rand(0,1);
				//$fumbles  = round($fumbles/20);
				$tdrcv = rand(0,1);
				$tworcv = rand(0,1);
				//$tworcv = round($tworcv/40);
			}
			else if($row['FantasyPosition'] == "WR")
			{
				$rcvyds = rand(0,20);
				$fumbles= rand(0,1);
				//$fumbles  = round($fumbles/20);
				$tdrcv = rand(0,1);
				$tworcv = rand(0,1);
				//$tworcv = round($tworcv/40);
	
			}
			else if($row['FantasyPosition'] == "RB")
			{
				$rushyds = rand(0,20);
				$fumbles = rand(0,1);
				//$fumbles = round($fumbles/20);
				$tdrush = rand(0,1);
				$tworush = rand(0,1);	
				//$tworush = round($tworush/40);
			}
			else
			{
				$positionflag=1;
				//echo "Non-applicable Position Related to this ID";
				//exit;
			}
			if($positionflag == 0)
			{	
			$playerid = $row['id'];
			$passyds += $row['Passyds'];
			$rushyds += $row['Rushyds'];
			$rcvyds += $row['Rcvyds'];
			$fumbles += $row['Fumbles'];
			$tdpass += $row['TDPass'];
			$twopass += $row['TwoPointPass'];
			$tworush += $row['TwoPointRush'];
			$tdrush += $row['TDRush'];
			$tdrcv += $row['TDRcv'];
			$tworcv += $row['TwoPointRcv'];
			$extrapoint += $row['ExtraPoint'];
			$fieldgoal += $row['FieldGoal'];
				
			$json2 =$json2.'{
        			"Activated": 1,
    				"AssistedTackles": 0,
        			"BlockedKickReturnTouchdowns": 0,
        			"BlockedKicks": 0,
      				  "DefensiveTouchdowns": 0,
			        "ExtraPointsAttempted": 4,
   				     "ExtraPointsMade": '.$extrapoint.',
     				   "FantasyPoints": 8,
  			      "FantasyPosition": "K",
			        "FieldGoalPercentage": 50,
        			"FieldGoalReturnTouchdowns": 0,
			        "FieldGoalsAttempted": 4,
			        "FieldGoalsLongestMade": 56,
			        "FieldGoalsMade": '.$fieldgoal.' ,
     				   "FumbleReturnTouchdowns": 0,
     				   "FumbleReturnYards": 0,
			        "Fumbles": '.$fumbles.',
    				    "FumblesForced": 0,
			        "FumblesLost": 0,
			        "FumblesOutOfBounds": 0,
			        "FumblesOwnRecoveries": 0,
			        "FumblesRecovered": 0,
			        "InterceptionReturnTouchdowns": 0,
			        "InterceptionReturnYards": 0,
  				      "Interceptions": 0,
			        "KickReturnFairCatches": 0,
			        "KickReturnLong": 0,
			        "KickReturnTouchdowns": 0,
			        "KickReturnYards": 0,
			        "KickReturnYardsPerAttempt": 0,
  				      "KickReturns": 0,
    				    "MiscAssistedTackles": 0,
				        "MiscSoloTackles": 0,
     				   "Name": "Billy Cundiff",
     				   "Number": 5,
   				     "OffensiveTouchdowns": 0,
     				   "PassesDefended": 0,
      				  "PassingAttempts": 0,
     				   "PassingCompletionPercentage": 0,
			        "PassingCompletions": 0,
			        "PassingInterceptions": 0,
			        "PassingLong": 0,
			        "PassingRating": 0,
			        "PassingSackYards": 0,
			        "PassingSacks": 0,
			        "PassingTouchdowns": '.$tdpass.',
			        "PassingYards": '.$passyds.',
			        "PassingYardsPerAttempt": 0,
   				     "PassingYardsPerCompletion": 0,
       				 "Played": 1,
       				 "PlayerID": '.$playerid.',
			        "Position": "'.$position.'",
			        "PositionCategory": "ST",
			        "PuntAverage": 0,
			        "PuntInside20": 0,
			        "PuntNetAverage": 0,
			        "PuntReturnFairCatches": 0,
       				 "PuntReturnLong": 0,
    			    "PuntReturnTouchdowns": 0,
   			     "PuntReturnYards": 0,
   			     "PuntReturnYardsPerAttempt": 0,
 			       "PuntReturns": 0,
    			    "PuntTouchbacks": 0,
  				      "PuntYards": 0,
    			    "Punts": 0,
      			  "QuarterbackHits": 0,
   			     "ReceivingLong": 0,
  			      "ReceivingTargets": 0,
  			      "ReceivingTouchdowns": '.$tdrcv.',
  			      "ReceivingYards": '.$rcvyds.',
  			      "ReceivingYardsPerReception": 0,
  			      "ReceivingYardsPerTarget": 0,
   			     "ReceptionPercentage": 0,
   			     "Receptions": 0,
			        "RushingAttempts": 0,
  					     "RushingLong": 0,
  				      "RushingTouchdowns": '.$tdrush.',
     			   "RushingYards": '.$rushyds.',
     			   "RushingYardsPerAttempt": 0,
    			    "SackYards": 0,
   			     "Sacks": 0,
    			    "Safeties": null,
     			   "Season": 0,
   			     "ShortName": "B.Cundiff",
   				     "SoloTackles": 0,
   			     "SpecialTeamsAssistedTackles": 0,
   			     "SpecialTeamsSoloTackles": 0,
      				  "SpecialTeamsTouchdowns": 0,
        			"Started": 0,
        			"Tackles": 0,
      				  "TacklesForLoss": 0,
     				   "Team": "WAS",
      				  "Touchdowns": 0,
        			"TwoPointConversionPasses": '.$twopass.',
      				  "TwoPointConversionReceptions": '.$tworcv.',
     				   "TwoPointConversionRuns": '.$tworush.',
    			    "GameDate": "/Date(-62135578800000-0500)/",
  			      "HomeOrAway": "AWAY",
  			      "IsGameOver": true,
   			     "Opponent": "NO",
   			     "PlayerGameID": 3506359,
  			      "PlayingSurface": "Artificial",
   			     "Week": 0
    			},';
			}	
			$passyds= $rushyds= $rcvyds= $fumbles= $tdpass= $twopass= $tworush= $tdrush= $tdrcv =$tworcv= $extrapoint= $fieldgoal = 0;
			$positionflag = 0;

		}
		$json2 = rtrim($json2, ",");
		$json2 = $json2."]";
		echo $json2;
	}*/
}
else
{
?>


<center>
<h2>JSON Generator</h2>
<h3>Individual Player Generator</h3>
<form method="GET" action="jsonGenerator.php">
<label for="playerid"/>Enter Player ID</label>
<input type="text" id="playerid" name="playerid"/>
</br>
<input type="submit" value="Generate!" name="submit"/>
</form>
</br>
<h3>Team Generator</h3>
<form method="GET" action="jsonGenerator.php">
<label for="team1"/>Enter Team</label>
<input type="text" id="team1" name="team1"/>
</br>
<!--<label for="team2"/>Enter Away Team</label>
<input type="text" id="team2" name="team2"/>
</br> -->
<input type="submit" name="startGame" value="Generate!"/>
</form>
</center>
<?php
}
?>
