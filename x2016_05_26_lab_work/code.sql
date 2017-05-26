-- INDEXES

-- equivalents
-- #1
select username from users where username like '%shoo%';
-- #2 't'' is after 's', 'i' is after 'h', 'p' is after 'o' ...
select username from users where username >= 'shoo' and username < 'tipp';

-- will not work
select username, substring(username, 4) as subs from users where subs >= 'sh' and subs < 'ti';

-- bad query
select id from users where id/2 > 10;
-- good query
select id from users where id > 10/2;