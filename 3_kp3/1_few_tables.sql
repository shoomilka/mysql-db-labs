-- Представлення, яке розміщує один набір рядків під іншим
select user_id, vk_id as foreign_id from login_vk
union all
select '-------', '-------'
union all
select user_id, fb_id as foreign_id from login_fb;

-- Представлення, яке поєднує пов’язані рядки JOIN ~ EQUI-JOIN ~ INNER JOIN
select login_vk.user_id, login_vk.vk_id, login_fb.fb_id
from login_vk inner join login_fb
on (login_vk.user_id = login_fb.user_id);

-- Представлення, яке знаходить однакові рядки в двох таблицях.
select login_fb.id as fb_table_id, login_fb.user_id, fb_id as occur
from login_fb, login_vk
where login_fb.user_id = login_vk.user_id
and login_fb.fb_id = login_vk.vk_id;

-- Представлення, яке повертає записи із значеннями, яких немає в іншій таблиці
-- ANTI-JOIN ~ LEFT (RIGHT) OUTER JOIN ~ LEFT (RIGHT) JOIN
select login_fb.*
from login_fb left outer join login_vk
on (login_fb.fb_id = login_vk.vk_id)
where login_vk.vk_id is null;

select login_fb.*
from login_fb left join login_vk
on (login_fb.fb_id = login_vk.vk_id)
where login_vk.vk_id is null;

-- Представлення, яке повертає записи із значеннями, для яких немає відповідності в іншій таблиці.
select distinct fb_id from login_fb
where fb_id not in (select vk_id from login_vk);

-- Представлення, в якому реалізовано незалежне додавання об’єднань у запит.
select users.first_name, users.last_name, login.password, login_fb.fb_id
from users join login
on (users.id = login.user_id)
left join login_fb
on (login_fb.user_id = users.id);

-- Представлення, в якому реалізовано об’єднання з використанням агрегатних функцій.
select 'count', count(distinct my_table.id) as count_users
from(
    select u.id, u.first_name, u.last_name, l.password, fb.fb_id
		from users u, login l, login_fb fb
			where u.id = l.user_id
		    and fb.user_id = u.id
) my_table;

-- Представлення, в якому реалізовано зовнішнє об’єднання з використанням агрегатних функцій.
select 'count', count(distinct my_table.id) as count_users
from(
    select u.id, u.first_name, u.last_name, l.password, fb.fb_id
		from users u join login l
			on (u.id = l.user_id)
		left join login_fb fb
			on (fb.user_id = u.id)
) my_table;

-- Представлення, в якому відсутні дані в кількох таблицях FULL OUTER JOIN
/* completed but users.id is foreign key for login and login_fb, so this
code is very stupid */
select users.first_name, login.password, login_fb.fb_id from users
left join login on users.id = login.user_id
left join login_fb on users.id = login_fb.user_id
union
select users.first_name, login.password, login_fb.fb_id from users
right join login on users.id = login.user_id
left join login_fb on users.id = login_fb.user_id
union
select users.first_name, login.password, login_fb.fb_id from users
right join login on users.id = login.user_id
right join login_fb on users.id = login_fb.user_id;
/* more stupid code is here */
select users.first_name, login.password, login_fb.fb_id from users
left join login on users.id = login.id
left join login_fb on users.id = login_fb.id
union
select users.first_name, login.password, login_fb.fb_id from users
right join login on users.id = login.id
left join login_fb on users.id = login_fb.id
union
select users.first_name, login.password, login_fb.fb_id from users
right join login on users.id = login.id
right join login_fb on users.id = login_fb.id;

-- Представлення, в якому містяться NULL-значення в операціях та порівняннях.
select coalesce(ta.first_name, ''), coalesce(ta.password, ''), coalesce(ta.fb_id, '')
from(
    select users.first_name, login.password, login_fb.fb_id from users
        left join login on users.id = login.id
        left join login_fb on users.id = login_fb.id
    union
    select users.first_name, login.password, login_fb.fb_id from users
        right join login on users.id = login.id
        left join login_fb on users.id = login_fb.id
    union
    select users.first_name, login.password, login_fb.fb_id from users
        right join login on users.id = login.id
        right join login_fb on users.id = login_fb.id
) ta;