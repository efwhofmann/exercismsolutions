def lines(input_data):
    res = []
    for idx in range(0,len(input_data)-1):
        line = "For want of a " + input_data[idx] + " the " + input_data[idx+1] + " was lost."
        res.append(line)
    return res

def last_line(input_data, quali=None):
    if quali==None:
        return "And all for the want of a " + input_data[0] + "."
    else:
        return "And all for the want of a " + quali  + " " + input_data[0] + "."


def proverb(*input_data, qualifier=None):
    res = []
    if len(input_data)!=0:
        res += lines(input_data)
        res.append(last_line(input_data,qualifier))
    return res