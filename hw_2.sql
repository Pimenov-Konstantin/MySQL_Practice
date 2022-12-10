-- "0" — это значение, константа. A null указывает на "пустое место" — объявленную, но неинициализированную переменную, объект

show databases;
create database home_work_2;
use home_work_2;

create table sales
(
	id int,
    order_date varchar(45) not null,
    count_product int not null primary key
    );

insert sales (id, order_date, count_product) 
values
	(1, '2022-01-01', 156),
    (2, '2022-01-02', 180),
    (3, '2022-01-03', 21),
    (4, '2022-01-04', 124),
    (5,'2022-01-05', 341);
    
select * from sales;

alter table sales
add tip_zakaza varchar(45);

update sales
set tip_zakaza = "Маленький заказ"
where count_product < 100;

update sales
set tip_zakaza = "Средний заказ"
where count_product between 100 and 300;

update sales
set tip_zakaza = "Большой заказ"
where count_product > 300;
select * from sales;

drop table sales;
drop table orders;

create table orders
(
	id int not null primary key auto_increment,
    employee_id varchar(45),
    amount double,
    order_status varchar(100)
    );

insert orders (employee_id, amount, order_status) 
values
	('e03', 15.00, 'open'),
    ('eo1', 25.50, 'open'),
    ('e05', 100.70, 'closed'),
    ('e02', 22.18, 'open'),
    ('e04', 9.50, 'cancelled');
    
select * from orders;

select order_status
case
	when 'open' then 'order is in open'
	when 'closed' then 'order is closed'
	else 'cancelled'
end as result
from orders;
select * from orders;