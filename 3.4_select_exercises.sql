USE albums_db;
DESCRIBE albums;
SELECT name FROM albums
WHERE artist = "Pink Floyd";

#SELECT * FROM albums;
SELECT release_date FROM albums
WHERE name LIKE "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre FROM albums 
WHERE name LIKE "Nevermind";

SELECT name FROM albums
WHERE release_date >= 1990
 AND
release_date < 2000;

SELECT name FROM albums
WHERE sales < 20;

SELECT name, genre FROM albums
WHERE 
genre LIKE "%%Rock%%"
	OR
genre LIKE "%%rock%%";