/*Show the total number of Each Type Pokemon from Generation 1 who have a Previous Evolution*/

SELECT Contain.Type, Count(Pokemon.Pname) as Total FROM Game, Pokemon, Contain WHERE Pokemon.Gname = Game.Gname AND Pokemon.Pname = Contain.Pname AND Pokemon.Previous_Evo IS NOT NULL AND Game.Generation = 1 GROUP BY Contain.Type;

/*Show the total number Pokemon in each generation who are Grass types.*/

SELECT Game.Generation, Count(*) as 'Total Pokemon' FROM Game JOIN Pokemon on Game.Gname = Pokemon.Gname JOIN CONTAIN on Pokemon.Pname = Contain.Pname Where CONTAIN.Type = 'Grass' GROUP BY Game.Generation ORDER BY Game.Generation

/*Show all the Pokemon who are a stage 3 Evolution and can learn a move strong against Water Types*/

SELECT Pokedex.Nation_Num as ‘National Number’, Pokemon.Pname as ‘Pokemon Name’
FROM Game JOIN Pokemon on Game.Gname = Pokemon.Gname JOIN Pokedex on Pokemon.Pname = Pokedex.Pname
WHERE Pokemon.Evo_Stage = 3 AND Pokemon.Pname In 
(SELECT Pokemon.Pname
FROM Pokemon JOIN Uses on Pokemon.Pname = Uses.Pname JOIN Moves on Uses.Move_Name = Moves.Move_Name JOIN Type on Moves.Type = Type.Type_1
WHERE Type.Effective like '%Water%'
)
ORDER BY Pokedex.Nation_Num ASC;

/*Show all the defining characteristics about Ralts (Type, Game Debut, etc.)*/

SELECT Pokedex.Nation_Num as ‘National Number’, Pokemon.Pname as ‘Pokemon Name’, Pokemon.Gname as ‘Game’, Game.Generation, Game.Region, Type.Type_1 as Type
FROM Game JOIN Pokemon on Game.Gname = Pokemon.Gname JOIN Pokedex on Pokemon.Pname = Pokedex.Pname JOIN Contain on CONTAIN.Pname = Pokemon.Pname JOIN Type on CONTAIN.Type = Type.Type_1
WHERE Pokemon.Pname = 'Ralts';

/*Show all Legendary Pokemon from before Generation 5 who can learn a move with over 10 power*/

SELECT Game.Generation, Pokemon.Pname as ‘Pokemon Name’, Contain.Type
FROM Game JOIN Pokemon on Game.Gname = Pokemon.Gname JOIN Contain on Pokemon.Pname = Contain.Pname
WHERE Game.Generation < 5 AND Pokemon.Rarity like 'Legendary' AND Pokemon.Pname in 
(Select Pokemon.Pname 
FROM Uses JOIN Moves on Uses.Move_Name = Moves.Move_Name 
WHERE Moves.Power > 10
)
ORDER BY Game.Generation, Pokemon.Pname ASC;

/*Show all the Pokemon who debuted in Pokemon Diamond and Pearl or Pokemon X and Y and start evolving before level 55*/

SELECT DISTINCT Pokedex.Nation_Num as ‘National Number’, Pokedex.Region_Num as ‘Region Number’, Pokemon.Gname as ‘Game’, Pokemon.Pname as ‘Pokemon Name’, Mechanic.Next_Evo as ‘Next Evo’
FROM Pokedex JOIN Pokemon on Pokedex.Pname = Pokemon.Pname JOIN Evolves_Using on Pokemon.Pname = EVOLVES_USING.Pname JOIN Mechanic on EVOLVES_USING.Next_Evo = Mechanic.Next_Evo
WHERE (Pokemon.Gname = 'Pokemon Diamond and Pearl' OR Pokemon.Gname = 'Pokemon X and Y') and Mechanic.Level < 55
ORDER BY Pokedex.Nation_Num ASC;

/*Show the National Number, Game name, Region, and Pokemon Name from all the Generation 6 Pokemon who can learn a Psychic type move*/
SELECT DISTINCT Pokedex.Nation_Num, Game.Gname, Game.Region, Pokemon.Pname
FROM Pokedex JOIN Pokemon on Pokedex.Pname = Pokemon.Pname JOIN Game on Game.Gname = Pokemon.Gname JOIN Uses on USES.Pname = Pokemon.Pname JOIN Moves on Moves.Move_Name = Uses.Move_Name
WHERE Game.Generation = 6 and Moves.Type = 'Psychic'
ORDER BY Pokedex.Nation_Num ASC;

/*Show the name, number, and next evolution of every Steel or Fairy Type Pokemon released after 2001 who can still evolve*/

SELECT Pokedex.Nation_Num, Pokemon.Pname, Evolves_Using.Next_Evo as 'Next Evo'
FROM Pokedex JOIN Pokemon on Pokedex.Pname = Pokemon.Pname JOIN Game on Pokemon.Gname = Game.Gname JOIN Contain on CONTAIN.Pname = Pokemon.Pname JOIN Type on CONTAIN.Type = Type.Type_1 JOIN EVOLVES_USING on EVOLVES_USING.Pname = Pokemon.Pname
WHERE Type.Type_1 = 'Steel' or Type.Type_1 = 'Fairy' and Game.Release_Date > '2001-12-31'
ORDER BY Pokedex.Nation_Num;

/*Show the National Number, Name, Generation, Type, Next Evolution, and Item of every Pokemon who evolves using an item*/

SELECT Pokedex.Nation_Num as 'National Number', Pokemon.Pname as 'Pokemon Name', Game.Generation, Contain.Type, Evolves_Using.Next_Evo, Mechanic.Item
FROM Pokedex JOIN Pokemon on Pokemon.Pname = Pokedex.Pname JOIN Game on Pokemon.Gname = Game.Gname JOIN EVOLVES_USING on EVOLVES_USING.Pname = Pokemon.Pname JOIN Mechanic on EVOLVES_USING.Next_Evo = Mechanic.Next_Evo JOIN CONTAIN on Pokemon.Pname = CONTAIN.Pname
WHERE Mechanic.Item is NOT NULL
ORDER by Pokedex.Nation_Num ASC;

/*Show the Pokemon name, Region, Type(s), and Mechanic attributes of Pokemon Number 52, 236, and 743*/

SELECT Pokemon.Pname, Game.Region, Contain.Type, Mechanic.Next_Evo, Mechanic.Level, Mechanic.Item, Mechanic.Time, Mechanic.Gimmick
FROM Pokedex JOIN Pokemon on Pokemon.Pname = Pokedex.Pname JOIN Game on Pokemon.Gname = Game.Gname JOIN EVOLVES_USING on EVOLVES_USING.Pname = Pokemon.Pname JOIN Mechanic on EVOLVES_USING.Next_Evo = Mechanic.Next_Evo JOIN CONTAIN on Pokemon.Pname = CONTAIN.Pname
WHERE Pokedex.Nation_Num = 52 or Pokedex.Nation_Num = 236 or Pokedex.Nation_Num = 743;

/*Show the National Number, Pokemon Name, and Type(s) of all the Pokemon who debuted in 'Pokemon Scarlet and Violet' who are weak to Fairy Types*/

SELECT Pokedex.Nation_Num, Pokemon.Pname, Contain.Type
FROM Pokemon JOIN CONTAIN on Pokemon.Pname = CONTAIN.Pname JOIN Game on Pokemon.Gname = Game.Gname JOIN Pokedex on Pokedex.Pname = Pokemon.Pname
WHERE Game.Gname = 'Pokemon Scarlet and Violet' and Pokemon.Pname in
(Select Contain.Pname
From Contain Join Type on Contain.Type = Type.Type_1
Where Type.Weak like '%Fairy%'
)
ORDER BY Pokedex.Nation_Num ASC;

/*Show the Regional Number and name of all the Normal/Flying and Fire/Flying dual-type Pokemon who can learn a 'Physical' Type move*/

SELECT Distinct Pokedex.Region_Num, Pokemon.Pname
FROM Pokedex JOIN Pokemon on Pokedex.Pname = Pokemon.Pname JOIN CONTAIN on CONTAIN.Pname = Pokemon.Pname JOIN USES on Pokemon.Pname = USES.Pname JOIN Moves on USES.Move_Name = Moves.Move_Name
WHERE (CONTAIN.Type = 'Normal' OR CONTAIN.Type = ‘Fire’) and Moves.Damage_Type = 'Physical' and Pokemon.Pname in
(SELECT Pokemon.Pname
FROM Pokemon JOIN CONTAIN on CONTAIN.Pname = Pokemon.Pname
WHERE CONTAIN.Type = ‘Flying'
);
