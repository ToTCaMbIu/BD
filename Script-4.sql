-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
-- Задание 1
UPDATE users 
set created_at = NOW() and updated_at = NOW();

-- Задание 2
UPDATE users
SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
    updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Задание 3
SELECT * FROM storehouses_products
ORDER BY CASE WHEN value = 0 then 2 else 1 end, value;

-- Задание 4
SELECT * from users u where DATE_FORMAT(birthday_at) 

-- Практическое задание теме «Агрегация данных»
-- Задание 1
SELECT AVG((year(NOW()) - YEAR(birthday_at))) as avg_age from users u 

-- Задание 2
select DAYNAME(birthday_at) as day_name, COUNT(*) 
from users u 
group by day_name