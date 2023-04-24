DROP SCHEMA IF EXISTS books;
CREATE SCHEMA books;
USE books;

CREATE TABLE author(
id_author INT NOT NULL AUTO_INCREMENT,
author_name VARCHAR(255),
PRIMARY KEY (id_author)
);
CREATE TABLE books(
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255),
word_count INT,
views INT,
author_id INT,
PRIMARY KEY (id),
foreign key (author_id)references author(id_author)
);

INSERT INTO books (author) VALUES
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");


INSERT INTO books (title, word_count, views, author_id) VALUES
("Best Paint Colors", 	814, 14, "Maria Charlotte"),
("Small Space Decorating Tips", 1146, 221, "Juan Perez"),
("Hot Accessories", 986, 105, "Maria Charlotte"),
("Mixing Textures",	765, 22, "Maria Charlotte"),
("Kitchen Refresh", 1242, 307, "Juan Perez"),
("Homemade Art Hacks",	1002, 193, "Maria Charlotte"),
("Refinishing Wood Floors", 1571, 7542, "Gemma Alcocer");



