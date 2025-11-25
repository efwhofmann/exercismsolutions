def validate_inputs(in_base, dgts, out_base):
    if in_base<=1:
        raise ValueError("input base must be >= 2")
    if out_base<=1:
        raise ValueError("output base must be >= 2")
    for d in dgts:
        if d<0 or d>=in_base:
            raise ValueError("all digits must satisfy 0 <= d < input base")

def digits_to_int(base, digits):
    num = 0
    base_power = 1
    digits.reverse()
    for d in digits:
        num += d*base_power
        base_power *= base
    return num 

def int_to_digits(num, base):
    digits = []
    while num>0:
        digits.append(num % base)
        num //= base
    if digits==[]:
        digits = [0]
    digits.reverse()
    return digits

def rebase(input_base, digits, output_base):
    validate_inputs(input_base, digits, output_base)
    number = digits_to_int(input_base, digits)
    result = int_to_digits(number, output_base)
    return result
    
