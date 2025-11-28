import itertools
  

def combinations(target, size, exclude):
    digits = [1,2,3,4, 5, 6, 7, 8, 9]
    res_digits = filter( lambda d: not (d in exclude), digits)
    combos = list(itertools.combinations(res_digits, size))
    return [list(c) for c in filter( lambda l: sum(l) == target, combos)]   