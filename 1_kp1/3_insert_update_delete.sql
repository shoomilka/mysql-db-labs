DROP PROCEDURE IF EXISTS `insertuser`;
DROP PROCEDURE IF EXISTS `deleteuser`;
DROP PROCEDURE IF EXISTS `updateuser`;

delimiter //
CREATE PROCEDURE insertuser (user varchar(10), name varchar(20), surname varchar(20), date date)
begin
	INSERT INTO users (username,first_name,last_name,bday) VALUES (user, name, surname, date);
end;
//
CREATE PROCEDURE deleteuser (delete_id bigint(20) unsigned)
begin
	DELETE FROM `users` WHERE `id` = delete_id;
end;
//
CREATE PROCEDURE updateuser (user varchar(10), name varchar(20), surname varchar(20), date date, user_id bigint(20) unsigned)
begin
	UPDATE users SET username = user, first_name = name, last_name = surname, bday = date WHERE `id` = user_id;
end;
//
