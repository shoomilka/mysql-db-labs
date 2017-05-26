-- Представлення, в якому вивести мінімальне/максимальне значення у стовпці.
select min(id) as _min, max(id) as _max from `login_fb`;

-- Представлення, яке повертає кількість записів у таблиці.
select count(id) as _count from `login_fb`;

-- Представлення, яке повертає кількість визначених (не-NULL) значень.
select count(firn) from(
    select coalesce(ta.password, 'superstringcheckingvalue') as firn
        from(
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
                right join login_fb on users.id = login_fb.user_id
        ) ta
    ) tab where firn <> 'superstringcheckingvalue'

-- Представлення, в якому обчислити поточну суму.
select f2.id, f2.fb_id,
(select sum(id) from login_fb f1
where f1.id <= f2.id) as run_total_id,
(select sum(fb_id) from login_fb f1
where f1.id <= f2.id) as run_total_acc
from login_fb f2;