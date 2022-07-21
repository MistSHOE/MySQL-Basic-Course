-- CONNECTION: name=localhost
-- Урок № 6

-- Задание № 1 
-- Пусть задан некоторый пользователь.
-- Из всех пользователей соц.сетей.
-- сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

-- выводим все сообщения 
SELECT * FROM messages;
-- считаем сколько сообщений отправил каждый пользователь ользователь
SELECT from_user_id, count(*) FROM messages WHERE from_user_id  GROUP BY from_user_id;
-- смотрим сколько (x) пользователь общался с другими 
SELECT from_user_id, to_user_id FROM messages WHERE from_user_id = 11;
-- считаем какой (x) пользователь, сколько с кем общался 
SELECT from_user_id, to_user_id, count(*) FROM messages WHERE from_user_id = 11 GROUP BY to_user_id;





-- Задание № 2
-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

-- Смотрим все лайки 
SELECT * FROM posts_likes;
-- Считаем сколько всего лайков 
SELECT COUNT(*) FROM posts_likes WHERE user_id; 
-- Находим id пользователей меньше 10 лет 
SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;
-- Считаем общее количество лайков пользователей меньше 10 лет 
SELECT COUNT(*) FROM posts_likes WHERE user_id IN
	(SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10);




-- Задание № 3 
-- Определить кто больше поставил лайков (всего): мужчины или женщины.

-- Находим все профили
SELECT * FROM profiles;
-- Находим всех мужчин и их id
SELECT gender, user_id  FROM profiles WHERE gender = 'm';
-- Находим всех женщин и их id
SELECT gender, user_id  FROM profiles WHERE gender = 'f';
-- Считаем сколько всего полов каждой категории
SELECT gender 'Пол', COUNT(*) 'кол-во' FROM profiles GROUP BY gender; 
-- Считаем сколько всего лайков поставили мужчины
SELECT 'мужчины', COUNT(*) 'кол-во лайков' FROM posts_likes WHERE user_id IN 
	(SELECT user_id  FROM profiles WHERE gender = 'm' AND like_type = 1);
-- Считаем сколько всего лайков поставили женщины 
SELECT 'женщины', COUNT(*) 'кол-во лайков' FROM posts_likes WHERE user_id IN 
	(SELECT user_id  FROM profiles WHERE gender = 'f' AND like_type = 1);

-- считаем кто победил
SELECT 'женщины', 16, 'мужчины', 5, 'итого', 16-5;

