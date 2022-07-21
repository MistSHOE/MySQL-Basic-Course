-- CONNECTION: name=localhost

SELECT * FROM users;

 -- Задание №1 Пусть в таблице users поля created_at и updated_at оказались незаполненными.
 -- Заполните их текущими датой и временем.

UPDATE users 
SET updated_at = CURRENT_TIMESTAMP(), 
	created_at = CURRENT_TIMESTAMP();

-- Задание № 2 Таблица users была неудачно спроектирована.  
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

ALTER TABLE users 
MODIFY COLUMN created_at varchar(150),
MODIFY COLUMN updated_at varchar(150);


ALTER TABLE users 
MODIFY COLUMN created_at DATETIME,
MODIFY COLUMN updated_at DATETIME;


-- Задание № 3 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.


SELECT * FROM storehouses_products;

INSERT INTO storehouses_products (id, storehouse_id, product_id, value, created_at, updated_at) 
VALUES
	(DEFAULT, 1, 1, 2, DEFAULT, DEFAULT),
	(DEFAULT, 2, 2, 10, DEFAULT, DEFAULT),
	(DEFAULT, 3, 3, 50, DEFAULT, DEFAULT),
	(DEFAULT, 4, 4, 100, DEFAULT, DEFAULT),
	(DEFAULT, 5, 5, 0, DEFAULT, DEFAULT);
	
SELECT * FROM storehouses_products ORDER BY value OR value = 0 DESC;

-- Задание № 4 (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
--  Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT * FROM users;
SELECT * FROM users ORDER BY 
