-- Задание 3 
SELECT g.id, g.gender , COUNT(l.id) 
from likes as l
join profiles p2 ON p2.user_id = l.user_id
join gender g ON g.id = p2.gender_id 
group by g.id;

-- Задание 4
SELECT p.user_id, p.birthday, sum(l.user_id) as 'sum'
from profiles p 
join likes l on l.user_id = p.user_id 
group by p.user_id, p.birthday
order by birthday DESC 
limit 3;

-- Задание 5
SELECT p.user_id, SUM(l.user_id) as likes, SUM(m.to_user_id) as messages, SUM(p2.user_id) as postes  
from profiles p 
join likes l on l.user_id = p.user_id 
join messages m on m.to_user_id = p.user_id 
join posts p2 on p.user_id = p.user_id 
GROUP by p.user_id;

