CREATE DATABASE lesson_6;
USE lesson_6;

-- Создайте хранимую процедуру hello(), которая будет возвращать приветствие,
-- в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
CREATE PROCEDURE hello()
BEGIN
	CASE
		WHEN curtime() BETWEEN '06:00:00' AND '11:59:00' THEN
			SELECT 'Доброе Утро' AS 'Утро';
		WHEN curtime() BETWEEN '12:00:00' AND '17:59:00' THEN
			SELECT 'Доброе День' AS 'День';
		WHEN curtime() BETWEEN '18:00:00' AND '23:59:00' THEN
			SELECT 'Добрый Вечер' AS 'Вечер';
		ELSE -- "00-06"
			SELECT 'Доброй Ночи';
	END CASE;
END //
DELIMITER ;

CALL hello();

--

-- Выведите первые N чисел Фибоначчи.

DELIMITER $$
CREATE FUNCTION fibonacci (num INT) 
RETURNS VARCHAR(30)
DETERMINISTIC -- субд может кэшировать значения и не пересчитывать несколько раз одно и то же
begin
	DECLARE fib1 INT DEFAULT 0; -- fib1 = 0
    DECLARE fib2 INT DEFAULT 1; -- fib2 = 1
    DECLARE fib3 INT DEFAULT 0; -- fib3 = 0
    DECLARE result VARCHAR(30) DEFAULT '0 1'; -- ПЕРВЫЕ ДВА ЧИСЛА ФИБОНАЧЧИ В ФОРМАТЕ СТРОЧКИ
    
    IF num = 1 THEN
		RETURN fib1; -- fib=0
	ELSEIF num = 2 THEN
		RETURN CONCAT(fib1,fib2); -- конкатенация . процесс сложения двух строк '0'+'1'
    ELSE -- RESULT
		WHILE num > 2 DO
			SET fib3 = fib1 + fib2;
            SET fib1 = fib2;
            SET fib2 = fib3;
            SET num = num - 1;  -- num
            SET result = CONCAT(result,' ', fib3);
		END WHILE;
        RETURN result;
	END IF;
END $$ 
DELIMITER ;

select fibonacci (8) AS 'Fibonacci numbers';

--

-- Транзакции
DROP TABLE bankaccounts;
CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));

-- Добавьте информацию о двух счетах с именами ACC1 и ACC2 с начальным балансом средств в размере 1000 долларов США каждый.

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);

-- Изменим баланс на аккаунтах

START TRANSACTION; 
	UPDATE bankaccounts SET funds=funds-700 WHERE accountno='ACC1'; -- acc1 - 700 = 300
	UPDATE bankaccounts SET funds=funds+700 WHERE accountno='ACC2'; -- acc2 +700 = 1700
-- COMMIT; -- сохранение и выполнение ваших результатов 
ROLLBACK; -- транзакция выполнится, но в результате ничего не сохраниться и процедура отменится

select *
FROM bankaccounts;