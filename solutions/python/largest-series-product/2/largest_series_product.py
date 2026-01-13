from functools import reduce

def sub_product(substr):
    return reduce(lambda x,y: x*y, [int(c) for c in substr])

def only_digits(str):
    return len(list(filter(lambda c: c.isdigit(), str)))==len(str)

def largest_product(series, size):
    if size>len(series):
        raise ValueError("span must not exceed string length")
    elif size<0:
        raise ValueError("span must not be negative")
    elif not only_digits(series):
        raise ValueError("digits input must only contain digits")
    return max([sub_product(series[i:i+size]) for i in range(0,len(series)-size+1)])