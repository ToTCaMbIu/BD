-- п.6 скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);

	-- Топ 10 фильмов с самыми высокими оценками;
SELECT f.Name, r.Rating 
from Films f 
join Rating r  on r.Film_ID = f.id 
ORDER by Rating desc
limit 10

	-- Топ 10 самых комментируемых фильмов;
SELECT * from 
(SELECT f.Name, COUNT(r.id) as 'review', COUNT(c.id) as 'comments'
from Films f 
join Review r on r.Film_ID = f.id 
join Comments c on c.Review_ID = r.id 
GROUP BY f.Name) as t1
ORDER by comments desc
limit 10

-- п.7 представления (минимум 2)
	-- Карточка фильма
CREATE view FilmInfo
as 
select f.Name as 'Название фильма', f.Description as 'Описание', s.Name as 'Студия', f2.File_Type_ID as 'Трейлер', f3.File_Type_ID as 'Постер'
FROM Films f 
join Studio s on s.id =f.Studio_ID 
join Files f2 on f2.Film_ID = f.Trailer_ID 
join Files f3 on f3.Film_ID = f.Poster_ID 
join File_Type ft on ft.id = f2.File_Type_ID 
join File_Type ft1 on ft1.id = f3.File_Type_ID;

	-- Активность пользователей;
CREATE view UserActivity
as
select u.FullName, COUNT(r.id) as 'Рецензий', COUNT(c.id) as 'Комментариев', COUNT(r1.id) as 'Оценено фильмов'
FRom Users u 
join Users_Types ut on ut.id = u.`Type` 
join Review r on r.User_ID = u.id 
join Comments c on c.User_ID = u.id 
join Rating r1 on r.User_ID = u.id
where ut.Name = 'user'
GROUP by u.FullName;

-- п.8 Хранимые процедуры / триггеры;
CREATE Procedure UserActivity
begin
	select u.FullName, COUNT(r.id) as 'Рецензий', COUNT(c.id) as 'Комментариев', COUNT(r1.id) as 'Оценено фильмов'
	FRom Users u 
	join Users_Types ut on ut.id = u.`Type` 
	join Review r on r.User_ID = u.id 
	join Comments c on c.User_ID = u.id 
	join Rating r1 on r.User_ID = u.id
	where ut.Name = 'user'
	GROUP by u.FullName
end;
