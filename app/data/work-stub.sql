-- Create Projects
DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR(31) NOT NULL,
  short_description TEXT NOT NULL,
  start_date DATE NOT NULL,
  target_date DATE NOT NULL,
  budget DECIMAL(11,2) NOT NULL,
  spent DECIMAL(11,2) NOT NULL DEFAULT 0, -- calculated from work completed
  projected_spend DECIMAL(11,2) NOT NULL DEFAULT 0, -- based off of size of remaining open tasks
  hours_worked DECIMAL(5,1) DEFAULT 0,  -- aggregated from component tasks
  weekly_effort_target INT NOT NULL DEFAULT 100 -- doesn't really belong here; used for calculation of projected_spend
);

INSERT INTO Projects (id, name, short_description, start_date, target_date, budget, spent, projected_spend, hours_worked, weekly_effort_target)
VALUES (1, 'Tapestry', 'Build a visualization layer for the project dashboard', '2018-07-01','2018-11-03', 4950000, 3456700, 4740500, 0, 400);


-- create the Teams table
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


-- create the Tasks table.
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

INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (1,'Update unit tests', 'Epic','L',1,'2018-07-21', null, 'Open', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (2, 'Build UI', 'Story', 'XS', 4, '2018-03-23', null, 'Open', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (3, 'Fix permissions leading to privacy leak', 'Bug', 'L', 2, '2018-06-15', null, 'Open', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (4, 'Evaluate accessibility to screen-readers', 'Epic', '2XL', 2, '2018-03-03', '2018-09-16', 'Closed', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (5, 'Correct repeated 404 errors in settings', 'Bug', 'S', 3, '2018-01-21', null, 'Started', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (6, 'Prepare for internationalization', 'Epic', 'XL', 1, '2018-05-29', null, 'On Hold', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (7, 'Update password hashing from MD5', 'Story', 'M', 4, '2018-07-27', null, 'On Hold', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (8, 'Build CRUD for vendor product models', 'Story', 'L', 2, '2018-05-11', '2018-09-16', 'Closed', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (9, 'Remove unused vendor packages; possible hole', 'Bug', 'XL', 2, '2018-06-12', , 'Started', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (10, 'Provide error messages on timeout', 'Bug', 'L', 1, '2017-12-29', null , 'Started', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (11, 'Two-factor authentication', 'Story', 'M', 4, '2018-04-23', '2018-10-03', 'Closed', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (12, 'Review automated test suite', 'Epic', 'M', 1, '2018-02-22', null, 'Started', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (13, 'Out of memory error for Win7/IE7', 'Bug', 'XS', 2, '2018-02-28', , 'Open', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (14, 'Patch over temporary middleware regression', 'Bug', 'S', 2, '2017-12-23', null, 'Open', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (15, '0-Day: Log in as any user', 'Bug', 'S', 3, '2018-06-06', null, 'Started', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (16, 'Require SSL/TLS', 'Story', 'L', 3, '2018-02-25', null, 'Open', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (17, 'Update to current middelware', 'Story', 'XS', 4, '2018-07-30', null, 'Open', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (18, 'Apply ACL to archival data', 'Story', 'L', 2, '2018-02-15', null, 'On Hold', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (19, 'Update copyright year', 'Story', 'XS', 1, '2018-02-15', null, 'Open', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (20, 'Site breaks when using trackpad', 'Bug', 'L', 4, '2018-02-20', null, 'Open', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (21, 'Document API for public release', 'Epic', '2XL', 4, '2018-02-26', '2018-10-01', 'Closed', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (22, 'Star-schemas for ETL', 'Story', 'XL', 1, '2018-06-23', null, 'Started', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (23, 'Touch events not regognized on privacy settings page', 'Bug', 'M', 4, '2018-05-24', null, 'On Hold', 0);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (24, 'Complete feedback survey (10/10)', 'Story', 'L', 1, '2018-05-06', '2018-09-25', 'Closed', 1);
INSERT INTO 'Tasks' ('id', 'title', 'type', 'size', 'team_id', 'open_date', 'close_date', 'status', 'current_sprint') VALUES (25, 'Transition to new CI/DevOps', 'Epic', 'XL', 3, '2018-05-23', null, 'Open', 1);

-- we left off a column
ALTER TABLE Tasks
ADD COLUMN priject_id INT NOT null
AFTER id;

UPDATE Tasks SET project_id = 1;



-- create the Work table.
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


-- TRIGGERS to sum work to the task it's associated with.
DROP TRIGGER IF EXISTS SumWorkToTask;
CREATE TRIGGER SumWorkToTask
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


-- Trgger to sum updated task work to the project it's associated with.
-- this trigger shold be cascade and be "triggered"(pardon the pun) by the SumWorkToTask trigger.
DROP TRIGGER IF EXISTS SumTaskWorkToProject;

CREATE TRIGGER SumTaskWorkToProject
AFTER UPDATE ON Tasks
FOR EACH ROW
  UPDATE Projects
  SET
    Projects.hours_worked = (SELECT SUM(Tasks.hours_worked) FROM Tasks WHERE Tasks.project_id = NEW.project_id)
  WHERE id = NEW.project_id
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
