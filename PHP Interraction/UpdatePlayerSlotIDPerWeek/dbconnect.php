<?php

$server = "ec2-54-221-243-6.compute-1.amazonaws.com";
$username = "lieqdtrhfsfwgn";
$password = "SbhDEJMUMvgNLZsYeQYA3JgW6X";
$dbName = "d6rs9i4knpbhe2";

$connection = pg_connect("host=$server user=$username password=$password dbname=$dbName") or die("Could not complete connection!");

?>
