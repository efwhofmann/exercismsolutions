def largest(min_factor, max_factor):
    """Given a range of numbers, find the largest palindromes which
       are products of two numbers within that range.

    :param min_factor: int 
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
             Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    if min_factor>max_factor:
        raise ValueError('min must be <= max')
    palindrome = 0
    factors = []
    for i in range(max_factor, min_factor-1, -1):
        was_larger = False
        for j in range(i,min_factor-1,-1):
            prod = i*j 
            if prod>=palindrome:
                was_larger = True
                if is_palindrome(prod):
                    if prod>palindrome:
                        factors=[]
                        palindrome = prod
                    factors.append([j,i])
        if not was_larger:
            break
    if palindrome==0:
        return None,[]
    return palindrome, factors


def smallest(min_factor, max_factor):
    """Given a range of numbers, find the smallest palindromes which
    are products of two numbers within that range.

    :param min_factor: int 
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
    Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    if min_factor>max_factor:
        raise ValueError('min must be <= max')
    palindrome = 0
    factors = []
    for i in range(min_factor, max_factor+1):
        was_smaller = False
        for j in range(i,max_factor+1):
            prod = i*j
            if prod<= palindrome or palindrome==0:
                was_smaller = True               
                if is_palindrome(prod):
                    if prod<palindrome or palindrome==0:
                        factors=[]                    
                        palindrome = prod
                    factors.append([i,j])
            if not was_smaller:
                break
    if palindrome==0:
        return None,[]
    return palindrome, factors

def is_palindrome(number):
    digits = str(number)
    return digits == digits[::-1]