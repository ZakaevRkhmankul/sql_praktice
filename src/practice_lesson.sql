CREATE TABLE publishers
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TYPE Genre as ENUM ('DETECTIVE','DRAMA','HISTORY','ROMANCE','BIOGRAPHY','FANTASY');

CREATE TABLE books
(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(50),
    country        VARCHAR,
    published_year DATE,
    price          NUMERIC,
    genre          Genre
);

CREATE TABLE languages
(
    id       SERIAL PRIMARY KEY,
    language VARCHAR
);

CREATE TYPE Gender as ENUM ('Male','Female');

CREATE TABLE authors
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(50),
    gender     Gender
);

ALTER TABLE authors
    ADD CONSTRAINT email_unique UNIQUE (email);

ALTER TABLE books
    ADD COLUMN language_id INT REFERENCES languages (id);
ALTER TABLE books
    ADD COLUMN publisher_id INT REFERENCES publishers (id);
ALTER TABLE books
    ADD COLUMN author_id INT REFERENCES authors (id);

insert into publishers(name)
values ('RELX Group'),
       ('Thomson Reuters'),
       ('Holtzbrinck Publishing Group'),
       ('Shanghai Jiao Tong University Press'),
       ('Wolters Kluwer'),
       ('Hachette Livre'),
       ('Aufbau-Verlag'),
       ('Macmillan'),
       ('Harper Collins'),
       ('China Publishing Group'),
       ('Springer Nature'),
       ('Grupo Planeta'),
       ('Books.Ru Ltd.St Petersburg'),
       ('The Moscow Times'),
       ('Zhonghua Book Company');

ALTER TABLE authors
    ADD COLUMN date_of_birth DATE;
ALTER TABLE authors
    ADD COLUMN country VARCHAR;

insert into authors(first_name, last_name, email, date_of_birth, country, gender)
values ('Sybilla', 'Toderbrugge', 'stoderbrugge0@jugem.jp', '9/25/1968', 'France', 'Female'),
       ('Patti', 'Walster', 'pwalster1@addtoany.com', '10/31/1965', 'China', 'Female'),
       ('Sonnie', 'Emmens', 'semmens2@upenn.edu', '5/16/1980', 'Germany', 'Male'),
       ('Brand', 'Burel', 'bburel3@ovh.net', '4/24/1964', 'United States', 'Male'),
       ('Silvan', 'Smartman', 'ssmartman4@spiegel.de', '7/3/1967', 'France', 'Male'),
       ('Alexey', 'Arnov', 'larnoldi5@writer.com', '12/29/1964', 'Russia', 'Male'),
       ('Bunni', 'Aggio', 'baggio6@yahoo.co.jp', '12/14/1983', 'China', 'Female'),
       ('Viole', 'Sarath', 'vsarath7@elegantthemes.com', '1/29/1960', 'United States', 'Female'),
       ('Boigie', 'Etridge', 'betridge8@ed.gov', '11/17/1978', 'France', 'Male'),
       ('Hilliard', 'Burnsyde', 'hburnsyde9@omniture.com', '9/8/1962', 'Germany', 'Male'),
       ('Margarita', 'Bartova', 'mbartova@example.com', '12/3/1984', 'Russia', 'Female'),
       ('Innis', 'Hugh', 'ihughb@marriott.com', '8/28/1983', 'Germany', 'Male'),
       ('Lera', 'Trimnella', 'ltrimnellc@msn.com', '3/28/1980', 'Russia', 'Female'),
       ('Jakob', 'Bransby', 'jbransbyd@nasa.gov', '8/5/1966', 'Spain', 'Male'),
       ('Loretta', 'Gronaver', 'lgronavere@technorati.com', '10/17/1962', 'United States', 'Female');

insert into languages(language)
values ('English'),
       ('French'),
       ('German'),
       ('Chinese'),
       ('Russian'),
       ('Spanish');

insert into books(name, country, published_year, price, genre, language_id, publisher_id, author_id)
values ('Taina', 'Russia', '11/12/2021', '568', 'DETECTIVE', '5', '12', '6'),
       ('Zvezdopad', 'Russia', '12/9/2004', '446', 'ROMANCE', '5', '13', '11'),
       ('Homo Faber', 'Germany', '4/10/2022', '772', 'FANTASY', '3', '5', '3'),
       ('Der Richter und Sein Henker', 'Germany', '2/1/2011', '780', 'DETECTIVE', '3', '3', '10'),
       ('Lord of the Flies', 'United States', '7/11/2015', '900', 'FANTASY', '1', '2', '4'),
       ('Un soir au club', 'France', '1/12/2018', '480', 'DRAMA', '2', '1', '1'),
       ('Voina', 'Russia', '12/6/2004', '880', 'HISTORY', '5', '4', '13'),
       ('Sun Tzu', 'China', '9/5/2022', '349', 'HISTORY', '4', '4', '2'),
       ('Emil und die Detektive', 'Germany', '6/11/2010', '228', 'DETECTIVE', '3', '5', '10'),
       ('Coule la Seine', 'France', '3/1/2015', '732', 'FANTASY', '2', '6', '1'),
       ('Love and hatred', 'Russia', '2/3/2012', '763', 'ROMANCE', '5', '14', '13'),
       ('Fantastic Mr Fox', 'United States', '3/10/2018', '309', 'FANTASY', '1', '9', '8'),
       ('Contes de la Bécasse', 'France', '10/5/2019', '378', 'ROMANCE', '2', '6', '9'),
       ('“The Death of Ivan Ilyich', 'Russia', '9/24/2000', '814', 'DRAMA', '5', '6', '6'),
       ('Bonjour Tristesse', 'France', '8/2/2015', '502', 'ROMANCE', '2', '8', '5'),
       ('Die Verwandlung', 'Germany', '6/19/2008', '305', 'DETECTIVE', '3', '7', '12'),
       ('The Inspector Barlach Mysteries', 'Germany', '3/10/2007', '566', 'DETECTIVE', '3', '3', '3'),
       ('LÉtranger', 'France', '11/14/2017', '422', 'ROMANCE', '2', '8', '5'),
       ('Lao Tse', 'China', '7/16/2005', '900', 'FANTASY', '4', '4', '2'),
       ('Semya', 'Russia', '4/12/2004', '194', 'DRAMA', '5', '13', '11'),
       ('Empty World', 'United States', '1/4/2008', '324', 'FANTASY', '1', '11', '15'),
       ('Domainer', 'Germany', '1/6/2020', '420', 'ROMANCE', '3', '5', '10'),
       ('The Fault in Our Stars', 'United States', '2/13/2008', '396', 'ROMANCE', '1', '9', '4'),
       ('Die R uber', 'Germany', '6/25/2020', '300', 'ROMANCE', '3', '7', '12'),
       ('Jung Chang', 'China', '5/14/2021', '600', 'HISTORY', '4', '10', '7'),
       ('Les Aventures de Tintin', 'France', '4/10/2015', '582', 'DRAMA', '2', '1', '5'),
       ('Unvollendete Geschichte', 'Germany', '12/12/2010', '269', 'DETECTIVE', '3', '5', '10'),
       ('Amy Tan', 'China', '1/9/2023', '486', 'DRAMA', '4', '4', '7'),
       ('Krasnaya luna', 'Russia', '2/7/2020', '550', 'FANTASY', '5', '12', '11'),
       ('Emma', 'United States', '10/11/2021', '599', 'BIOGRAPHY', '1', '2', '15');
DELETE from books WHERE id between 31 and 60; --эки жолу кошуп алып анан 31ден 60 га чейин очурдум.

-- Запросы:
-- 1.Китептердин атын, чыккан жылын, жанрын чыгарыныз.
SELECT books.name, books.published_year, genre
from books;
-- 2.Авторлордун мамлекеттери уникалдуу чыксын.
SELECT country AS authors_country
from authors
group by country;
-- 3.2020-2023 жылдардын арасындагы китептер чыксын.
SELECT *
from books
WHERE published_year between '1/1/2020' and '1/1/2023';
-- 4.Детектив китептер жана алардын аттары чыксын.
SELECT name, genre
from books
WHERE genre = 'DETECTIVE';
-- 5.Автордун аты-жону author деген бир колонкага чыксын.
SELECT concat(first_name, ' ', last_name) AS author
from authors;
-- 6.Германия жана Франциядан болгон авторлорду толук аты-жону менен сорттоп чыгарыныз.
SELECT authors.id, concat(authors.first_name, ' ', authors.last_name) AS author
from authors
WHERE country = ('German', 'French');
-- 7.Романдан башка жана баасы 500 дон кичине болгон китептердин аты, олкосу, чыккан жылы, баасы жанры чыксын..
SELECT books.name, books.country, books.published_year, books.price, books.genre
from books
WHERE genre != 'ROMANCE'
  AND price < 500;
-- 8.Бардык кыз авторлордун биринчи 3 ну чыгарыныз.
SELECT *
from authors
WHERE gender = 'Female'
    LIMIT 3;
-- 9.Почтасы .com мн буткон, аты 4 тамгадан турган, кыз авторлорду чыгарыныз.
SELECT *
from authors
WHERE gender = 'Female'
  AND length(first_name) = 4
  AND email LIKE '%.com';
-- 10.Бардык олколорду жана ар бир олкодо канчадан автор бар экенин чыгаргыла.
SELECT country, count(authors)
from authors
group by country;
-- 11.Уч автор бар болгон олколорду аты мн сорттоп чыгарыныз.
SELECT authors.country
from authors
group by authors.country
HAVING count(authors) = 3
order by country;
-- 12. Ар бир жанрдагы китептердин жалпы суммасын чыгарыныз
SELECT genre, SUM(books.price) AS total_price
from books
GROUP BY genre;
-- 13. Роман жана Детектив китептеринин эн арзан бааларын чыгарыныз
SELECT min(price)
from books
WHERE genre = ('ROMANCE', 'DETECTIVE');
-- 14.История жана Биографиялык китептердин сандарын чыгарыныз
SELECT count(books.price)
from books
WHERE name = '';
-- 15.Китептердин , издательстволордун аттары жана тили чыксын
-- 156Авторлордун бардык маалыматтары жана издательстволору чыксын, издательство болбосо null чыксын
-- 17.Авторлордун толук аты-жону жана китептери чыксын, китеби жок болсо null чыксын.
SELECT authors.id, concat(authors.first_name, ' ', authors.last_name) AS full_name, books.id, books.name from authors LEFT JOIN books ON authors.id = books.author_id;
-- 18.Кайсы тилде канча китеп бар экендиги ылдыйдан ойлдого сорттолуп чыксын.
SELECT languages.language, count(books) AS count_book
from languages INNER JOIN books ON languages.id = books.language_id group by language;
-- 19.Издательствонун аттары жана алардын тапкан акчасынын оточо суммасы тегеректелип чыгарылсын.
-- 20.2010-2015 жылдардын арасындагы китептер жана автордун аты-фамилиясы чыксын.
SELECT books.id, name AS book_name, authors.first_name, authors.last_name, published_year from books LEFT JOIN authors ON books.author_id = books.id WHERE published_year between '1/1/2010' and '1/1/2015';
-- 21.2010-2015 жылдардын арасындагы китептердин авторлорунун толук аты-жону жана алардын тапкан акчаларынын жалпы суммасы чыксын.