INITIAL_FACTOR=0.75

def square_root(number):
    dn = 1
    rest = number
    sq = 0
    # start with sqrt of largest power of 4 <=number
    while dn <= number:
        dn <<= 2 
    dn >>=2 
    # now update according to the binary digit-wise algorithm
    while dn!=0:
        if number>sq+dn:
            number -= sq+dn
            sq += 2*dn    
        sq //=2
        dn //=4 
    sq +=1
    return sq
