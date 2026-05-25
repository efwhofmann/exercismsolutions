# Possible sublist categories.
SUBLIST = 1
SUPERLIST = 3
EQUAL = 2
UNEQUAL = 0

def is_sublist(list_one, list_two):
    if len(list_two)<len(list_one):
        return False
    if list_one == []:
        return True
    for j in range(0,len(list_two)):
        i=0
        while i<len(list_one) and j+i<len(list_two) and list_two[j+i] == list_one[i]:
            i=i+1
        if i==len(list_one):
            return True
    return False

def sublist(list_one, list_two):
    oneInTwo = is_sublist(list_one,list_two)
    if oneInTwo and (len(list_one)<len(list_two)):
        return SUBLIST
    elif oneInTwo and (len(list_one)==len(list_two)):
        return EQUAL

    twoInOne = is_sublist(list_two,list_one)
    if twoInOne and (len(list_two)<len(list_one)):
        return SUPERLIST
    else:
        return UNEQUAL