INITIAL_FACTOR=0.75

def square_root(number):
    x = INITIAL_FACTOR*number
    while x*x<number or x*x>=number+1:
        x = 0.5*(x+number/x)
    return int(x)
