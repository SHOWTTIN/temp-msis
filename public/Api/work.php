<?php

require '.../.../app/common/php'

$taskId=intval($_GET['taksId'] ?? 0);

if($taskId<1){
  throw new Exception('Invalid Task ID');
}


//1.go to the database and get all work associated with the $taskId
$workArr=Work::getAllWorkByTask($taskId);
//2.convert to json
$json = json_encode($workArr);
//3.print
echo $json;
