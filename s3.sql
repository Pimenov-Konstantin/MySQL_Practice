create database lesson_3;
use lesson_3;

drop table workers;
create table workers
(
	`id` int primary key not null auto_increment,
    `name` varchar(45),
    `surname` varchar(45),
    `speciality` varchar(45),
    `seniority` int,
    `salary` int,
    `age` int
);

insert into workers(name, surname, speciality, seniority, salary, age)
values
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 30, 400000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40);
    
select * from workers;


-- 1. Выведите все записи, отсортированные по полю "age" по возрастанию

select *
from workers
order by age;

-- 2. Выведите все записи, отсортированные по полю "name"

select *
from workers
order by name;

 -- По убыванию desc
 
select *
from workers
order by name desc;

-- 3. Выведите записи полей "name", "surname","age",
-- отсортированные по полю "name" в алфавитном порядке по убыванию

select name, surname, age
from workers
order by name desc;

-- 4. Выполните сортировку по полям "name" и "age" по убыванию

select *
from workers
order by name desc, age desc; -- первое указывается с большим приорететом.

-- 1. Выведите уникальные (неповторяющиеся) значения поля"name"

select distinct name
from workers;

-- 2. Выведите первые две первые записи из таблицы

select *
from workers
limit 2;

-- 3. Пропустите первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)

select *
from workers
limit 4, 3;


-- 4*. Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие за ними 3 строки (где id=10, id=9, id=8)

select *
from workers
order by id desc
limit 2, 3;

-- суммарная з\п всех сотрудников (avg, min, max, sum, count())
select sum(salary) as result
from workers;

-- среняя з\п по специальности
select avg(salary) as average, speciality, sum(salary) as sum,
count(salary) as count, sum(salary) / count(salary) as result_avg,
min(salary), max(salary)
from workers
group by speciality; -- группируем по специальности среднии з\п

-- Where и having 
select count(speciality)
from workers
having count(speciality) > 2;

select count(speciality), speciality
from workers
group by speciality
having count(speciality) >= 1 and count(speciality)<= 2;