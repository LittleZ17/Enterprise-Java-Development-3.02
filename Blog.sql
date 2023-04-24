DROP SCHEMA IF EXISTS blog;
CREATE SCHEMA blog;
USE blog;

CREATE TABLE authors(
id_author INT NOT NULL AUTO_INCREMENT,
author_name VARCHAR(255),
PRIMARY KEY (id_author)
);

CREATE TABLE posts(
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255),
word_count INT,
views INT,
author_id INT,
PRIMARY KEY (id),
foreign key (author_id) references authors(id_author)
);

INSERT INTO authors(author_name) VALUES
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");

INSERT INTO posts (title, word_count, views, author_id) VALUES
("Best Paint Colors",  814, 14, 1),
("Small Space Decorating Tips", 1146, 221, 2),
("Hot Accessories", 986, 105, 1),
("Mixing Textures", 765, 22, 1),
("Kitchen Refresh",  1242,  307, 2),
("Homemade Art Hacks",  1002,  193, 1),
(" Refinishing Wood Floors", 1571,  7542, 3);