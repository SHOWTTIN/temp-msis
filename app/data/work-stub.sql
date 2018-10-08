DROP TABLE IF EXISTS Teams;
CREATE TABLE Teams (
  team_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR(31) NOT NULL,
  hourly_rate DECIMAL(6,2) NOT NULL
);

INSERT INTO Teams (team_id, name, hourly_rate)
VALUES (1, 'California Dream', 90);
INSERT INTO Teams (team_id, name, hourly_rate)
VALUES (2, 'Noble Carrots', 100);
INSERT INTO Teams (team_id, name, hourly_rate)
VALUES (3, 'MS Why S', 80);
INSERT INTO Teams (team_id, name, hourly_rate)
VALUES (4, 'Luke\'s Parents', 90);



DROP TABLE IF EXISTS Tasks;
CREATE TABLE Tasks (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title VARCHAR(64) NOT NULL,
  type ENUM ('Epic', 'Story', 'Bug') DEFAULT 'Story',
   size ENUM ('XS','S','M','L','XL','2XL'),
   team_id INT,
   open_date DATE NOT NULL,
   close_date DATE DEFAULT NULL,
   status ENUM('Open', 'Started', 'On Hold', 'Closed'),
   hours_worked DECIMAL(5,1) DEFAULT 0,
   perc_complete int DEFAULT 0,
   current_sprint BOOLEAN
);

INSERT INTO Tasks (title, type, size, team_id, open_date, close_date,status, current_sprint)
VALUES ('Update unit tests', 'Story','L',3,'2018-07-15', '2018-08-1', 'Closed', true);



DROP TABLE IF EXISTS Work;
CREATE TABLE Work(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  team_id INT NOT NULL,
  task_id INT NOT NULL,
  start_date DATETIME NOT NULL,
  hours DECIMAL(3,1) NOT NULL,
  -- tz VARCHAR(10), --TODO? Too messy to deal with time zones?
  completion_estimate int NOT NULL CHECK(0 <= completion_estimate <= 100)
);


-- TRIGGERS
CREATE TRIGGER sumWorkToTask
AFTER INSERT ON Work
FOR EACH ROW
  UPDATE Tasks
  SET
    hours_worked = hours_worked + NEW.hours,
    perc_complete = IF(
      NEW.start_date = (
        SELECT MAX(start_date)
        FROM Work
        WHERE task_id = NEW.task_id
      ),
      NEW.completion_estimate,
      perc_complete
    )
  WHERE id = NEW.task_id
;


INSERT INTO Work (id, team_id, task_id, start_date, hours, completion_estimate)
VALUES (1, 2, 1, '2018-07-29 08:30', 3, 10);
INSERT INTO Work (id, team_id, task_id, start_date, hours, completion_estimate)
VALUES (2, 1, 1, '2018-07-29 13:30', 2.1, 25);
INSERT INTO Work (id, team_id, task_id, start_date, hours, completion_estimate)
VALUES (3, 2, 2, '2018-07-29 13:30', 3.6, 100);
INSERT INTO Work (id, team_id, task_id, start_date, hours, completion_estimate)
VALUES (4, 2, 1, '2018-07-30 08:30', 3, 50);
INSERT INTO Work (id, team_id, task_id, start_date, hours, completion_estimate)
VALUES (5, 2, 1, '2018-08-01 09:30', 4, 80);
INSERT INTO Work (id, team_id, task_id, start_date, hours, completion_estimate)
VALUES (6, 2, 1, '2018-08-03 14:30', 3.5, 85);
