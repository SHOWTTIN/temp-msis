<?php

class Work
{
public $id;
public $task_id;
public $team_id;
public $start; //yyyy-mm-dd
public $stop; //yyyy-mm-dd needs to be calculated
public $hours;
public $completion_estimate;

public function  __construct($row)  {
  $this->id = intval($row['id']);

  $this->task_id = intval($row['task_id']);
  $this->team_id = intval($row['team_id']);

  $this->start = $row['start_date'];
  $this->hours = floatval($row['hours']);
  //calculate stop date
  $hours = floor ($this->hours);
  $mins = intval(($this->hours - $hours)* 60); //take advantage of one decimal place;
  $interval = 'PT'. ($hours ? $hours.'H' : ''). ($mins ? $mins. 'M' : '');

  $date = new DateTime($this->start);
  $date -> add (new DateInterval($interval));
  $this->stop = $date -> format ('Y-m-d H:i:s');

  $this->completion_estimate = intval($row['completion_estimate']);

  }
public static function getWorkByTaskId(int $taskId){
  //1. connect to a database;
  $db = new PDO(DB_SERVER, DB_USER, DB_PW);

  //2. run a query;
  $sql = 'SELECT * FROM Work WHERE task_id= ?';

  $statement = $db->prepare($sql);

  //3. run the results;
  $success = $statement -> executed(
    [$taskId]
  );

  //4. handle the results;
  $arr = [];
  while ($row = $statement->fetch(PDO::FETCH_ASSOC)){

    //4a. for each row, make a new work object;
    $workItem = new Work($row);

    array_push($arr,$workItem);
  }
  //4b. return the array of work objects;

  return $arr;
}
}



}



  ?>
