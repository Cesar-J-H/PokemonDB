/*Test for INSERTING with missing PK
INSERT into Game VALUES (NULL, 1, 'Kanto', '1998-09-28');
INSERT into Game VALUES (NULL, 2, 'Johto', '2001-12-20');
INSERT into Game VALUES (NULL, 3, 'Kanto', '1998-09-28');
INSERT into Game VALUES (NULL, 4, 'Hoenn', '2001-12-20');


--Test for wrong data types
INSERT into Game VALUES ('Pokemon Red and Blue', 2, 3, '1998-10-14');
INSERT into Game VALUES (21, 'Red', 3, 2002);
INSERT into Game VALUES ('Po', 2, 3, '1998-10-14');
INSERT into Game VALUES (-1, 'Red', 3, 2002);


--Test for not valid region
INSERT into Game VALUES ('Pokemon Red and Blue', 1, 'Cali', '1998-09-28');
INSERT into Game VALUES ('Pokemon Emerald', 3 'Texas', '2005-05-01');
INSERT into Game VALUES ('Pokemon Red and Blue', 1, 'Pizza', '1998-09-28');
INSERT into Game VALUES ('Pokemon Emerald', 3 'Yellow', '2005-05-01');
INSERT into Game VALUES ('Pokemon Red and Blue', 1, 'Soda', '1998-09-28');
INSERT into Game VALUES ('Pokemon Emerald', 3 'Bluy', '2005-05-01');
INSERT into Game VALUES ('Pokemon Red and Blue', 1, 'Poppy', '1998-09-28');
INSERT into Game VALUES ('Pokemon Emerald', 3 'Moons', '2005-05-01');

--Test for not valid generation number
INSERT into Game VALUES ('Pokemon Sun and Moon', 11, 'Alola', '2016-11-18');
INSERT into Game VALUES ('Pokemon Sword and Shield', 0, 'Galar' '2019-11-15');
INSERT into Game VALUES ('Pokemon Scarlet and Violet', -1, 'Paldea', '2022-11-18');
INSERT into Game VALUES ('Pokemon Sun and Moon', 30, 'Alola', '2016-11-18');
INSERT into Game VALUES ('Pokemon Sword and Shield', 200, 'Galar' '2019-11-15');
INSERT into Game VALUES ('Pokemon Scarlet and Violet', -1, 'Paldea', '2022-11-18');


--Test for NOT NULL violation
INSERT into Game VALUES ('Pokemon Platinum', NULL, 'Sinnoh', '2009-03-22');
INSERT into Game VALUES ('Pokemon Ultra Sun and Ultra Moon', NULL, 7, '2017-11-17');

--Next ones should work (date is optional) *Just for testing this game doesn't actually exist*
INSERT into Game VALUES ('Pokemon Legends: Celebi', 9, 'Sinnoh', NULL);
DELETE from Game where Gname like '%Celebi%';
INSERT into Game VALUES ('Pokemon Legends: Kyurem', 9, 'Sinnoh', NULL);
DELETE from Game where Gname like '%Kyurem%';


--Test for not valid uniqueness
INSERT into Game VALUES ('Pokemon X and Y', 6, 'Kalos', NULL);
INSERT into Game VALUES ('Pokemon X and Y', 9, 'Kalos', NULL);
INSERT into Game VALUES ('Pokemon X and Y', 9, 'Unova', NULL);
INSERT into Game VALUES ('Pokemon X and Y', 6, 'Kalos', '1999-10-11');
INSERT into Game VALUES ('Pokemon Omega Ruby and Alpha Sapphire', 6, 'Hoenn', NULL);

