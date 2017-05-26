-- Представлення, яке розміщує один набір рядків під іншим

select user_id, vk_id as foreign_id from login_vk
union all
select '-------', '-------'
union all
select user_id, fb_id as foreign_id from login_fb