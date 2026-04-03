import math

def cipher_text(plain_text):
    clean_text = "".join(filter(str.isalnum, plain_text.lower()))
    length = len(clean_text)
    columns = math.ceil(math.sqrt(length))
    rows = columns
    if columns*(columns-1)>=length:
        rows -=1
    padding = columns*rows - length
    output = ""
    for i in range(0,columns):
        for j in range(0,rows):
            idx = j*columns + i
            if idx<length:
                output += clean_text[idx]
        if i>=columns-padding:
            output += ' '
        if columns>0 and i<columns-1:
            output += ' '
    return output
                