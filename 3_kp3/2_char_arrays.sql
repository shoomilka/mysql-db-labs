-- Представлення з проходом рядка.
select substr(word.word, iter.pos,1) _char
from (select 'shoomilka' as word) word,
(select id as pos from t10) iter
where iter.pos <= length(word.word);

-- Представлення, в якому виводяться одиночні лапки.
select '''' as quote, 'uliana''s sweets are disappeared :-(' as sad_message;

-- Представлення, в якому видаляються всі непотрібні символи.
select username, replace(username, 's', '$') as better_view from users;

-- Представлення, в якому розділяються числові та символьні дані.

-- Представлення, в якому вибираються ініціали з імені.

-- Представлення, в якому перетворити рядок у список оператора IN із множиною значень.