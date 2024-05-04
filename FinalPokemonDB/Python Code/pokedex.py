import pokepy
arr = [] 
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(1, 1018):
    client = pokepy.V2Client().get_pokemon(i)
    name = client[0].name
    region = 0
    if i >= 1 and i <= 151:
        region = i
    elif i >= 152 and i <= 251:
        region = i - 151
    elif i >= 252 and i <= 386:
        region = i - 251
    elif i >= 387 and i <= 493:
        region = i - 386
    elif i >= 494 and i <= 649:
        region = i - 493
    elif i >= 650 and i <= 721:
        region = i - 649
    elif i >= 722 and i <= 809:
        region = i - 721
    elif i >= 810 and i <= 905:
        region = i - 809
    else:
        region = i - 905
    national = client[0].id
    s = "INSERT INTO POKEDEX VALUES ("
    s = f'{s}{str(national)}{comma}{str(region)}{comma}{quote}{name.capitalize()}{quote}{sliceEnd}'
    #s += (str(national) + ", ")
    #s += (str(region)+ ", ")
    #s += ("'" + name.capitalize() + "'" + ");")
    #arr.append(s)
    with open('Pokedex.txt', 'a') as file:
        #for i in arr:
        file.write(s + '\n')