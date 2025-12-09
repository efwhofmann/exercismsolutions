def slices(series, length):
    if series=="":
        raise ValueError('series cannot be empty')
    N = len(series)
    if length>N:
        raise ValueError('slice length cannot be greater than series length')
    elif 0==length:
        raise ValueError('slice length cannot be zero')
    elif 0>length:
        raise ValueError('slice length cannot be negative')
    res = []
    for start in range(N-length+1):
        res.append(series[start:start+length])
    return res