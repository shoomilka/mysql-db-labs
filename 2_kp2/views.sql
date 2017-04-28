DROP VIEW IF EXISTS view_all_users;;
DROP VIEW IF EXISTS view_really_bd;;
DROP VIEW IF EXISTS view_1993;;
DROP VIEW IF EXISTS view_bdays;;
DROP VIEW IF EXISTS view_5;;
DROP VIEW IF EXISTS view_full_names;;
DROP VIEW IF EXISTS view_age;;
DROP VIEW IF EXISTS view_13users;;
DROP VIEW IF EXISTS view_rand;;
DROP VIEW IF EXISTS view_null_users;;
DROP VIEW IF EXISTS view_few_bdays;;
DROP VIEW IF EXISTS view_users_by_nick;;
DROP VIEW IF EXISTS view_users_by_name;;
DROP VIEW IF EXISTS view_sort_sub;;
DROP VIEW IF EXISTS view_users_null_sort;;
DROP VIEW IF EXISTS view_users_ordered;;

-- 1. Представлення, яке повертає усі дані таблиці.
CREATE VIEW view_all_users AS SELECT * FROM users;;

-- 2. Представлення, яке повертає рядки, що задовольняють наперед заданій умові.
CREATE VIEW view_really_bd AS SELECT * FROM users WHERE created_at = updated_at;;

-- 3. Представлення, яке повертає рядки, що задовольняють наперед заданим умовам.
CREATE VIEW view_1993 AS SELECT * FROM users WHERE bday >= '1993-01-01' and bday <= '1993-12-31';;

-- 4. Представлення, яке повертає конкретні стовпці.
CREATE VIEW view_bdays AS SELECT username, bday FROM users;;

-- 5. Представлення, яке повертає конкретні стовпці, які мають зрозумілі та зручні для читання імена (псевдоніми).
CREATE VIEW view_5 AS SELECT username as nick, bday as birth_day FROM users;;

-- 6. Представлення, яке використовує конкатенацію стовпців.
CREATE VIEW view_full_names AS SELECT concat(first_name, ' ', last_name) as full_name FROM users;;

-- 7. Представлення, яке використовує вираз CASE.
CREATE VIEW view_age AS SELECT username, bday,
case
when bday >= '2000-01-01' then 'child'
when bday >= '1980-01-01' then 'person'
else 'smbody' end as status FROM users;;

-- 8. Представлення, яке повертає обмежену кількість рядків.
CREATE VIEW view_13users AS SELECT * FROM users LIMIT 13;;

-- 9. Представлення, яке повертає n випадкових рядків таблиці.
CREATE VIEW view_rand AS SELECT username, first_name FROM users ORDER BY rand() LIMIT 13;;

-- 10. Представлення з пошуком значень NULL
CREATE VIEW view_null_users AS SELECT * FROM users WHERE username is null;;

-- 11. Представлення з пошуком за шаблоном.
CREATE VIEW view_few_bdays AS SELECT username, bday FROM users WHERE bday like '%-09-%' or bday like '%-04-%';;

-- 12. Представлення, в якому рядки відсортовано за деяким полем.
CREATE VIEW view_users_by_nick AS SELECT username as nick, first_name, last_name FROM users ORDER BY nick asc;;

-- 13. Представлення, в якому рядки відсортовано за більш ніж одним полем.
CREATE VIEW view_users_by_name AS SELECT username as nick, first_name, last_name FROM users ORDER BY first_name, last_name asc;;

-- 14. Представлення, в якому рядки відсортовано за під рядком (функція substring / substr).
CREATE VIEW view_sort_sub AS SELECT username, first_name, last_name FROM users ORDER BY substr(first_name, length(first_name)-3);;

-- 15. Представлення, в якому обробляються NULL значення при сортуванні.
CREATE VIEW view_users_null_sort AS SELECT * FROM users ORDER BY (case when username is null then 1 else 0 end) desc, username;

-- 16. Представлення, в якому рядки відсортовано за залежністю даних від ключа.
CREATE VIEW view_users_ordered AS SELECT *,
case
when updated_at = created_at then concat(first_name, ' ', last_name)
else username end as ordered
FROM users ORDER BY 5;;