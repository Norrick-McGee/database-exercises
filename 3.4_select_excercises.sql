USE albums_db;

DESCRIBE albums;

SELECT * FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date as year FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
SELECT genre FROM albums WHERE name = 'Nevermind';
SELECT * FROM albums WHERE sales < 20.0;
SELECT * FROM albums WHERE genre = 'Rock';