<?php

class Work
{
public $id;
public $start_date; //yyyy-mm-dd
public $end_date;

public _construct($row)  {
  $this->id = $row['id'];

  $this->start_date = $row['start_date'];
  $this->$end_date = $row['$end_date'];

//TODO: where should this be calculated?  $this->hour = 0;
  }
public static function getAllWorkByTask(int $taskId){
  //1. connect to a database;
  //2. run a query;
  //3. read the results;
  //4. for each row, make a new work object;
  //5. return the array of work objects;
  return [];

}



}



  ?>
