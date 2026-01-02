def proverb(*input_data, qualifier=None):
    if not len(input_data):
        return  []
    res = [f"For want of a {a} the {b} was lost." for a, b in zip(input_data, input_data[1:])]
    last_item = input_data[0] if not qualifier else f"{qualifier} {input_data[0]}"
    last_line = "And all for the want of a " + last_item +"." 
    res.append(last_line)
    return res