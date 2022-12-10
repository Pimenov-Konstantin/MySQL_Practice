
CREATE DATABASE lesson_4_2;
USE lesson_4_2;

 -- Создание таблицы с товарами
CREATE TABLE products 
(
     product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category INT NULL,
     product_name VARCHAR(100) NOT NULL

);

-- Создание таблицы с категориями
CREATE TABLE categories 
(
     category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_name VARCHAR(100) NOT NULL
);

-- Добавление данных в таблицу с товарами
INSERT INTO products(category, product_name)
VALUES
			(1, 'Системный блок'),
            (1, 'Монитор'),
            (2, 'Холодильник'),
            (2, 'Телевизор'),
            (NULL, 'Операционная система');

-- Добавление данных в таблицу с категориями
INSERT INTO categories (category_name)
VALUES 
			('Комплектующие компьютера'),
            ('Бытовая техника'),
            ('Мобильные устройства');
            
-- go go go

select p.*
from products p
left join categories c on p.category = c.category_id -- c-catigories
union all -- all дублирует два раза. без него пишет один раз и all работает быстрее
select p.*
from products p
right join categories c on p.category = c.category_id; -- c-catigories
