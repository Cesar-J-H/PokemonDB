CREATE table Game
(Gname VARCHAR(50) NOT NULL, Generation TINYINT NOT NULL, Region VARCHAR(6) NOT NULL, Release_Date DATE,
PRIMARY KEY (Gname),
CONSTRAINT Chk_Generation CHECK (Generation >= 1 and Generation <= 9),
CONSTRAINT Chk_Region CHECK (Region = 'Kanto' or Region = 'Johto' or Region = 'Hoenn' or
Region = 'Sinnoh' or Region = 'Unova' or Region = 'Kalos' or Region = 'Alola' or Region
= 'Galar' or Region = 'Paldea')
);


CREATE table Pokemon
(Pname VARCHAR(15) NOT NULL, Gender_Ratio DECIMAL(5,2), Evo_Stage TINYINT NOT NULL,
Rarity VARCHAR(9), Gname VARCHAR(50) NOT NULL, Previous_Evo VARCHAR(15),
PRIMARY KEY (Pname),
FOREIGN KEY (Gname) REFERENCES Game(Gname) ON UPDATE cascade ON DELETE cascade,
FOREIGN KEY (Previous_Evo) REFERENCES Pokemon(Pname),
CONSTRAINT Chk_Ratio CHECK ((Gender_Ratio >= 0 and Gender_Ratio <= 100) or Gender_Ratio = -1),
CONSTRAINT Chk_Stage CHECK (Evo_Stage = 1 or Evo_Stage = 2 or Evo_Stage = 3),
CONSTRAINT Chk_Rarity CHECK (Rarity = 'Basic' or Rarity = 'Mythical' or Rarity = 'Legendary')
);


CREATE table Pokedex
(Nation_Num SMALLINT NOT NULL, Region_Num SMALLINT, Pname VARCHAR(15) NOT NULL,
PRIMARY KEY (Nation_Num),
UNIQUE (Pname),
FOREIGN KEY (Pname) REFERENCES Pokemon (Pname) ON DELETE cascade ON UPDATE cascade,
CONSTRAINT Chk_Nation CHECK (Nation_Num > 0 and Nation_Num < 1018),
CONSTRAINT Chk_Region_Num CHECK (Region_Num > 0 and Region_Num < 400)
);


CREATE table Type
(Type_1 VARCHAR(8) NOT NULL, Effective VARCHAR(50), Weak VARCHAR(50), Not_Effective VARCHAR(50),
PRIMARY KEY (Type_1),
CONSTRAINT Chk_Type CHECK (Type_1 = 'Bug' or Type_1 = 'Dark' or Type_1 = 'Dragon' or Type_1 = 'Electric' or Type_1 = 'Fairy' or Type_1 = 'Fighting' or Type_1 = 'Fire' or Type_1 = 'Flying' or Type_1 = 'Ghost' or Type_1 = 'Grass' or Type_1 = 'Ground' or Type_1 = 'Ice' or Type_1 = 'Normal' or Type_1 = 'Poison' or Type_1 = 'Psychic' or Type_1 = 'Rock' or Type_1 = 'Steel' or Type_1 = 'Water')
);


CREATE table Moves
(Move_Name VARCHAR(18) NOT NULL, Damage_Type VARCHAR(8) NOT NULL, PP TINYINT NOT NULL, Power TINYINT UNSIGNED NOT NULL, Type VARCHAR(8) NOT NULL,
PRIMARY KEY (Move_Name),
FOREIGN KEY (Type) REFERENCES TYPE(Type_1) ON DELETE cascade ON UPDATE cascade,
CONSTRAINT Chk_Damage CHECK (Damage_Type = 'Physical' or Damage_Type = 'Special' or Damage_Type = 'Status'),
CONSTRAINT Chk_PP CHECK (PP >= 1 and PP <= 45),
CONSTRAINT Chk_Power CHECK (Power >= 0 and Power <= 250)
);


CREATE table Mechanic
(Next_Evo VARCHAR(15) NOT NULL, Level TINYINT, Item VARCHAR(20), Time VARCHAR(10), Gimmick VARCHAR(25),
PRIMARY KEY (Next_Evo),
FOREIGN KEY (Next_Evo) REFERENCES Pokemon(Pname) ON UPDATE cascade ON DELETE cascade,
CONSTRAINT Chk_Level CHECK (Level >= 1 and Level <= 100),
CONSTRAINT Chk_Time CHECK (Time = 'Night' or Time = 'Midday' or Time = 'Dusk' or Time = 'Dawn' or Time = 'Midnight')
);


CREATE table CONTAIN
(Pname VARCHAR(15) NOT NULL, Type VARCHAR(8) NOT NULL,
PRIMARY KEY (Pname, Type),
FOREIGN KEY (Pname) REFERENCES Pokemon(Pname) ON UPDATE cascade ON DELETE cascade,
FOREIGN KEY (Type) REFERENCES Type(Type_1) ON UPDATE cascade ON DElETE cascade
);


CREATE table USES
(Pname VARCHAR(15) NOT NULL, Move_Name VARCHAR(18) NOT NULL,
PRIMARY KEY (Pname, Move_Name),
FOREIGN KEY (Pname) REFERENCES Pokemon(Pname) ON UPDATE cascade ON DELETE cascade,
FOREIGN KEY (Move_Name) REFERENCES Moves(Move_Name) ON UPDATE cascade ON DELETE cascade
);


CREATE table EVOLVES_USING
(Pname VARCHAR(15) NOT NULL, Next_Evo VARCHAR(15),
PRIMARY KEY (Pname, Next_Evo),
FOREIGN KEY (Pname) REFERENCES Pokemon(Pname) ON UPDATE cascade ON DELETE cascade,
FOREIGN KEY (Next_Evo) REFERENCES Mechanic(Next_Evo) ON UPDATE cascade ON DElETE cascade,
CONSTRAINT SameName CHECK (Pname <> Next_Evo)
);

CREATE table Stats
(Pname VARCHAR(15) NOT NULL, HP TINYINT UNSIGNED NOT NULL, Attack TINYINT UNSIGNED NOT NULL, Defense TINYINT UNSIGNED NOT NULL, Special_Attack TINYINT UNSIGNED NOT NULL, Special_Defense TINYINT UNSIGNED NOT NULL, Speed TINYINT UNSIGNED NOT NULL,
PRIMARY KEY (Pname),
FOREIGN KEY (Pname) REFERENCES Pokemon(Pname) ON UPDATE cascade ON DELETE cascade,
CONSTRAINT Chk_HP CHECK (HP > 0 and HP <= 255),
CONSTRAINT Chk_Attack CHECK (Attack > 0 and Attack <= 255),
CONSTRAINT Chk_Defense CHECK (Defense > 0 and Defense <= 255),
CONSTRAINT Chk_Special_Attack CHECK (Special_Attack > 0 and Special_Attack <= 255),
CONSTRAINT Chk_Special_Defenxe CHECK (Special_Defense > 0 and Special_Defense <= 255),
CONSTRAINT Chk_Speed CHECK (Speed > 0 and Speed <= 255)
);




