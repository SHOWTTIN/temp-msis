<?php

require '.../.../app/common.php'

IF ($_SERVER ['REQUEST_METHOD'] == 'POST'){
  require 'workPost.php';
  exit;
}


$taskId=intval($_GET['taksId'] ?? 0);

if($taskId<1){
  throw new Exception('Invalid Task ID');
}


//1.go to the database and get all work associated with the $taskId
$workArr=Work::getWorkByTaskId($taskId);
//2.convert to json
$json = json_encode($workArr,JSON_PRETTY_PRINT);
//3.print
header('Content-type: application/json');
echo $json;
