import pokepy
arr = []
moveArr = []
 
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(1, 1018):
    print(i)
    client = pokepy.V2Client().get_pokemon(i)
    name = f'{quote}{str(client[0].name).capitalize()}{quote}{comma}'
    for j in range(1, 6):
        s = "INSERT INTO USES VALUES ("
        try:
            client[0].moves[j].move.name
        except IndexError:
            continue
        move = f'{quote}{str(client[0].moves[j].move.name).capitalize()}{quote}{sliceEnd}'
        s = f'{s}{name}{move}'
        with open('Uses.txt', 'a') as file:
            file.write(s + '\n')


