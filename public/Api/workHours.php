<?php

require '.../.../app/common.php'

$projectId = intval($_GET['projectId'] ?? 0);

IF ($_projectId<1 {
  throw new Exception('Invalid Project ID in URL');
}


//1.go to the database and get all work associated with the $taskId
$workArr=WorkHoursReport::fetchByProjectId($projectId);
//2.convert to json
$json = json_encode($workArr,JSON_PRETTY_PRINT);
//3.print
header('Content-type: application/json');
echo $json;
