--Testing for Uniqueness Violation
--*Ralts should already be in table so there's also another violation here*
INSERT into Pokedex VALUES (1, NULL, 'Ralts');
INSERT into Pokedex VALUES (2, NULL, 'Ralts');


--Testing for invalid type
INSERT into Pokedex VALUES ('1', NULL, 'Ralts');
INSERT into Pokedex VALUES (1, NULL, 10);


--Testing for NOT NULL violations
INSERT into Pokedex VALUES (NULL, 10, 'Ralts');
INSERT into Pokedex VALUES (1000, 10, NULL);
INSERT into Pokedex VALUES (NULL, 20, 'Kirlia');
INSERT into Pokedex VALUES (123, 10, NULL);


--Testing for FK Pname not in another table
INSERT into Pokedex VALUES (1011, 12, 'Mario');
INSERT into Pokedex VALUES (1011, 12, 'Luigi');
INSERT into Pokedex VALUES (1011, 12, 'Peach');
INSERT into Pokedex VALUES (1011, 12, 'Bowser');


--Test for out of bounds nums
UPDATE Pokedex SET Nation_Num = 5000 where Nation_Num = 20;
UPDATE Pokedex SET Nation_Num = 0 where Nation_Num = 20;
UPDATE Pokedex SET Region_Num = 5000 where Nation_Num = 10;
UPDATE Pokedex SET Region_Num = 0 where Nation_Num = 10;
