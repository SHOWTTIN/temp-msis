<?php
class WorkHoursReport
{

public static function fetchByProjectId($projectId){
  //1. connect to a database;
  $db = new PDO(DB_SERVER, DB_USER, DB_PW);

  //2. run a query;
  $sql = 'SELECT DATE(start_date) AS date,
    SUM(hours) AS hours
    FROM Work,Tasks
    WHERE Work.task_id = Tasks.id
    AND Tasks.project_id = ?
    GROUP BY DATE(start_date)
    ORDER BY date';

  $statement = $db->prepare($sql);

  //3. run the results;
  $success = $statement -> executed(
    [$projectId]
  );

  //4. handle the results;
  $arr = $statement ->fetchAll(PDO::FETCH_ASSOC);

  //4b. return the array of work objects;

  return $arr;
}
}
