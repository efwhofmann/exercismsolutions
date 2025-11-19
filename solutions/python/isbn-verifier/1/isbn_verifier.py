def is_valid(isbn):
    factor = 10
    sum = 0
    for ch in isbn:
        if ch == '-':
            continue        
        valid = ch.isdigit() or (ch=='X' and factor==1)
        if not valid:
            return False
        else:
            if ch.isdigit():
                sum += factor*int(ch)
            else: 
                sum += 10
            factor -= 1                 
    return factor==0 and sum % 11 == 0
        
        
