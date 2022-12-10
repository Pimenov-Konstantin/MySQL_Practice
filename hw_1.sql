use home_work_1;

select ProductName, Manufacture
from mobile
where ProductCount > "2";

select *
from mobile
where Manufacture = "samsung";

select *
from mobile
where ProductName like "Iphone%";

select *
from mobile
where ProductName like "galaxy%";

select *
from mobile
where ProductName rlike "8";

select *
from mobile
where ProductName rlike "[0-9]";


