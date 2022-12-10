USE lesson1; # use lesson1 - Работа происходит в БД по имени lesson1
-- 1. Получить список с информацией обо всех студентах

SELECT *
FROM STUDENT;

# 2. Получить список всех студентов с именем “Sara”(или любого существующего студента)

select name, email
from student
where name = "Sara";

/* (это многострочный комментарий)
% - задает несколько символов строчки или не одного символа
_ - только 1 символ
3. Вывести имя и название курса из таблички "Студент"

4*. Выбрать студентов, фамилии которых начинаются с буквы «А».
*/

# 3. Вывести имя и почту из таблички "Студент"
select name, email
from student;

# 4*. Выбрать студентов, имя которых начинаются с буквы «V».
select name
from student
where name like "V%";

# 5 Стипендия больше равно 6000

select *
from student
where scholarship >= 6000;

# 6 Все сотрудники it

select name, course_name, phone
from student
where course_name = "it";

# 7 сотрудники не пренадлежащие it

select name, course_name
from student
where course_name != "it";