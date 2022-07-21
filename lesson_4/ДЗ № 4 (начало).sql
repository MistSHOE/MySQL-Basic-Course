-- i. Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице)
-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
-- v. Написать название темы курсового проекта (в комментарии)



-- 1 Задание 
-- i. Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице)
SELECT * FROM users; -- готово
SELECT * FROM profiles; -- готово
SELECT * FROM messages; -- готово
SELECT * FROM media_types; -- готово
SELECT * FROM media; -- готово
SELECT * FROM friend_requests; -- готово
SELECT * FROM communities_users; -- готово
SELECT * FROM communities; -- готово


-- USERS
SELECT * FROM users;

DELETE FROM users WHERE id >= 26;
-- PROFILES
SELECT * FROM profiles; 

INSERT INTO `profiles` VALUES 
(6,'M','1987-06-22',NULL,'Moscow','Russia'),
(10,'M','2001-04-27',NULL,'Moscow','Russia'),
(11,'F','1994-05-29',NULL,'Moscow','Russia'),
(12,'M','2000-07-17',NULL,'Moscow','Russia'),
(13,'F','1973-10-11',NULL,'Moscow','Russia'),
(14,'F','1983-11-19',NULL,'Moscow','Russia'),
(15,'M','1996-06-24',NULL,'Moscow','Russia'),
(16,'F','1970-07-09',NULL,'Moscow','Russia'),
(17,'F','1984-07-25',NULL,'Moscow','Russia'),
(18,'M','2000-03-09',NULL,'Moscow','Russia'),
(19,'M','2005-08-09',NULL,'Moscow','Russia'),
(20,'M','1977-08-16',NULL,'Moscow','Russia'),
(22,'M','1998-01-09',NULL,'Moscow','Russia'),
(23,'M','1985-02-10',NULL,'Moscow','Russia'),
(24,'F','2006-07-12',NULL,'Moscow','Russia'),
(25,'M','1992-10-12',NULL,'Moscow','Russia')
;
-- MESSAGES
SELECT * FROM messages;

INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES (10, 11, 'Приветствую');
INSERT INTO messages (from_user_id, to_user_id, txt)
VALUES (10, 11, 'Ты тут ?');

INSERT IGNORE INTO messages (from_user_id, to_user_id, txt)
VALUES (1, 2, 'Temporibus exercitationem tenetur voluptatem aut cum. Excepturi ea sapiente repellendus rerum dolor neque. Maiores in impedit aut sapiente quasi minus.'),
(2, 1, 'Corrupti eaque rerum quo ut. Ipsam dolorum nobis praesentium eum eos asperiores. Cumque maiores non harum ducimus et.'),
(4, 6, 'Cupiditate tempore nesciunt et quas aut qui neque magni. Ducimus officiis beatae quas est voluptatibus. Voluptas qui in ex eius illo.'),
(10, 11, 'Similique voluptas deleniti ipsum. Sint corporis qui rem aut quo aspernatur eius. Quidem repudiandae et iure et illum et. Sunt et sed quidem expedita. Accusamus dicta quae vel iste.'),
(12, 13, 'Itaque in labore quia explicabo ex nobis fuga optio. Et non omnis sunt voluptatibus ullam consectetur. Tempora provident aperiam tenetur. Praesentium error sed et rerum rem incidunt et.'),
(14, 15, 'Qui accusantium voluptas voluptatem earum sint impedit. At sit non ipsa dolor eos dolorem. Perspiciatis aut ut voluptas doloremque accusamus. At optio totam quo facere nisi libero veniam.'),
(14, 1, 'Temporibus nihil excepturi consectetur corporis rerum. Qui ducimus sint sed vitae eum. Enim sit omnis assumenda repellat in quidem in maxime.'),
(16, 17,'Iure id nostrum eaque fugit praesentium. Ipsum aut dolor adipisci ipsa non sunt deleniti. Laboriosam iste ea doloribus sequi dolor quam consequatur.'),
(17, 16, 'Quas voluptas deserunt vel eum dicta voluptatem aspernatur dolores. Est autem dolores tempora nemo eligendi. Id soluta fuga et nihil quia consequatur qui. Suscipit consequatur consequatur quia sunt.'),
(18, 19, 'Delectus ex tenetur et voluptas at et aliquid et. Eos aut quo soluta est et voluptas mollitia. Iure rem temporibus vel vel est distinctio et. Aut ut vel nemo accusamus adipisci.'),
(20, 22,'Ut quos ut explicabo aut. Numquam praesentium excepturi quia at eos. Velit at unde illum porro hic quibusdam expedita. A reiciendis autem hic.'),
(22, 20, 'Doloribus aut quos facere quis vel maxime consequatur. Optio dolores quia animi ut enim enim.'),
(23, 24, 'Quia blanditiis iusto dolorem qui nobis. Qui in qui et. Commodi temporibus sed velit nam.'),
(24, 23,'Asperiores fuga sed ratione est. Et sint rerum placeat consequatur qui quam. Autem ipsum qui repellat vitae illum tenetur nihil ut.'),
(25, 19, 'Id doloribus vel officia mollitia aut ad et. Qui sit iste molestiae reprehenderit et consequatur. Rerum velit dolorem corporis a placeat minus et. Ab beatae et commodi earum est labore expedita.'),
(19, 25,'Dolores id sapiente quaerat deserunt qui quis. Omnis deserunt velit nostrum quis. Ut rem voluptas reprehenderit modi exercitationem rerum ut asperiores. Magni eos ut harum cumque.'),
(1, 14, 'Minus rem quasi aliquid et qui. Aspernatur praesentium libero tempore vero nihil. Delectus et natus dolorum qui sed.'),
(14, 1, 'Quod qui laboriosam et ullam voluptas tempore voluptas. Consectetur eos esse tempore est. A illum voluptates et voluptate quis quaerat quos corrupti. Omnis fugit quidem ut distinctio.'),
(4, 19, 'Et voluptatem ratione dolores repellendus ut quae totam. Quae distinctio reprehenderit id ea debitis. Vel quis molestias natus incidunt qui quisquam. Maxime quia saepe commodi voluptates.'),
(19, 4, 'Est modi optio et ullam excepturi deleniti soluta. Ducimus eius non excepturi. Occaecati in dolorum quis laudantium harum corrupti iusto perspiciatis.'),
(12, 1, 'Aut dignissimos inventore omnis delectus aliquam. Maiores esse at delectus recusandae hic quo repellat. Natus velit eveniet consequatur consectetur quaerat minima libero. Consectetur consequatur eligendi fugit atque.')
;

-- MEDIA_TYPES и MEDIA
SELECT * FROM media_types;
-- все типы данных учтены.

SELECT * FROM media;
INSERT INTO media 
VALUES (DEFAULT, 4, 1, 'avatar_1.jpg', 100, DEFAULT),
(DEFAULT, 6, 2, 'Документ_1.txt', 100, DEFAULT),
(DEFAULT, 10, 2, 'Документ_2.txt', 100, DEFAULT),
(DEFAULT, 12, 2, 'Документ_3.txt', 100, DEFAULT),
(DEFAULT, 13, 2, 'Документ_4.txt', 100, DEFAULT),
(DEFAULT, 14, 2, 'Документ_5.txt', 100, DEFAULT),
(DEFAULT, 15, 1, 'avatar_2.jpg', 100, DEFAULT),
(DEFAULT, 16, 1, 'avatar_3.jpg', 100, DEFAULT),
(DEFAULT, 17, 1, 'avatar_4.jpg', 100, DEFAULT),
(DEFAULT, 18, 1, 'avatar_5.jpg', 100, DEFAULT),
(DEFAULT, 19, 1, 'avatar_6.jpg', 100, DEFAULT),
(DEFAULT, 20, 1, 'avatar_7.jpg', 100, DEFAULT),
(DEFAULT, 22, 3, 'music_1.mp3', 100, DEFAULT),
(DEFAULT, 23, 3, 'music_2.mp3', 100, DEFAULT),
(DEFAULT, 24, 3, 'music_3.mp3', 100, DEFAULT),
(DEFAULT, 25, 4, 'video_1.avi', 100, DEFAULT),
(DEFAULT, 1, 4, 'video_2.avi', 100, DEFAULT)
;

-- FRIEND_REQUESTS
SELECT * FROM friend_requests;

INSERT INTO friend_requests 
VALUES (2, 4, TRUE),
(4, 6, TRUE),
(6, 10, TRUE),
(10, 11, TRUE),
(11, 12, TRUE),
(12, 13, TRUE),
(13, 14, TRUE),
(1, 14, TRUE),
(15, 16, TRUE),
(16, 17, TRUE),
(18, 19, TRUE),
(20, 22, TRUE),
(22, 23, TRUE),
(23, 24, TRUE),
(24, 25, TRUE),
(25, 1, TRUE),
(24, 1, TRUE),
(1, 20, TRUE),
(1, 19, TRUE),
(1, 16, TRUE),
(1, 12, TRUE)
;


-- COMMUNITIES
SELECT * FROM communities;

INSERT IGNORE INTO communities
VALUES 
(4, 'Rutrum Magna Cras Associates', 'id nunc interdum feugiat. Sed nec metus facilisis lorem tristique', 1),
(5, ' Tortor Nunc Associates', '"ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus"', 2),
(6, 'Nullam Enim PC', '"dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque"', 3),
(7, 'Donec Sollicitudin LLC', 'mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin', 4),
(8, 'Neque Vitae Institute', 'a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam', 5),
(9, 'Ullamcorper Magna Institute', '"arcu iaculis enim, sit amet ornare lectus justo eu arcu."', 6),
(10, 'Sociis LLC', '"lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus"', 7),
(11, 'Lorem Institute', '"nunc risus varius orci, in consequat enim diam vel arcu."', 8),
(12, 'Sapien Nunc Pulvinar LLC', '"dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent"', 9),
(13, 'Odio Semper Cursus Incorporated', 'cursus purus.Nullam scelerisque neque sed sem egestas blandit. Nam', 10),
(14, 'Libero Lacus Inc.', '"gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum"', 11),
(15, 'Ligula Aenean Inc.', 'Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla', 12),
(16, 'Euismod Urna LLP', '"dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam"', 13),
(17, 'Justo Nec LLP', '"felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem,"', 14),
(18, 'Eget Odio Institute', '"dictum eleifend, nunc risus varius orci, in consequat enim diam"', 15),
(19, 'Eleifend Cras Sed Corp.', 'ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et', 16),
(20, 'Arcu Corporation', '"dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,"', 17),
(21, 'Auctor Vitae Aliquet Limited', '"in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer"', 18),
(22, 'Hendrerit Consulting', 'vitae mauris sit amet lorem semper auctor. Mauris vel turpis.', 19)
;

-- COMMUNITIES_USERS
SELECT * FROM communities_users;

INSERT IGNORE INTO communities_users 
VALUES
(1, 4, DEFAULT),
(1, 5, DEFAULT),
(1, 6, DEFAULT),
(1, 7, DEFAULT),
(1, 8, DEFAULT),
(1, 9, DEFAULT),
(1, 10, DEFAULT),
(1, 11, DEFAULT),
(1, 12, DEFAULT),
(1, 13, DEFAULT),
(1, 14, DEFAULT),
(1, 15, DEFAULT),
(1, 16, DEFAULT),
(1, 17, DEFAULT),
(1, 18, DEFAULT),
(1, 19, DEFAULT),
(1, 20, DEFAULT),
(1, 22, DEFAULT),
(1, 23, DEFAULT),
(1, 25, DEFAULT),
(1, 25, DEFAULT)
;


-- Задание 2
-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке








DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` VALUES ('1','1','unfriended','2019-11-25 12:17:40','2014-02-27 12:25:06'),
('2','2','declined','1987-10-22 08:28:13','1995-11-19 19:30:52'),
('3','3','declined','2009-04-16 22:06:59','1988-07-18 06:52:04'),
('4','4','requested','1978-10-05 04:47:43','1970-05-27 10:50:56'),
('5','5','approved','2008-10-15 03:03:48','2012-10-17 09:04:25'),
('6','6','declined','2017-12-23 23:40:22','1987-12-15 16:32:30'),
('7','7','requested','2009-03-25 06:53:23','2000-10-04 10:04:56'),
('8','8','requested','2007-06-18 04:46:26','2001-01-20 14:45:00'),
('9','9','approved','1977-04-26 12:07:09','1972-11-01 16:34:57'),
('10','10','unfriended','2005-12-28 02:26:22','2016-03-14 07:39:26'),
('11','11','requested','1971-01-16 14:31:49','2001-06-02 11:00:37'),
('12','12','approved','1972-11-10 23:11:49','1978-05-30 23:23:32'),
('13','13','approved','2004-03-14 18:21:00','2008-05-10 01:39:53'),
('14','14','requested','1992-11-16 16:27:34','1997-11-06 17:25:14'),
('15','15','unfriended','2001-02-13 14:14:35','2002-02-04 01:20:42'),
('16','16','approved','1995-02-26 21:20:21','1979-11-15 19:40:57'),
('17','17','approved','1996-05-12 22:58:36','1991-05-07 18:25:49'),
('18','18','requested','1984-09-09 12:54:03','1996-11-30 14:13:36'),
('19','19','requested','1983-10-18 04:39:50','1983-12-30 21:01:32'),
('20','20','declined','1986-07-18 08:33:05','1992-08-03 12:19:17'),



DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','1983-11-28 22:57:34'),
('2','2','2','1978-08-31 18:09:48'),
('3','3','3','1989-05-30 19:08:24'),
('4','4','4','1990-09-20 06:06:34'),
('5','5','5','1996-06-16 13:30:19'),
('6','6','6','1973-10-31 07:49:54'),
('7','7','7','2003-04-01 23:37:28'),
('8','8','8','1972-03-10 10:17:00'),
('9','9','9','1977-10-07 11:31:07'),
('10','10','10','1975-08-17 08:34:20'),
('11','11','11','2008-02-07 14:22:31'),
('12','12','12','1999-08-25 13:21:05'),
('13','13','13','2000-11-12 03:11:49'),
('14','14','14','1981-04-22 20:47:45'),
('15','15','15','1995-01-04 20:53:11'),
('16','16','16','1977-09-13 00:17:18'),
('17','17','17','2001-02-04 13:39:06'),
('18','18','18','1990-04-07 16:27:19'),
('19','19','19','2013-10-11 15:52:22'),
('20','20','20','2009-09-26 19:42:25');

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Consequatur laudantium et quasi. Error sunt harum suscipit itaque veniam corrupti.','sequi','3489315',NULL,'1989-08-02 08:39:50','1977-11-29 16:20:16'),
('2','2','2','Omnis commodi porro voluptates non. Quod doloribus eligendi in rerum officiis nemo est ducimus. Ex quisquam autem et occaecati explicabo dolor aut. Qui et consequatur aut ex eius dolores.','ducimus','8502153',NULL,'2008-12-23 09:27:38','2012-02-15 04:29:03'),
('3','3','3','Rerum quibusdam quia qui eveniet. Maiores nemo reiciendis voluptatum perspiciatis. Facilis perspiciatis quia dolor dolor et commodi mollitia in. Consequatur provident dolore rerum similique eaque.','ut','119',NULL,'2007-01-23 02:10:31','2000-10-22 07:30:52'),
('4','4','4','Voluptatem sit sint adipisci nostrum rerum molestiae. Facere illo aut asperiores dolor ut ex omnis. Autem quos modi suscipit saepe. Aut unde et natus autem quae accusantium. Repudiandae omnis cumque consectetur dolores ut aspernatur esse.','ad','68',NULL,'1979-08-30 06:41:35','1998-05-30 00:52:02'),
('5','5','5','Ut recusandae ut sint laudantium nisi. Qui qui impedit a tempore voluptas explicabo necessitatibus nihil.','est','977902',NULL,'2019-04-19 19:25:44','2019-03-05 01:56:25'),
('6','6','6','Tenetur iste sunt qui dolorem adipisci. Impedit numquam facilis provident quidem. Consequatur sed ab at.','non','47469463',NULL,'1973-01-30 22:00:44','2018-03-15 15:52:12'),
('7','7','7','In delectus illum eligendi soluta. Quia in culpa eos quas ut. Quidem dolor quia vero odio. Sed labore enim aut quas corporis quo cupiditate.','quia','74',NULL,'1998-09-27 15:37:30','2004-03-20 12:38:21'),
('8','8','8','Facilis quibusdam et quia libero. Porro quasi officiis quo harum. Id fugiat doloremque aliquam nihil beatae.','quibusdam','813071449',NULL,'1991-08-28 12:46:31','1993-05-31 11:03:40'),
('9','9','9','Explicabo accusantium deleniti quos distinctio. Qui reiciendis magnam dolor a corrupti sit ipsum modi. Sit error cumque molestias aspernatur reprehenderit facilis. Pariatur quam nihil ut temporibus nihil.','quis','289',NULL,'1975-02-08 11:09:15','2013-08-10 02:50:15'),
('10','10','10','Quia ullam quo sed voluptatum molestiae aut omnis. Velit et voluptates et et. Autem ipsum aliquid quia libero quaerat sint.','nam','888858',NULL,'1995-06-12 19:51:11','1978-01-11 14:02:57'),
('11','11','11','Aut sunt et non amet et modi autem. Odit accusantium id necessitatibus eos asperiores. Est eligendi autem sunt laudantium facilis autem quis.','tenetur','3866',NULL,'2010-08-24 09:21:58','1970-03-28 11:50:06'),
('12','12','12','In aliquam expedita quia sint. Fugit neque culpa sit ipsum recusandae fugit nisi. Est culpa officia officia. Animi accusamus pariatur et et. Distinctio animi tempore exercitationem non in quia eligendi.','accusamus','7489632',NULL,'2009-06-28 08:58:56','2016-12-22 04:49:23'),
('13','13','13','Incidunt beatae neque debitis aliquid. Est dolorem aut deserunt dolores dolor et. Quas aliquid est itaque non. Libero nemo veniam molestiae molestias.','non','6325',NULL,'2006-07-21 19:51:29','1977-05-21 08:29:40'),
('14','14','14','Et eum rem nesciunt aliquid sit eveniet corrupti. Quaerat illum ut eius accusantium ipsum et nisi. Perspiciatis occaecati accusantium earum temporibus. Esse omnis corporis nihil vel.','et','8',NULL,'1980-06-05 10:28:41','1973-03-14 04:18:50'),
('15','15','15','Eius ut et velit consequuntur. Voluptates itaque corrupti pariatur libero ut est sint. Et quos corrupti quis qui est quia error. Omnis quos et et ut.','hic','636211',NULL,'2008-09-13 06:42:45','1978-12-25 13:05:59'),
('16','16','16','Aperiam ipsa et dicta ea. At laborum deleniti aut maiores aspernatur. Rem unde voluptatibus quia et rerum. Eligendi consequuntur aut vel necessitatibus accusantium.','rem','6640',NULL,'1998-12-19 07:46:53','1984-12-01 01:01:09'),
('17','17','17','Quia aut voluptatem excepturi officiis ducimus qui voluptatem. Ad dolores repudiandae porro ratione alias. Maxime deleniti voluptatem cum in maxime itaque voluptates. Culpa dolor doloremque nemo aut debitis. Quibusdam eos qui quo eveniet quis.','vel','4176',NULL,'1998-10-06 03:19:54','1978-06-23 19:05:29'),
('18','18','18','Quae deleniti nulla amet adipisci dolor. Et laborum tenetur aut voluptas voluptatem. Dolores doloremque blanditiis at reprehenderit et sapiente.','vel','0',NULL,'1984-07-17 15:37:13','2000-10-08 21:24:29'),
('19','19','19','Qui sunt sequi expedita et nesciunt illum voluptates. Enim qui non culpa sed minima perspiciatis non. Aut eaque exercitationem accusamus saepe qui. Quo numquam soluta aut molestiae.','sapiente','98',NULL,'2013-04-19 07:11:59','2016-10-24 00:43:25'),
('20','20','20','Ab aut repellendus repellendus esse. Et debitis dolor repudiandae. Assumenda enim pariatur asperiores quaerat aspernatur. Et voluptatibus neque non magnam voluptatem dolor et.','cupiditate','200',NULL,'1987-12-13 15:52:26','1995-06-11 06:55:51')
;

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','blanditiis','1978-10-27 03:22:51','2000-06-22 12:05:49'),
('2','aliquid','2018-07-01 18:33:48','2009-01-31 08:24:23'),
('3','officiis','2004-04-21 23:10:10','1973-06-05 07:24:19'),
('4','deleniti','1995-11-13 21:23:36','2005-04-08 18:54:48'),
('5','quia','1979-08-30 16:07:01','1972-12-03 09:36:00'),
('6','ullam','2013-08-04 18:39:19','1982-01-01 16:50:52'),
('7','modi','1974-12-03 04:24:43','1998-01-02 01:23:37'),
('8','beatae','1985-12-12 22:06:34','2006-02-04 07:07:32'),
('9','dolor','2005-06-26 01:21:46','2016-03-30 16:02:36'),
('10','consectetur','1999-08-22 12:11:40','1972-03-11 12:48:43'),
('11','laborum','1999-01-08 08:21:57','2014-05-12 20:00:14'),
('12','fugiat','2020-08-23 14:09:45','2007-02-26 22:31:00'),
('13','animi','1979-05-02 16:31:01','1982-08-02 15:26:01'),
('14','ipsum','2018-04-18 13:11:14','2011-12-01 17:22:46'),
('15','qui','1979-03-13 13:30:53','2016-10-13 00:35:51'),
('16','excepturi','2009-01-11 05:11:05','2005-08-06 10:00:15'),
('17','dignissimos','1972-08-01 10:08:54','1981-06-10 21:39:39'),
('18','impedit','1977-06-13 06:47:54','2009-06-02 16:30:13'),
('19','ut','1971-03-06 13:38:04','2004-01-20 17:25:50'),
('20','alias','1977-05-10 19:11:23','2015-11-02 22:35:16');




DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photo_albums` VALUES ('1','modi','1'),
('2','mollitia','2'),
('3','molestias','3'),
('4','ad','4'),
('5','delectus','5'),
('6','atque','6'),
('7','voluptas','7'),
('8','est','8'),
('9','saepe','9'),
('10','architecto','10'),
('11','in','11'),
('12','qui','12'),
('13','dolore','13'),
('14','recusandae','14'),
('15','nobis','15'),
('16','harum','16'),
('17','facilis','17'),
('18','necessitatibus','18'),
('19','voluptatem','19'),
('20','doloremque','20')
;


DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photos` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'),
('11','11','11'),
('12','12','12'),
('13','13','13'),
('14','14','14'),
('15','15','15'),
('16','16','16'),
('17','17','17'),
('18','18','18'),
('19','19','19'),
('20','20','20')
;



DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20')
;

