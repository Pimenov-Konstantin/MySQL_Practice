use lesson_2;

/*
В таблице имеются следующие атрибуты:
id -- уникальный идентификатор фильма,
title -- название фильма
title_eng -- название фильма на английском языке
year_movie -- год выхода
count_min -- длительность фильма в минутах
storyline -- сюжетная линия, небольшое описание фильма
Все поля (кроме title_eng и storyline) обязательны для заполнения.
Поле id : первичный ключ, который заполняется автоматически.
*/

create table movies
(
	id int not null primary key auto_increment,
    title varchar(45) not null,
    title_eng varchar(45) default "-",
    year_movie int,
    count_min int,
    storyline varchar(100)
);

insert movies(title, title_eng, year_movie, count_min, storyline)
values
	("Игры разума", "A Beautiful Mind", 2001, 135, "От всемирной известности."),
	("Форрест Гамп", "Forrest Gump", 1994, 142, "Сидя на автобусной остановке."),
    ("Иван васильевич", "Ivan", 1987, 144, "Achmat Sila");
select * from movies;

rename table movies to cinema; 

alter table cinema
add Language varchar(45);

alter table cinema
DROP Language;

select * from cinema;
