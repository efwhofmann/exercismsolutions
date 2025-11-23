def gcdx(a, b):
    """ extended gcd of a, b 
        returns gcd and coefficents u,v 
        s.t.
        gcd = u*a + v*b    
    """
    if b==0:
        gcd = a
        u = 1
        v = 0
    else:
        gcd, u1, u = gcdx(b, a%b)        
        v = u1 - u * (a//b)
    return gcd, u, v

def measure_one(bucket_one, bucket_two, target_volume):
    """
    solves the two-bucket problem
    for the case that bucket one is the first to fill 

    input: size of bucket one,
        size of bucket two,
        desired number of liters to reach

    output:
        total number of steps,
        which bucket holds the desired number of liters,
        how many liters are left in the other bucket     
    """
    if target_volume == bucket_one:
        return (1,"one", 0)
    elif target_volume == bucket_two:
        return  (2,"two", bucket_one)

    d,u,v = gcdx(bucket_one, bucket_two)
    if target_volume%d!=0:
        raise ValueError('Not possible.')
    u *= target_volume//d
    v *= target_volume//d

    if u<0:
        t = -u*d//bucket_two + 1
        u += (bucket_two//d)*t
        v -= (bucket_one//d)*t
    if bucket_one>=target_volume:
        return (abs(2*(u-v)-2), "one", bucket_two)
    else:
        return  (abs(2*(u-v)), "two", 0)
        

def measure(bucket_one, bucket_two, goal, start_bucket):
    """
    solves the two-bucket problem
    
    input: size of bucket one,
        size of bucket two,
        desired number of liters to reach,
        which bucket is first to fill

    output:
        total number of steps,
        which bucket holds the desired number of liters,
        how many liters are left in the other bucket    
    """
    if goal == 0:
        return (0,"one", 0)
    elif goal<0 or goal>max(bucket_one, bucket_two):
        raise ValueError('Not possible.')
    elif start_bucket == "one":
        return measure_one(bucket_one, bucket_two, goal)
    else:
        moves, target, other_vol = measure_one(bucket_two, bucket_one, goal)
        if target == "one":
            target = "two"
        elif target == "two":
            target = "one"
        return (moves, target, other_vol)