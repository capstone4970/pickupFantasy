<?php
include "dbconnect.php";

$result = pg_query($connection, "SELECT * FROM gamesofweeks;");
if (!$result) {
  echo "An error occurred.\n";
  exit;
}

while ($row = pg_fetch_row($result)) {
  echo "gameKey $row[1]  gameID: $row[2] time: $row[3] date: $row[4] homeTeam: $row[5] awayTeam: $row[6]";
  echo "<br />\n";
}

pg_close($connection);

?>
