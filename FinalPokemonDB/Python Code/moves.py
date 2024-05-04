import pokepy
arr = []
quote = "'"
comma = ", "
sliceEnd = ");"
sl = ")"
for i in range(1, 900):
    print(i)
    client = pokepy.V2Client().get_move(i)
    s = "INSERT INTO MOVES VALUES ("
    name = client[0].name
    category = client[0].damage_class.name
    pp = client[0].pp
    power = client[0].power
    mType = client[0].type.name
    s=f'{s}{quote}{name.capitalize()}{quote}{comma}'
    s=f'{s}{quote}{category.capitalize()}{quote}{comma}'
    s=f'{s}{str(pp)}{comma}'
    s=f'{s}{str(power)}{comma}'
    s=f'{s}{quote}{mType.capitalize()}{quote}{sliceEnd}'
    #s += ("'" + name.capitalize() + "'" + ", ")
    #s += ("'" + category.capitalize() + "'" + ", ")
    #s += (str(pp) + ", ")
    #s += (str(power) + ", ")
    #s += ("'" + mType.capitalize() + "'" + ")")
    #s += ";"
    arr.append(s)
with open('Moves.txt', 'w') as file:
    for i in arr:
        print(i)
        file.write(i + '\n')


