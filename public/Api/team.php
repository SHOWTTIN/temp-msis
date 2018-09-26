<?php

require '.../.../app/common.php'


//1.go to the database and get all work associated with the $taskId
$teams = Team::finAll();
//2.convert to json
//3.print
header('Content-type: application/json');
echo $json;
