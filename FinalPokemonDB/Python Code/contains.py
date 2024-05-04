import pokepy
arr = []
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(1, 1018):
    print(i)
    number = 2
    s1 = "INSERT INTO CONTAIN VALUES ("
    client = pokepy.V2Client().get_pokemon(i)
    name = f'{quote}{(client[0].name).capitalize()}{quote}{comma}'
    try:
        client[0].types[1].type.name
    except IndexError:
        number = 1
    else:
        s2 = "INSERT INTO CONTAIN VALUES ("
        type1 = f'{quote}{str(client[0].types[0].type.name).capitalize()}{quote}{sliceEnd}'
        type2 = f'{quote}{str(client[0].types[1].type.name).capitalize()}{quote}{sliceEnd}'
        s1 = f'{s1}{name}{type1}'
        s2 = f'{s2}{name}{type2}'
        with open('Contains.txt', 'a') as file:
            file.write(s1 + '\n')
            file.write(s2 + '\n')
    if number == 1:
        type1 = f'{quote}{str(client[0].types[0].type.name).capitalize()}{quote}{sliceEnd}'
        s1 = f'{s1}{name}{type1}'
        with open('Contains.txt', 'a') as file:
            file.write(s1 + '\n')