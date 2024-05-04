import pokepy
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(1, 1018):
    print(i)
    client = pokepy.V2Client().get_pokemon(i)
    s = "INSERT INTO STATS VALUES ("
    name = f'{quote}{str(client[0].name).capitalize()}{quote}{comma}'
    hp = f'{client[0].stats[0].base_stat}{comma}'
    attack = f'{client[0].stats[1].base_stat}{comma}'
    defense = f'{client[0].stats[2].base_stat}{comma}'
    specialAttack = f'{client[0].stats[3].base_stat}{comma}'
    specialDefense = f'{client[0].stats[4].base_stat}{comma}'
    speed = f'{client[0].stats[5].base_stat}{sliceEnd}'
    s = f'{s}{name}{hp}{attack}{defense}{specialAttack}{specialDefense}{speed}'
    with open('Stats.txt', 'a') as file:
        file.write(s + '\n')

