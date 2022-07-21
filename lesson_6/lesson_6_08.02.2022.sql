-- CONNECTION: name=localhost
-- 
-- Модифицируем таблицу friends_requests

CREATE TABLE friend_requests_types
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(128) UNIQUE NOT NULL
);

ALTER TABLE friend_requests DROP COLUMN accepted;

ALTER TABLE friend_requests ADD COLUMN request_type INT UNSIGNED NOT NULL;

ALTER TABLE friend_requests ADD CONSTRAINT fk_friends_types 
FOREIGN KEY (request_type) REFERENCES friend_requests_types (id);

ALTER TABLE friend_requests ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

/*
 * Запрос 1. Выбираем основную информацию пользователя с id=1.
*/
-- Выбираем данные пользователя с id 1

SELECT 
	firstname, 
	lastname,
	'city',
	'profile_photo'
FROM users WHERE id = 1;

SELECT city FROM profiles WHERE user_id = 1;

SELECT 
	firstname, 
	lastname,
	(SELECT city FROM profiles WHERE user_id = 1) AS city,
	'profile_photo'
FROM users WHERE id = 1;

SELECT photo_id FROM profiles WHERE user_id = 1;

SELECT file_name FROM media WHERE id = 1;

SELECT file_name FROM media WHERE id = (SELECT photo_id FROM profiles WHERE user_id = 1);

SELECT 
	firstname, 
	lastname,
	(SELECT city FROM profiles WHERE user_id = 1) AS city,
	(SELECT file_name FROM media WHERE id = (SELECT photo_id FROM profiles WHERE user_id = 1)) AS photo_id
FROM users WHERE id = 1;

SELECT 
	firstname, 
	lastname,
	(SELECT city FROM profiles WHERE user_id = users.id) AS city,
	(SELECT file_name FROM media WHERE id = (SELECT photo_id FROM profiles WHERE user_id = users.id)) AS photo_id
FROM users;
-- WHERE id = 2;

/*
 * Задание 2. Поиск медиафайлов пользователя с id = 1.
*/

SELECT file_name FROM media WHERE user_id = 1 AND media_types_id = 1;

SELECT id FROM media_types WHERE name = 'image';

SELECT file_name FROM media WHERE user_id = 1 AND media_types_id = (SELECT id FROM media_types WHERE name = 'image');

-- 'greenfelder.antwan@example.org'

SELECT id FROM users WHERE email = 'greenfelder.antwan@example.org';

SELECT file_name FROM media WHERE user_id = (SELECT id FROM users WHERE email = 'greenfelder.antwan@example.org') 
	AND media_types_id = (SELECT id FROM media_types WHERE name = 'image');
	
-- если хотим вывести только *.png

SELECT file_name FROM media WHERE file_name LIKE '%.png';

-- если хотим вывести только *.png и *.jpg

SELECT file_name FROM media WHERE user_id = 1 AND (file_name LIKE '%.png' OR file_name LIKE '%.jpg');

/*
 * Задание 3. Посчитаем количество медиафайлов каждого типа.
*/

-- количество всех файлов в таблице media
SELECT COUNT(*) FROM media;

-- считаем количество медиафайлов по каждому типу
SELECT COUNT(*), (SELECT name FROM media_types WHERE id = media_types_id) AS name FROM media GROUP BY media_types_id;

/*
 * Задание 4. Посчитаем количество медиафайлов каждого типа для каждого пользователя.
*/
SELECT COUNT(*), (SELECT name FROM media_types WHERE id = media_types_id) AS name, user_id 
FROM media GROUP BY user_id, media_types_id ORDER BY user_id;

/*
 * Задание 5. Выбираем друзей пользователя с id = 1.
*/

-- выбираем кому пользователь отправил заявки, заявки приняты
SELECT to_user_id FROM friend_requests WHERE from_user_id = 1 AND request_type = 1;

-- выбираем от кого пользователю пришли заявки, заявки приняты
SELECT from_user_id FROM friend_requests WHERE to_user_id = 1 AND request_type = 1;

-- объединяем две группы, чтобы получить всех друзей
SELECT to_user_id FROM friend_requests WHERE from_user_id = 1 AND request_type = 1
UNION
SELECT from_user_id FROM friend_requests WHERE to_user_id = 1 AND request_type = 1;

-- еще один вариант без использования UNION
SELECT DISTINCT IF(to_user_id = 1, from_user_id, to_user_id) AS friends FROM friend_requests
WHERE (to_user_id = 1 OR from_user_id = 1) AND request_type = 1;

/*
 * Задание 6. Выводим имя и фамилию друзей пользователя с id = 1
*/

-- 2,3,5,7,11

SELECT firstname, lastname FROM users WHERE id IN (2,3,5,7,11);

SELECT CONCAT(firstname, ' ', lastname) AS name FROM users WHERE id IN 
	(SELECT to_user_id FROM friend_requests WHERE from_user_id = 1 AND request_type = 1
		UNION
	SELECT from_user_id FROM friend_requests WHERE to_user_id = 1 AND request_type = 1);

-- если не знаем, что accepted тип 1

SELECT id FROM friend_requests_types WHERE name = 'accepted';

SELECT CONCAT(firstname, ' ', lastname) AS name FROM users WHERE id IN 
	(SELECT to_user_id FROM friend_requests WHERE from_user_id = 1 
		AND request_type = (SELECT id FROM friend_requests_types WHERE name = 'accepted')
		UNION
	SELECT from_user_id FROM friend_requests WHERE to_user_id = 1 
		AND request_type = (SELECT id FROM friend_requests_types WHERE name = 'accepted'));
		
SET @request_type_id := (SELECT id FROM friend_requests_types WHERE name = 'accepted');

SELECT @request_type_id;

SELECT CONCAT(firstname, ' ', lastname) AS name FROM users WHERE id IN 
	(SELECT to_user_id FROM friend_requests WHERE from_user_id = 1 
		AND request_type = @request_type_id
		UNION
	SELECT from_user_id FROM friend_requests WHERE to_user_id = 1 
		AND request_type = @request_type_id);
		
/*
 * Задание 7. Выводим красиво информацию о друзьях. Выводим пол, возраст.
*/

-- красиво выводим пол
SELECT 
	CASE(gender)
		WHEN 'f' THEN 'female'
		WHEN 'm' THEN 'male'
		WHEN 'x' THEN 'not defined'
	END AS gender
FROM profiles;

SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age FROM profiles;

SELECT 
	CONCAT(firstname, ' ', lastname) AS name, 
	(SELECT 
		CASE(gender)
			WHEN 'f' THEN 'female'
			WHEN 'm' THEN 'male'
			WHEN 'x' THEN 'not defined'
		END
	FROM profiles WHERE user_id = users.id) AS gender,
	(SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) FROM profiles WHERE user_id = users.id) AS age
FROM users WHERE id IN (
	SELECT to_user_id FROM friend_requests WHERE from_user_id = 1 
		AND request_type = (SELECT id FROM friend_requests_types WHERE name = 'accepted')
		UNION
	SELECT from_user_id FROM friend_requests WHERE to_user_id = 1 
		AND request_type = (SELECT id FROM friend_requests_types WHERE name = 'accepted')
);

/*
 * Задание 8. Выводим все непрочитанные сообщения пользователя с id = 1.
*/
-- выводим все сообщения пользователя
SELECT id, from_user_id, to_user_id, txt, created_at FROM messages WHERE (from_user_id = 1 OR to_user_id = 1);

-- выводим все непрочитанные сообщения из диалогов
SELECT id, from_user_id, to_user_id, txt, created_at 
FROM messages WHERE (from_user_id = 1 OR to_user_id = 1) AND is_delivered = 0 ORDER BY created_at DESC;

-- выводим сверху непрочитанные пользователем с id = 1 сообщения
SELECT from_user_id, to_user_id, txt, created_at 
FROM messages WHERE (from_user_id = 1 OR to_user_id = 1) AND is_delivered = 0 
ORDER BY (from_user_id = 1) ASC, created_at DESC;

