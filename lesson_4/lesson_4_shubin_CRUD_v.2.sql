-- CONNECTION: name=localhost
--  Работа с колонкой таблицы users, добавление, модификаций, удаление 

-- Добавляем колонку с номером паспорта 
ALTER TABLE users ADD COLUMN passport_nuber VARCHAR(10);

-- просмотреть описание 
DESCRIBE users;

-- Изменим ее тип 
ALTER TABLE users MODIFY COLUMN passport_nuber VARCHAR(30);

-- Переименуем колонку 
ALTER TABLE users RENAME COLUMN passport_nuber TO passport;

-- добавим индекс на колонку 
ALTER TABLE users ADD INDEX passport_idx (passport);

-- Удалим индекс на колонке 
ALTER TABLE users DROP INDEX passport_idx;

-- Удалим колонку 
ALTER TABLE users DROP COLUMN passport;

-- улучшение таблицы 
-- добавим ограничение, что отправитель запроса не может быть одновременно получателем 

-- CHECK CONSTRAINTS 
ALTER TABLE friend_requests ADD CONSTRAINT CHECK(from_user_id != to_user_id);

-- добавим ограничение, что номер телефона должен состоять из 11 символов и только цыфр 
-- ссылка на проверку регулярных выражений regex101.com
-- '^[0-9]{11}$'

ALTER TABLE users ADD CONSTRAINT CHECK (REGEXP_LIKE(phone,'^[0-9]{11}$'));

-- Сделаем id photo уникальным 
ALTER TABLE profiles MODIFY COLUMN photo_id BIGINT UNSIGNED DEFAULT NULL UNIQUE;

-- Создадим ограничение ввиде Ключа foreing key на таблицу profiles ссылаемся на таблицу media 
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_media FOREIGN KEY (photo_id) REFERENCES media (id);



-- CRUD - это абривиатура (CREATE READ UPDATE DELETE) ссылка на документацию : dev.mysql.com

-- CREATE  = INSERT 
-- READ = SELECT 
-- UPDATE  = UPDATE
-- DELETE = DELETE

-- просмотреть описание 
DESCRIBE users;

-- добавим пользователя в таблицу 
INSERT users (id, name, surname, email, phone, password_hash, create_at)
VALUES (DEFAULT, 'Ren', 'Tao', 'Taoren@mail.ru', 89255292020, NULL, DEFAULT);

-- Игнорируем ошибки с помощью ключевого слова IGNORE (поможет при внесении в таблицу большого кол-во данных)
INSERT IGNORE users (id, name, surname, email, phone, password_hash, create_at)
VALUES (DEFAULT, 'Ren', 'Tao', 'Taoren@mail.ru', 89255292020, NULL, DEFAULT);

-- Не указываем DEFAULT значение 
INSERT INTO users (name, surname, email, phone)
VALUES ('Maks', 'SEVEN', 'seven@mail.ru', 89552557575);

-- Явно укажем id  таблице 
INSERT INTO users(id, name, surname, email, phone)
VALUES (10, 'Dima', 'Volkov', 'volkov@mail.ru', 89008007060);

-- не указываем название колонки (Добавиться если будет полное соответствие по количеству данных)
INSERT INTO users 
VALUES (9, 'Nikita', 'Lobov', 'nikita_lobov@mail.ru', 89877898978, NULL, DEFAULT);

-- добавим сразу много пользователей (Пакетная вставка данных)
-- INSERT можно подобрать под тип данных 
INSERT INTO users(name, surname, email, phone)
VALUES ('Gabriel', 'Norris','Gabriel_Norris9236@fuliss.net', 11601018244)
,('Chris', 'Jenkin', 'Chris_Jenkin8777@kideod.biz', 14505713104)
,('Michaela', 'Oswald','Michaela_Oswald4775@kideod.biz', 71308808836);

-- добавляем через SET
INSERT users 
SET
	name = 'Ira',
	surname = 'Krasiva',
	email = 'ira@mail.ru',
	phone = '89664558796';

-- уберем ограничение users
ALTER TABLE users DROP CONSTRAINT users_chk_1;

-- выберем другу базу данных и ввыведем нужные нам значения из нее 
SELECT name, surname, email, phone FROM test1.users;
-- Заберем из баззы данныйх test1 данные в нужные нам столбцы базы users
-- Пропишим игнор, если будет повтор или дублирование информации
INSERT IGNORE INTO users (name, surname, email, phone)
SELECT name, surname, email, phone FROM test1.users;

-- SELECT очень функционален малые примеры 
SELECT 'hello world';

SELECT 5 + 5 * 5 / 5 - 5;

-- можно выбрать определенные столбцы в базе 
SELECT name FROM users;
-- можно выбрать только уникальные с помощье DISTINCT
SELECT DISTINCT name FROM users; 
-- Можно выбрать пользователя с оgределенными данными c помощью WHERE 
SELECT * FROM users WHERE name = 'Аноним';
-- Так же можно совмещать условия с помощью OR 
SELECT * FROM users WHERE name = 'Аноним' OR name = 'Ostap' OR name = 'Ольга' OR name = 'Ira';
-- Так же работают операторы сравнения больше, меньше, равно.
SELECT * FROM users WHERE id >= 100;
-- Так же можно совмещать условия с помощью AND
SELECT * FROM users WHERE id >= 10 AND id <= 27;

-- Есть возможность работы с поиском по конструкции NULL c помощью оператора IS или IS NOT
-- помним что NULL нечему не равна
SELECT * FROM users WHERE password_hash IS NULL;
SELECT * FROM users WHERE password_hash IS NOT NULL;


-- Работа со столбцами 
-- Выводим одну букву имени 
SELECT surname, SUBSTR(name, 1, 1) FROM users;
-- Объединим два столбца таблицы
SELECT CONCAT(surname, '. ', SUBSTR(name, 1, 1)) FROM users;

-- Делаем сортировку ORDER BY и делаем по алфавиту ASC
SELECT  * FROM users ORDER BY surname ASC;
-- Делаем сортировку ORDER BY и делаем по алфавиту в обратном порядке DESC
SELECT  * FROM users ORDER BY surname DESC;



-- Работа с командой UPDATE 
-- ссылка на документацию www.dev.mysql.com/doc/refman/8.0/en/update.html
INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES (40, 55, 'Приветствую');
INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES (40, 55, 'Ты тут ?');
SELECT * FROM messages;

-- Работа с командой UPDATE 
-- меняем текст сообщения с условиями 
UPDATE messages 
SET txt = 'Эребор везде'
WHERE id = 6;
-- Опасный запрос без условия 
UPDATE messages 
SET is_dilivered = 1;


-- Работа с командой DELETE и TRUNCATE
SELECT * FROM users;
-- удаление с условием 
DELETE FROM users WHERE surname = 'Величико';
-- удаление всей таблицы 
SELECT * FROM messages;
DELETE FROM messages;

-- Команда TRUNCATE она удаляет и создает заного таблицу 
-- таким образов все счетчики обнулсяться  