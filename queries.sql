/* Created tables */

create table users
(
id int not null auto_increment primary key,
email varchar(255) not null,
password varchar(255) not null
);

create table sessions
(
id int not null auto_increment primary key,
hash varchar(255) not null,
session_time datetime not null,
user_id int not null,
foreign key (user_id) references users(id) on delete cascade
);

create table projects
(
id int not null auto_increment primary key,
name varchar(255) not null,
user_id int not null,
foreign key (user_id) references users(id) on delete cascade
);

create table tasks
(
id int not null auto_increment primary key,
name varchar(255) not null,
priority int not null,
status tinyint(1) not null,
time datetime not null,
project_id int not null,
foreign key (project_id) references Projects(id) on delete cascade
)

/* 1.	get all statuses, not repeating, alphabetically ordered */

SELECT tasks.status
FROM tasks
GROUP BY tasks.status
ORDER BY tasks.status ASC 

/* 2.	get the count of all tasks in each project, order by tasks count descending */

SELECT projects.name, COUNT( tasks.name ) AS task_count
FROM projects, tasks
WHERE projects.id = tasks.project_id
GROUP BY projects.name
ORDER BY task_count DESC 

/* 3.	get the count of all tasks in each project, order by projects names */

SELECT projects.name, COUNT( tasks.name ) AS task_count
FROM projects, tasks
WHERE projects.id = tasks.project_id
GROUP BY projects.name
ORDER BY projects.name ASC 

/* 4.	get the tasks for all projects having the name beginning with "N" letter */

SELECT tasks.name
FROM tasks
WHERE tasks.name LIKE  'N%'

/* 5.	get the list of all projects containing the 'a' letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id = NULL */

SELECT projects.name, COUNT( tasks.name ) AS task_count
FROM projects
LEFT OUTER JOIN tasks ON tasks.project_id = projects.id
WHERE projects.name LIKE  '%_a_%'
GROUP BY projects.name

/* 6.	get the list of tasks with duplicate names. Order alphabetically */

SELECT name, COUNT( name ) AS task_count
FROM tasks
GROUP BY name
HAVING task_count >1

/* 7.	get the list of tasks having several exact matches of both name and status, from the project 'Garage'. Order by matches count */

SELECT tasks.name, 
STATUS , COUNT( * ) AS task_count
FROM tasks
INNER JOIN projects ON ( projects.id = tasks.project_id ) 
WHERE projects.name =  'Garage'
GROUP BY tasks.name, 
STATUS 
HAVING task_count >1
ORDER BY task_count ASC 

/* 8.	get the list of project names having more than 10 tasks in status 'completed'. Order by project_id */

SELECT projects.name, COUNT( * ) AS task_count
FROM tasks
INNER JOIN projects ON ( projects.id = tasks.project_id ) 
WHERE tasks.status =1
GROUP BY projects.id
HAVING task_count >10
ORDER BY projects.id ASC 