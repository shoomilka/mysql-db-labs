-- 1. Перевірити привілеї облікового запису під яким Ви увійшли:
SHOW GRANTS;

-- 2. Створити обліковий запис із ім’ям someuser та паролем p4ssword і надати йому усі привілеї:
GRANT ALL PRIVILEGES ON *.* TO 'someuser'@'localhost' IDENTIFIED BY 'p4ssword' WITH GRANT OPTION;

-- 3. Відкликати усі привілеї облікового запису someuser:
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'someuser'@'localhost';

-- 4. Перевірити привілеї будь-якого облікового запису:
SHOW GRANTS FOR 'someuser'@'localhost';

-- 5. Надати привілеї на перегляд стовпців col1, col2 таблиці tbl, БД db обліковому запису someuser:
GRANT SELECT (id) ON `mysql-db-labs`.t10 TO 'someuser'@'localhost';

-- 6. Надати привілеї на виконання збереженої процедури proc, БД db обліковому запису someuser:
GRANT EXECUTE ON PROCEDURE `mysql-db-labs`.insertuser TO 'someuser'@'localhost';

-- 7. Перевірити надані привілеї користувача someuser. Спробувавши виконати процедури та вибрати дані із таблиць на які користувач має та не має привілеїв.
use mysql-db-labs;
select * from t10;
select * from login;

-- 8. Видалити обліковий запис someuser:
DROP USER 'someuser'@'localhost';