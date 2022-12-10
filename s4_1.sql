
CREATE DATABASE lesson_4;
USE lesson_4;

CREATE TABLE teachers
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teachers
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);
    
SELECT * from teachers; 

CREATE TABLE lessons
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teachers(id)
);
INSERT INTO lessons(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4);



-- Получить фамилию учителей и курсы, которые они ведут

select t.surname, l.course -- t-teachers, l-lesson
from teachers t -- псевдоним t для teachers
inner join lessons l on t.id = l.teacher_id;

-- Выбрать фамилию всех учителей и курсы, которые они ведут. Если учитель не ведет курс, его фамилию все равно необходимо вывести

select t.surname, l.course -- t-teachers, l-lesson
from teachers t -- псевдоним t для teachers
left join lessons l on t.id = l.teacher_id;

-- Вывести учителей, которые не ведут никакие курсы (left join)

select t.surname, l.course -- t-teachers, l-lesson
from teachers t -- псевдоним t для teachers
left join lessons l on t.id = l.teacher_id
where l.teacher_id is null;	

-- Получите список курсов и учителей , которые их ведут (right join)

select t.surname, l.course -- t-teachers, l-lesson
from teachers t -- псевдоним t для teachers
right join lessons l on t.id = l.teacher_id;

-- Получить информацию по учителям , которые ведут курс "Знакомство с веб-технологиями"

select t1.*, t2.* from teachers t1 -- t1=teachers
inner join (
			select course, teacher_id
            from lessons
            where course = 'Знакомство с веб-технологиями'
) t2
on t1.id = t2.teacher_id; 

-- вариант 2



