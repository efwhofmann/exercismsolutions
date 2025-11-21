powers = ["hundred", "thousand", "million", "billion"]
tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

def parse_ones(number):
    if number<1 or number>9:
        return ""
    else:
        return ones[number-1]

def parse_tens(number):
    d = number//10
    r = number % 10
    if d == 0:
        return parse_ones(r)
    elif d == 1:
        return teens[r]
    else:
        str = tens[d-2]
        if r!=0:
            str += "-" + parse_ones(r)
        return str

def parse_hundreds(number):
    d = number // 100
    r = number % 100
    if d==0:
        return parse_tens(number)
    else:
        sr = ""
        if r!=0:
            sr = " " + parse_tens(r)
        return parse_ones(d) + " " + powers[0] + sr

def say(number):
    if number==0:
        return "zero"
    elif number<0 or number>999999999999:
        raise ValueError("input out of range")
    else:
        result = ""
        pad_previous = ""
        for i in range(4):
            if number==0:
                break
            r = number%1000
            str = parse_hundreds(r)
            if i>0 and str!="":
                str += " " + powers[i] 
            result = str + pad_previous + result
            if r!=0:
                pad_previous = " "
            else:
                pad_previous = ""
            number = (number-r)//1000
        return result
                
            
