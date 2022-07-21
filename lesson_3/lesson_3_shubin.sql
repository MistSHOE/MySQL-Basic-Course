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
	