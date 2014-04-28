<form action="jsonGames.php" method="POST">
	<input type="file" name="file">
	<input type="submit" name="submit">
</form>


<?php
if(isset($_POST['submit']))
{
	$away = "";
	$home = "";
	$date = "";
	$gameKey = 0;
	$week = 0;

	$file = fopen("OriginalSeasonFile.txt", "r") or exit("Unable to open");
	echo "[<br>";
	while(!feof($file))
	{
		$string = fgets($file);
		if(strpos($string,"AwayTeam"))
		{
			$away = $string."<br>";
		}
		if(strpos($string,"HomeTeam"))
		{
			$home = $string."<br>";
		}
		if(strpos($string,"Date"))
		{
			$date = $string."<br>";
		}
		if(strpos($string,"GameKey"))
		{
			$gameKey = "{<br>".$string."<br>";
		}
		if(strpos($string,"Week"))
		{
			$week = $string."<br>},<br>";

			echo $gameKey.$date.$home.$away.$week;
		}
	
	
	}	
		echo "]<br>";
	fclose($file);
}
?>

