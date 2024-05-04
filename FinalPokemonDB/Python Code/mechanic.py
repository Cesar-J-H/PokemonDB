import pokepy
arr = []
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(250, 540):
    print(i)
    try:
        pokepy.V2Client().get_evolution_chain(i)
    except Exception as e:
        print(e)
    else:
        client = pokepy.V2Client().get_evolution_chain(i)
    s = "INSERT INTO MECHANIC VALUES ("
    currEvo = client[0].chain.species.name
    try:
        client[0].chain.evolves_to[0].species.name
    except IndexError:
        continue
    else:
        nextEvo = client[0].chain.evolves_to[0].species.name
    if nextEvo == None:
        nextEvo = "NULL"
    else:
        nextEvo = str(nextEvo).capitalize()
    try:
        client[0].chain.evolves_to[0].evolution_details[0].min_level
    except IndexError:
        level = "NULL"
    else:
        level = client[0].chain.evolves_to[0].evolution_details[0].min_level
    if level == None:
        level = "NULL"
    else:
        level = str(level)
    try:
        client[0].chain.evolves_to[0].evolution_details[0].item
    except IndexError:
        item = "NULL"
    else:
        item = client[0].chain.evolves_to[0].evolution_details[0].item
        item = str(item)
    if item == None:
        item = "NULL"
    try:
        client[0].chain.evolves_to[0].evolution_details[0].time_of_day
    except IndexError:
        timeP = "NULL"
    else:
        timeP = client[0].chain.evolves_to[0].evolution_details[0].time_of_day
    if len(timeP) == 0:
        timeP = "NULL"
    try:
        client[0].chain.evolves_to[0].evolution_details[0].turn_upside_down
    except IndexError:
        gimmick = "NULL"
    else:
        gimmick = "Turn upside down"
    if gimmick == True:
        gimmick = "Turn upside down"
    else:
        gimmick = "NULL"
    #s = f'{s}{quote}{nextEvo}{quote}{comma}{level}{comma}{quote}{item}{quote}{comma}{timeP}{comma}{gimmick}{sliceEnd}'
    if nextEvo == "NULL":
        s = f'{s}{nextEvo}{comma}'
    else:
        s = f'{s}{quote}{nextEvo}{quote}{comma}'
    s = f'{s}{level}{comma}'
    if item == "NULL":
        s = f'{s}{item}{comma}'
    else:
        s = f'{s}{quote}{item}{quote}{comma}'
    if timeP == "NULL":
        s = f'{s}{timeP}{comma}'
    else:
        s = f'{s}{quote}{timeP}{quote}{comma}'
    if gimmick == "NULL":
        s = f'{s}{gimmick}{sliceEnd}'
    else:
        s = f'{s}{quote}{gimmick}{quote}{sliceEnd}'
    #arr.append(s)
    with open('Mechanic.txt', 'a') as file:
        #for i in arr:
        file.write(s + '\n')

