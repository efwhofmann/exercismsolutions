INITIAL_FACTOR=0.75

def square_root(number):
    x  = int(INITIAL_FACTOR*number)
    while x*x != number:
        if x*x>number:
            x-=1
        else:
            x+=1
    return x
