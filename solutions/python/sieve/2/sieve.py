def primes(limit):
    non_primes = set()
    primes = []
    for n in range(2,limit+1):
        if n not in non_primes:
            primes.append(n)
            [non_primes.add(k) for k in range(n*n, limit+1, n)]
    return primes

