import math

def factors(value):
    factors = []
    limit = math.isqrt(value)+2
    for k in range(2,limit):        
        while value%k == 0:
            factors.append(k)
            value /=k
    if value>1:
        factors.append(value)
    return factors
    
            

