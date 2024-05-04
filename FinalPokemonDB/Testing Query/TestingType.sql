--Testing for Uniqueness Violation
INSERT into Type VALUES ('Rock', NULL, NULL, NULL);
INSERT into Type VALUES ('Fairy', NULL, NULL, NULL);
INSERT into Type VALUES ('Steel', NULL, NULL, NULL);
INSERT into Type VALUES ('Dragon', NULL, NULL, NULL);
INSERT into Type VALUES ('Fighting', NULL, NULL, NULL);
INSERT into Type VALUES ('Water', NULL, NULL, NULL);
INSERT into Type VALUES ('Fire', NULL, NULL, NULL);
INSERT into Type VALUES ('Grass', NULL, NULL, NULL);


--Testing for invalid type
INSERT into Type VALUES ('Sound', NULL, NULL, NULL);
INSERT into Type VALUES ('Quantum', NULL, NULL, NULL);
INSERT into Type VALUES ('Imaginary', NULL, NULL, NULL);
INSERT into Type VALUES ('2019-11-02', NULL, NULL, NULL);


--Testing for no PK
INSERT into Type VALUES (NULL, 'Rock', NULL, NULL);
INSERT into Type VALUES (NULL, NULL, 'Fairy', NULL);
INSERT into Type VALUES (NULL, NULL, 'Rock,Fairy', NULL);
INSERT into Type VALUES (NULL, NULL, NULL, 'Ground');
INSERT into Type VALUES (NULL, NULL, 'Water,Fire', 'Grass');

--Testing for wrong data types
UPDATE Type SET Effective = 2 WHERE Type_1 = 'Rock';
UPDATE Type SET Effective = 'Rock' WHERE Type_1 = 'Sound';
UPDATE Type SET Effective = 2 WHERE Type_1 = 'Fairy';
UPDATE Type SET Effective = 'Rock' WHERE Type_1 = 3;