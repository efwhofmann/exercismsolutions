from itertools import zip_longest

def transpose(text):
    if not text:
        return ''
    A =  [line.replace(' ','-') for line in text.split("\n")];
    max_length = max([len(a) for a in A])
    transpose = list(map(lambda l: ''.join(l), zip_longest(*A, fillvalue=' ')))
    transpose =  [item.rstrip().replace('-',' ') for item in transpose]
    return "\n".join(transpose)
