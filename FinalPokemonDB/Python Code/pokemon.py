import pokepy
arr = [] 
quote = "'"
comma = ", "
sliceEnd = ");"
sl = ")"
for i in range(1, 1018):
    print(i)
    s = "INSERT INTO POKEMON VALUES ("
    poke = pokepy.V2Client().get_pokemon(i)
    species = pokepy.V2Client().get_pokemon_species(i)
    name = poke[0].name
    if species[0].gender_rate == -1:
        gender = -1
    else:
        gender = species[0].gender_rate * 12.5
    evoStage = "1"
    rarity = "Basic"
    game = ""
    if i >= 1 and i <= 151:
        game = "Pokemon Red and Blue"
    elif i >= 152 and i <= 251:
        game = "Pokemon Gold and Silver"
    elif i >= 252 and i <= 386:
        game = "Pokemon Ruby and Sapphire"
    elif i >= 387 and i <= 493:
        game = "Pokemon Diamond and Pearl"
    elif i >= 494 and i <= 649:
        game = "Pokemon Black and White"
    elif i >= 650 and i <= 721:
        game = "Pokemon X and Y"
    elif i >= 722 and i <= 809:
        game = "Pokemon Sun and Moon"
    elif i >= 810 and i <= 905:
        game = "Pokemon Sword and Shield"
    elif i >= 906 and i <= 1017:
        game = "Pokemon Scarlet and Violet"
    try:
        species[0].evolves_from_species.name
    except AttributeError:
        previousEvo = "NULL"
    else:
        previousEvo = species[0].evolves_from_species.name
    if previousEvo == "NULL":
        s = f'{s}{quote}{name.capitalize()}{quote}{comma}{gender}{comma}{evoStage}{comma}{quote}{rarity}{quote}{comma}{quote}{game}{quote}{comma}{previousEvo.capitalize()}{sliceEnd}'
    else:
        s = f'{s}{quote}{name.capitalize()}{quote}{comma}{gender}{comma}{evoStage}{comma}{quote}{rarity}{quote}{comma}{quote}{game}{quote}{comma}{quote}{previousEvo.capitalize()}{quote}{sliceEnd}'
    #arr.append(s)
    with open('Pokemon.txt', 'a') as file:
        #for i in arr:
        file.write(s + '\n')


