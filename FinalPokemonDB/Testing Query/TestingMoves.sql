--Testing for Uniqueness Violation
--*Assuming these are already in table*
INSERT into Moves VALUES ('Absorb', 'Special', 25, 50, 'Rock');
INSERT into Moves VALUES ('Flame Wheel', 'Special', 25, 50, 'Rock');
INSERT into Moves VALUES ('Splash', 'Special', 25, 50, 'Rock');
INSERT into Moves VALUES ('Leer', 'Special', 25, 50, 'Rock');
INSERT into Moves VALUES ('Attract', 'Special', 25, 50, 'Rock');


--Testing for out of bounds values
UPDATE Moves SET Power = -1 WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = 1000 WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = -10 WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = 3000 WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = -1.2 WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = 1000.4 WHERE Move_Name = 'Absorb';


UPDATE Moves Set PP = -3 WHERE Move_Name = 'Absorb';
UPDATE Moves Set PP = 251 WHERE Move_Name = 'Absorb';
UPDATE Moves Set PP = -1 WHERE Move_Name = 'Absorb';
UPDATE Moves Set PP = 300 WHERE Move_Name = 'Absorb';


Testing for Type not present in tables
UPDATE Moves SET Type = 'Soul' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Type = 'Mental' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Type = 'Cosmic' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Type = 'Stellar' WHERE Move_Name = 'Absorb';

--Testing for invalid Damage_Type
UPDATE Moves SET Damage_Type = 'Mental' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Damage_Type = 'Soul' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Damage_Type = 'Cosmic' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Damage_Type = 'Stellar' WHERE Move_Name = 'Absorb';


--Testing for wrong data types
UPDATE Moves SET Damage_Type = 1 WHERE Move_Name = 'Absorb';
UPDATE Moves SET PP = 'twenty' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = 'a lot' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Damage_Type = 67 WHERE Move_Name = 'Absorb';
UPDATE Moves SET PP = 'forty' WHERE Move_Name = 'Absorb';
UPDATE Moves SET Power = 'a little' WHERE Move_Name = 'Absorb';


