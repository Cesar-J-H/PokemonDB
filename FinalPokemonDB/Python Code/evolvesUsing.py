import pokepy
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(1, 544):
    print(i)
    flag = True
    try:
        pokepy.V2Client().get_evolution_chain(i)
    except Exception as e:
        print(e)
    else:
        client = pokepy.V2Client().get_evolution_chain(i)
    s = "INSERT INTO EVOLVES_USING VALUES ("
    name = f'{quote}{str(client[0].chain.species.name).capitalize()}{quote}{comma}'
    try:
        client[0].chain.evolves_to[0].species.name
    except IndexError:
        nextEvo = "NULL"
        flag = False
    else:    
        nextEvo = f'{quote}{str(client[0].chain.evolves_to[0].species.name).capitalize()}{quote}{sliceEnd}'
    if nextEvo == None:
        nextEvo = "NULL"  
        flag = False 
    if nextEvo == "NULL":
        s = f'{s}{name}{nextEvo}{sliceEnd}'
    else:
        s = f'{s}{name}{nextEvo}'
    if flag:
        with open('EvolvesUsing.txt', 'a') as file:
            file.write(s + '\n')