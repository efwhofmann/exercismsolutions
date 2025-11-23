def primes(limit):
    allns = [n for n in range(1,limit+1)]
    for current in range(2,limit+1):
        if allns[current-1]!=0:
            next_prime = current
            k = 2*next_prime
            while k<=limit:
                allns[k-1] = 0
                k += next_prime
    return [p for p in allns if p>1]

