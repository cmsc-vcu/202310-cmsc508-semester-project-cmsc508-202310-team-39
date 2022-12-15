<?php

    $dbServername = "cmsc508.com";
    $dbUsername = "untermanlm";
    $dbPassword = "Shout4_untermanlm_GOME";
    $dbName = "202310_teams_team39";
    $link = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);
    if(!$link){
        echo "Connection failed!";
    }

?>