create database home_work_3;
use home_work_3;
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

-- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания

select *
from workers
order by salary;

select *
from workers
order by salary desc;

-- Выведите 5 максимальных зарплат (salary)

select *
from workers
order by salary desc
limit 5;

-- Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)

select speciality, sum(salary) as sum
from workers
group by speciality;

-- Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет
# не понимаю как вырвать в специальности именно рабочий... и лимит не работает...
select count(age) as worker_age, speciality
from workers
group by speciality
having count(age) >= 24 and count(age) <= 42;

-- Найти количество специальностей

select count(speciality), speciality
from workers
group by speciality
having count(speciality) >= 1 and count(speciality)<= 3;

-- Вывести специальности, у которых средний возраст сотрудника меньше 44 лет

select avg(age) as average_age, speciality
from workers
group by speciality
having avg(age) < 44;
