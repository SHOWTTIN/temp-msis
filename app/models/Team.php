<?php
class Team{
  public $id;
  public $name;

  public function __construct ($data){
    $this->id = intval($data['id']);
    $this->name = $data['name'])
    $this -> hourly_rate = floatval($data['hourly_rate']);
  }

  public static function findAll(){
    //1. connect to a database;
    $db = new PDO(DB_SERVER, DB_USER, DB_PW);

    //2. run a query;
    $sql = 'SELECT * FROM Team';

    $statement = $db->prepare($sql);

    //3. run the results;
    $success = $statement -> executed(

    );

    //4. handle the results;
    $arr = [];
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)){

      //4a. for each row, make a new work object;
      $theTeam = new Work($row);

      array_push($arr,$theTeam);
    }
    //4b. return the array of work objects;

    return $arr;
  }
  }
}
