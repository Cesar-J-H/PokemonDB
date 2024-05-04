import pokepy
arr = []
quote = "'"
comma = ", "
sliceEnd = ");"
for i in range(1, 19):   
    client = pokepy.V2Client().get_type(i)
    s = "INSERT INTO TYPE VALUES ("
    name = client[0].name
    try:
        effective = client[0].damage_relations.double_damage_to[0].name
    except IndexError:
        effective = "NULL"
    try:
        weak = client[0].damage_relations.double_damage_from[0].name
    except IndexError:
        weak = "NULL"
    try:
        notEffective = client[0].damage_relations.half_damage_to[0].name
    except IndexError:
        notEffective = "NULL"
    #if name == "NULL":

    s = f'{s}{quote}{name.capitalize()}{quote}{comma}{quote}{effective.capitalize()}{quote}{comma}{quote}{weak.capitalize()}{quote}{comma}{quote}{notEffective.capitalize()}{quote}{sliceEnd}'
    print(s)
    #s += ("'" + name.capitalize() + "'" + ", ")
    #s += ("'" + effective.capitalize() + "'" + ", ")
    #s += ("'" + weak.capitalize() + "'" + ", ")
    #s += ("'" + notEffective.capitalize() + "'" + ");")
    #arr.append(s)
    #with open('Type.txt', 'w') as file:
        #for i in arr:
    #    file.write(i + '\n')


