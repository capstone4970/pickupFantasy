<?php
$access_token = $_GET['access_token'];
echo $access_token."hello";
$crl = curl_init();
$timeout = 30;
curl_setopt($crl, CURLOPT_URL,
   "http://api.cbssports.com/fantasy/auction-values?access_token=$access_token&response_format=json");
curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($crl, CURLOPT_CONNECTTIMEOUT, $timeout );
$ret = curl_exec($crl);
curl_close($crl);
$data = json_decode($ret);
/*echo "<html><table>";
$auctions = $data->body->auction_values;
foreach ( $auctions as $auction ) {
    $name = $auction->;
    $logo = $team->logo;
    echo "<tr><td><img src='$logo'></td><td>$name</td>";
    $owners = $team->owners;
    foreach ( $owners as $owner ) {
        $ownname = $owner->name;
        echo "<td>$ownname</td>";
    }
    echo "</tr>";
}
echo "</table></html>";*/

var_dump($data);


?>
