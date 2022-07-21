-- Поработаем с колонкой таблицы users, добавлением, модификацией, удалением
-- https://dev.mysql.com/doc/refman/8.0/en/alter-table.html
-- Добавим колонку с номером паспорта
ALTER TABLE users ADD COLUMN passport_number VARCHAR(10);

DESCRIBE users;

-- Изменим ее тип
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR(20);

-- Переименуем ее
ALTER TABLE users RENAME COLUMN passport_number TO passport;

-- Добавим индекс на колонку
ALTER TABLE users ADD INDEX passport_idx (passport);

-- Удалим индекс
ALTER TABLE users DROP INDEX passport_idx;

-- Удалим колонку
ALTER TABLE users DROP COLUMN passport;

-- совершенствуем таблицу дружбы
-- добавляем ограничение, что отправитель запроса на дружбу 
-- не может быть одновременно и получателем

-- CHECK CONSTRAINTS 
ALTER TABLE friend_requests ADD CONSTRAINT CHECK(from_user_id != to_user_id);
-- https://regex101.com/
-- добавляем ограничение, что номер телефона должен состоять из 11
-- символов и только из цифр

ALTER TABLE users ADD CONSTRAINT check_phone CHECK(REGEXP_LIKE(phone, '^[0-9]{11}$'));

-- делаем id photo пользователей уникальными
ALTER TABLE profiles MODIFY COLUMN photo_id BIGINT UNSIGNED DEFAULT NULL UNIQUE;

-- делаем foreign key на media
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_media FOREIGN KEY (photo_id) REFERENCES media (id);

/* 
  C - Create = INSERT
  R - Read   = SELECT
  U - Update = UPDATE
  D - Delete = DELETE
*/

/*
 * INSERT
 * https://dev.mysql.com/doc/refman/8.0/en/insert.html
 */

DESCRIBE users;

-- добавляем пользователя
INSERT users (id, firstname, lastname, email, phone, password_hash, created_at) 
VALUES (DEFAULT, 'Alex', 'Stepanov','alex@mail.com','89213546566', NULL, DEFAULT);

-- добавляем повторно того же пользователя, ошибка не возникает
INSERT IGNORE users (id, firstname, lastname, email, phone, password_hash, created_at) 
VALUES (DEFAULT, 'Alex', 'Stepanov','alex@mail.com','89213546566', NULL, DEFAULT);

-- не указываем default значения
INSERT INTO users (firstname, lastname, phone, email) 
VALUES ('Lena', 'Stepanova','89213546568','lena@mail.com');

-- явно задаем id
INSERT INTO users (id, firstname, lastname, email, phone) 
VALUES (55, 'Jane', 'Kvanov', 'jane@mail.com', '89293546560');

-- не указываем названия колонок
INSERT INTO users 
VALUES (44, 'Jane', 'Night', 'jane_n@mail.com', '89293946560', NULL, DEFAULT);

-- Column count doesn't match value count at row 1
-- INSERT INTO users 
-- VALUES (45, 'Jane', 'Night', 'jane_n1@mail.com', '89193946560');

-- добавляем несколько пользователей
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Igor', 'Petrov', 'igor@mail.com', '89213549560'),
('Oksana', 'Petrova', 'oksana@mail.com', '89213549561');

-- добавляем через SET
INSERT users 
SET 
	firstname = 'Iren',
	lastname = 'Sidorova',
	email = 'iren@mail.com',
	phone = '89213541560';


-- удаляем ограничение с проверкой телефона
ALTER TABLE users DROP CONSTRAINT check_phone;

-- выбиваем всё из таблицы users БД test1
SELECT * FROM test1.users;

-- выбиваем имя, фамилию, email, телефон из таблицы users БД test1
SELECT name, surname, email, phone FROM test1.users;

-- добавляем данные из таблицы users БД test1 в users в БД vk
INSERT IGNORE INTO users (firstname, lastname, email, phone)
SELECT name, surname, email, phone FROM test1.users;

SELECT * FROM users;

/*
 * SELECT
 * https://dev.mysql.com/doc/refman/8.0/en/select.html
 */

-- выбираем константы
SELECT 'Hello!';

SELECT 178 + 567;

-- выбираем все поля users
SELECT * FROM users;

-- выбираем столбцы с фамилией, именем и телефоном
SELECT firstname, lastname, phone FROM users;

-- выбираем только уникальные имена
SELECT DISTINCT lastname FROM users;

-- выбираем пользователей с именем Аноним
SELECT * FROM users WHERE firstname = 'Аноним';

-- выбираем пользователей с именем Ольга
SELECT * FROM users WHERE firstname = 'Ольга';

-- выбираем пользователей с именем Ольга или Олег
SELECT * FROM users WHERE firstname = 'Ольга' OR firstname = 'Олег';

-- выбираем пользователей с id больше 10
SELECT * FROM users WHERE id > 10;

-- выбираем пользователей с id больше или равным 85 и меньше или равным 100
SELECT * FROM users WHERE id >= 85 AND id <= 100;

-- аналогично предыдущему запросу
SELECT * FROM users WHERE id BETWEEN 85 AND 100;

-- выбираем пользователей без фото в профиле
SELECT * FROM profiles WHERE photo_id IS NULL;

-- выбираем пользователей с фото в профиле
SELECT * FROM profiles WHERE photo_id IS NOT NULL;

-- соединяем имя и фамилию с помощью CONCAT, оставляет от имени только первую букву с помощью SUBSTR
-- задаем псевдоним username для столбца
SELECT CONCAT(lastname, ' ', SUBSTR(firstname, 1, 1), '.') AS username, phone FROM users;

-- выбираем четырёх пользователей
SELECT * FROM users LIMIT 4;

-- выбираем 5 пользователей, пропускаем первых 10
SELECT * FROM users LIMIT 5 OFFSET 10;

-- аналогично предыдущему запросу
SELECT * FROM users LIMIT 10, 5;

-- Сортировка по фамилии по возрастанию
SELECT * FROM users ORDER BY lastname ASC;

-- Сортировка по фамилии по убыванию
SELECT * FROM users ORDER BY lastname DESC;

/*
 * UPDATE
 * https://dev.mysql.com/doc/refman/8.0/en/update.html 
*/

-- добавляем несколько сообщений
INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES (44, 55, 'Hi!');

INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES (44, 55, 'I hate you');

SELECT * FROM messages;

-- меняем текст сообщения
UPDATE messages 
SET txt = 'I love you'
WHERE id = 6;

UPDATE messages 
SET is_delivered = 1;

/*
 * DELETE
 * https://dev.mysql.com/doc/refman/8.0/en/update.html 
 * TRUNCATE
 * https://dev.mysql.com/doc/refman/8.0/en/truncate-table.html
*/

SELECT * FROM users WHERE lastname = 'Stepanov';

-- удаляем пользователя с фамилией Stepanov
DELETE FROM users WHERE lastname = 'Stepanov';

-- удаляем все строки из messages
DELETE FROM messages;

-- удаляем всё из messages
-- TRUNCATE TABLE messages;

SELECT * FROM messages;

-- Пытаемся удалить пользователя с id = 1
-- Но это не получится, так как есть информация, связанная с ним в дочерних таблицах (сообщения, сообщества и т.д)
DELETE FROM users WHERE id = 1;

-- удаляем всё из friend_requests
TRUNCATE TABLE friend_requests;

SELECT * FROM friend_requests;

-- Пытаемся очистить таблицу users от данных
-- Но это не получится, так как есть информация, связанная с ним в дочерних таблицах (сообщения, сообщества и т.д)
TRUNCATE TABLE users;


-- Домашнее задание
-- i. Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице)

-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
-- 1) ALTER TABLE is_active
-- 2) UPDATE ... 
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
-- TIMESTAMPDIFF()

-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
-- DELETE 

-- v. Написать название темы курсового проекта (в комментарии)