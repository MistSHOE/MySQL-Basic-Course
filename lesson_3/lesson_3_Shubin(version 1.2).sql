-- CONNECTION: name=localhost
DROP DATABASE IF EXISTS myface;

CREATE DATABASE IF NOT EXISTS myface;

-- Использовать БД
USE myface;

-- показать таблицу
SHOW TABLES;

-- создать таблицу 
CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(150) NOT NULL,
	surname VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	phone CHAR(11) NOT NULL,
	password_hash CHAR(65) DEFAULT NULL,
	create_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- заполним таблицу 
INSERT INTO users VALUES (1, 'Ostap', 'Shubin', 'OstapShubin@mail.ru', '89999999999', DEFAULT, DEFAULT);
INSERT INTO users VALUES (DEFAULT, 'Andrey', 'Lobzov', 'andrey@mail.ru', '89889889898', DEFAULT, DEFAULT);

-- Посмотрим на содержимое таблицы 
SELECT * FROM users; 

-- описание таблицы 
DESCRIBE users; 

-- просмотреть код создание нужной таблицы 
SHOW CREATE TABLE users;


CREATE TABLE profiles (
	user_id BIGINT UNSIGNED PRIMARY KEY,
	gender ENUM ('F', 'M', 'X') NOT NULL,
	birthday DATE NOT NULL,
	photo_id BIGINT UNSIGNED, 
	country VARCHAR(100),
	city VARCHAR(100),
	
	-- свзять между таблицами 
	FOREIGN KEY (user_id) REFERENCES users(id)
	);
	
-- Заполним таблицу 
INSERT INTO profiles VALUES (1, 'M', '1994-09-26', NULL, 'Moscow', 'Russia');
INSERT INTO profiles VALUES (2, 'M', '1990-12-22', NULL, 'Moscow', 'Russia');

-- Посмотрим на содержимое таблицы 
SELECT * FROM profiles; 


-- создаем таблицу 
CREATE TABLE messages(
-- SERIAL = BIGINT UNSIGNED AUTO_INCREMENT NOT NULL
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	txt TEXT NOT NULL,
	is_dilivered BOOLEAN DEFAULT FALSE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (from_user_id),
	INDEX (to_user_id),
	INDEX (created_at),
	
	-- свзять между таблицами 
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
	);
	
-- Добавим сообщение от 1 к 2 
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Hello', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Ты второй? )', DEFAULT, DEFAULT, DEFAULT);
-- просмотреть сообщение 
SELECT * FROM messages;

-- Добавим сообщение от 2 к 1 
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Hello', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Да верно, я второй', DEFAULT, DEFAULT, DEFAULT);

-- просмотреть сообщение 
SELECT * FROM messages;


-- создаем таблицу 
CREATE TABLE friend_requests(
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	accepted BOOL DEFAULT FALSE,
	PRIMARY KEY (from_user_id, to_user_id),
	CONSTRAINT fk_friend_requests_from_user_id FOREIGN KEY (from_user_id) REFERENCES users (id),
	CONSTRAINT fk_friend_requests_to_user_id FOREIGN KEY (to_user_id) REFERENCES users (id)	
);


-- Добавим запрос на дружбу 
INSERT INTO friend_requests VALUES (1, 2, TRUE);

-- просмотреть запрос 
SELECT * FROM friend_requests;

-- проверим ограничение по запросу 
INSERT INTO friend_requests VALUES (2, 1, DEFAULT);

-- добавим запрос на дружбу от 2 пользователя 
INSERT INTO friend_requests VALUES (2, 1, TRUE);

-- создаем таблицу 
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	description VARCHAR(255),
	admin_id BIGINT UNSIGNED NOT NULL,
	INDEX (name),
	FOREIGN KEY (admin_id) REFERENCES users (id)
);

-- добавим сообщество с создателем 1
INSERT INTO communities VALUES (DEFAULT, 'Group_1', '1 сообщество в MyFace', 1);
INSERT INTO communities VALUES (DEFAULT, 'Group_2', 'Второе сообщество в MyFace', 1);

-- просмотреть таблицу communities
SELECT * FROM communities;

-- Создаем таблицу связей пользователь сообщество 
CREATE TABLE communities_users(
	communities_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	create_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(communities_id, user_id),
	FOREIGN KEY (communities_id) REFERENCES communities (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

-- добавим пользователя в сообщество 
INSERT INTO communities_users VALUES (1, 2, DEFAULT);


-- создаем таблицу с media_types
CREATE TABLE media_types(
	id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE 
);

-- добавим типы данных в каталог media 
INSERT INTO media_types VALUES (DEFAULT, 'изображения');
INSERT INTO media_types VALUES (DEFAULT, 'документы');
INSERT INTO media_types VALUES (DEFAULT, 'музыка');
INSERT INTO media_types VALUES (DEFAULT, 'видео');

-- просмотреть таблицу media_types
SELECT * FROM media_types;

CREATE TABLE media (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL, 
	media_types_id INT UNSIGNED NOT NULL,
	file_name VARCHAR(255) COMMENT 'F:\info_database',
	file_size BIGINT UNSIGNED,
	create_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (media_types_id) REFERENCES media_types (id)
);

-- Добавим два изображения от 1 пользователя 
INSERT INTO media VALUES (DEFAULT, 1, 1, '1.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, '2.png', 200, DEFAULT);

-- Добавим два документа от 2 пользователя
INSERT INTO media VALUES (DEFAULT, 2, 2, 'Документ.txt', 100, DEFAULT);
 
-- просмотреть таблицу 
SELECT * FROM media;
