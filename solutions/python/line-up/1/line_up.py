def line_up(name, number):
    last_digit = number % 10
    last_two = number % 100
    number_str = str(number)
    if last_two in {11,12,13}:
        number_str += "th"
    else:
        match last_digit:
            case 1:
                number_str += "st"
            case 2:
                number_str += "nd"
            case 3:
                number_str += "rd"
            case _:
                number_str += "th"
    return f"{name}, you are the {number_str} customer we serve today. Thank you!"