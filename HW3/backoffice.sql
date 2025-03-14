CREATE DATABASE backoffice;

USE backoffice;

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
emp_patro VARCHAR(50),
emp_surname VARCHAR(50),
phone VARCHAR(11),
email VARCHAR(50),
cv VARCHAR(50),
office_id INT,
login VARCHAR(50) UNIQUE,
create_date DATE,
emp_role VARCHAR(50)
);


CREATE TABLE office (
office_id INT PRIMARY KEY,
office_name VARCHAR(50),
num_students INT,
num_groups INT,
num_employees INT,
head_id INT
);

CREATE TABLE place (
place_id INT PRIMARY KEY,
office_id INT,
num_comp INT,
admin_id INT
);

CREATE TABLE student (
student_name VARCHAR(50),
student_patro VARCHAR(50),
student_surname VARCHAR(50),
group_id INT,
office_id INT,
parent_name VARCHAR(50),
phone VARCHAR(11),
email VARCHAR(50),
login VARCHAR(50) UNIQUE,
birth_day DATE,
password_hash VARCHAR(50),
create_date DATE,
mentor_id INT
);

CREATE TABLE student_group (
group_id INT PRIMARY KEY,
group_name VARCHAR(50),
start_date DATE,
next_lesson DATETIME,
num_students INT,
teacher_id INT,
place_id INT,
mentor_id INT
);
SELECT * FROM employee;

INSERT INTO office VALUES
(1, 'Нижний Новгород', 130, 34, 23, 1),
(2, 'Бор', 65, 17, 11, 2);
ALTER TABLE employee DROP COLUMN cv;

INSERT INTO employee VALUES
(1, 'Иван', 'Иванович','Иванов', '88005553535', 'ivan@gmail.com',  1, 'ivandivan', '2015-02-02', 'head'),
(2, 'Елена', 'Васильевна','Иванова', '88005553534', 'elena@gmail.com',  2, 'elenakoleno', '2017-02-02', 'head');

INSERT INTO employee VALUES
(3, 'Петр', 'Петрович','Петров', '88005553533', 'petr@gmail.com',  2, 'petrpervyi', '2017-05-02', 'teacher'),
(4, 'Татьяна', 'Анатольевна','Петрова', '88005553532', 'tatiana@gmail.com',  2, 'tanyaplachet', '2021-07-20', 'mentor');

INSERT INTO employee VALUES
(5, 'Зинаида', 'Михайловна','Егорова', '88005553531', 'zina@gmail.com',  1, 'zinadina', '2018-09-08', 'teacher'),
(6, 'Анастасия', 'Борисовна','Бунтова', '88005553530', 'nastya@gmail.com',  1, 'nastyazhet', '2023-09-25', 'mentor');

INSERT INTO employee VALUES
(7, 'Георгий', 'Александрович','Буров', '88005553529', 'gosha@gmail.com',  1, 'gosha1', '2016-09-13', 'admin'),
(8, 'Ольга', 'Николаевна','Тихонова', '88005553528', 'olya@gmail.com',  2, 'olga1', '2019-07-15', 'admin');

ALTER TABLE office ADD FOREIGN KEY (head_id) REFERENCES employee(emp_id);
ALTER TABLE employee ADD FOREIGN KEY (office_id) REFERENCES office(office_id);


SELECT * FROM place;

INSERT INTO place VALUES
(1, 1, 10, 7),
(2, 1, 8, 7),
(3, 1, 12, 7),
(4, 2, 8, 8),
(5, 2, 6, 8);

ALTER TABLE place ADD FOREIGN KEY (office_id) REFERENCES office(office_id);
ALTER TABLE place ADD FOREIGN KEY (admin_id) REFERENCES employee(emp_id);

ALTER TABLE place ADD COLUMN place_name VARCHAR(50);
DELETE FROM place WHERE place_id='3';

UPDATE place SET place_name='Верхняя' WHERE place_id='1'; 
UPDATE place SET place_name='Стрелка' WHERE place_id='2'; 
UPDATE place SET place_name='Нижняя' WHERE place_id='3'; 
UPDATE place SET place_name='Маяковская' WHERE place_id='4'; 
UPDATE place SET place_name='Ленина' WHERE place_id='5'; 

SELECT * FROM student;
ALTER TABLE student DROP COLUMN student_patro;

INSERT INTO student VALUES
('Паша', 'Герасимов', 1, 1, 'Мария', '8800553520', 'maria@gmail.com', 'pasha1', '2007-12-24', '1223', '2023-08-29', 7),
('Мария', 'Кононова', 1, 1, 'Наталья', '8800553519', 'nata@gmail.com', 'masha1', '2008-02-05', '2354', '2023-08-30', 7);

INSERT INTO student VALUES
('Катя', 'Логинова', 2, 2, 'Елена', '8800553518', 'lena@gmail.com', 'katya2', '2010-07-24', '5432', '2024-08-30', 8),
('Саша', 'Борщ', 3, 2, 'Ирина', '8800553517', 'irina@gmail.com', 'sasha3', '2014-03-05', '2354', '2024-08-15', 8);

SELECT * FROM student_group;
INSERT INTO student_group VALUES
(1, 'PythonPro2', '2023-09-12', '2024-05-23 15:00:00', 10, 5, 1, 7),
(2, 'PythonStart1', '2024-09-10', '2024-05-25 11:00:00', 8, 6, 4, 8),
(3, 'Визуальное программирование', '2024-09-09', '2024-05-23 10:00:00', 5, 6, 5, 8);

ALTER TABLE student ADD FOREIGN KEY (office_id) REFERENCES office(office_id);
ALTER TABLE student ADD FOREIGN KEY (mentor_id) REFERENCES employee(emp_id);
ALTER TABLE student ADD FOREIGN KEY (group_id) REFERENCES student_group(group_id);


ALTER TABLE student_group ADD FOREIGN KEY (teacher_id) REFERENCES employee(emp_id);
ALTER TABLE student_group ADD FOREIGN KEY (place_id) REFERENCES place(place_id);
ALTER TABLE student_group ADD FOREIGN KEY (mentor_id) REFERENCES employee(emp_id);


SELECT emp_name, emp_surname, emp_role FROM employee;

SELECT emp_name, emp_surname FROM employee WHERE emp_role = 'teacher';

SELECT place_name from place WHERE office_id = '1' and num_comp > 8;

SELECT student_name, student_surname from student WHERE office_id = '2';

