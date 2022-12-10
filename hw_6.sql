CREATE DATABASE home_work_6;
USE home_work_6;

-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION `TimesDays`(seconds INT)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	declare minutes INT DEFAULT 0;
    declare hours INT DEFAULT 0;
    declare days INT DEFAULT 0;
    declare result VARCHAR(50) DEFAULT "0";	
    
    SET days = FLOOR (seconds / 86400);
    SET hours = FLOOR ((seconds - 86400 * days) / 3600);
    SET minutes = FLOOR ((seconds - 86400 * days - 3600 * hours) / 60);
    SET seconds = seconds - 86400 * days - 3600 * hours - 60 * minutes;
    SET result = CONCAT( days," days: ",hours," hours: ", minutes," minutes: ", seconds," seconds ");
    RETURN result;
   END //
 DELIMITER ;
 
SELECT TimesDays(123456) AS RESULT ; 

-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

DELIMITER //
CREATE PROCEDURE EvenNumbers()
BEGIN
	declare num1 INT DEFAULT 0;
    declare num2 INT DEFAULT 10;
    declare result VARCHAR(30) DEFAULT "";
	WHILE num1 < num2 DO
		   SET num1 = num1 + 2;
           SET result = CONCAT(result," ",num1);
		END WHILE;
	SELECT result;
END //
DELIMITER ;

CALL EvenNumbers();
