def is_valid(isbn):
    factor = 10
    sum = 0
    for ch in isbn:
        if ch == '-':
            continue        
        if ch.isdigit():
            sum += factor*int(ch)
        elif ch=='X' and factor==1: 
            sum += 10
        else:
            return False
        factor -= 1                 
    return factor==0 and sum % 11 == 0
        
        
