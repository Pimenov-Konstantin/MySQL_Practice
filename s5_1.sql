create database lesson_5;
use lesson_5;

create table academic_record (
	name varchar(45),
	quartal  varchar(45),
    subject varchar(45),
	grade int
);

insert into academic_record
values
	('Александр','1 четверть', 'математика', 4),
	('Александр','2 четверть', 'русский', 4),
	('Александр', '3 четверть','физика', 5),
	('Александр', '4 четверть','история', 4),
	('Антон', '1 четверть','математика', 4),
	('Антон', '2 четверть','русский', 3),
	('Антон', '3 четверть','физика', 5),
	('Антон', '4 четверть','история', 3),
    ('Петя', '1 четверть', 'физика', 4),
	('Петя', '2 четверть', 'физика', 3),
	('Петя', '3 четверть', 'физика', 4),
	('Петя', '4 четверть', 'физика', 5);

select * 
from academic_record;

-- Получить с помощью оконных функции:
-- 1. Средний балл ученика
-- 2. Наименьшую оценку ученика
-- 3. Наибольшую оценку ученика 

SELECT name, subject, grade,
	avg(grade) OVER (PARTITION BY name) AS avg_grade,
	sum(grade) OVER (PARTITION BY name) AS sum_grade,
	count(grade) OVER (PARTITION BY name) AS count_grade,
	min(grade) OVER (PARTITION BY name) AS min_grade,
	max(grade) OVER (PARTITION BY name) AS max_grade
FROM academic_record;


-- Получить информацию о оценках Пети по четвертям: 
-- Текущая успеваемость Пети по физике
-- Оценка Пети по физике в следующей четверти
-- Оценка Пети по физике в предыдущей четверти

SELECT name, subject, grade,
	lag(grade) OVER (order by quartal) as previous_grade, -- прошлая строка
	lead(grade) OVER (order by quartal) as next_grade -- слудующая строка
from academic_record
where name = 'Петя';




