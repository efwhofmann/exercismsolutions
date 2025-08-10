
function measure_for_one(m1, m2, goal) 
    if m1==goal
        return 1, 1, 0
    elseif m2 == goal
        return 2, 2, m1
    end

    # use extended gcd to determine Bezout
    # coefficients such that u*m1 + v*m2 == d
    # (Note: gcdx returns coefficients 
    # with minimal absolute value)
    d,u,v = gcdx(m1,m2)
   
    # only solvable if gcd divides goal
    if goal % d != 0
        throw(DomainError(goal, "Not reachable"))
    end
 
    # rescale coeffients
    # such that u*m_1 + v*m_2 == goal
    u *= div(goal, d)
    v *= div(goal, d)


    # make sure u is the smallest suitable *positive* 
    # (integer) coefficient, shift u,v if necessary
    if u<0
        t = floor(Int64,-u*d/m2) + 1
        u += t*div(m2,d)
        v -= t*div(m1,d)
    end
    
    # if target volume fits into bucket one,
    # we can eliminate the last "empty two" and "pour into two" op.
    # otherwise the target volume must be in bucket two
    
    if m1 >= goal
        return 2*(u-v) - 2, 1, m2
    else 
        return 2*(u-v), 2, 0  
    end
end


function twobucket(bucket1, bucket2, goal, start)
    if goal == 0
        return 0, start, 0
    elseif goal<0 || goal > max(bucket1, bucket2)
        throw(DomainError(goal, "Not reachable"))
    end
    if start==1
        return measure_for_one(bucket1, bucket2, goal)
    elseif start==2
        # if start bucket is 2 switch the buckets
        # and switch back no. of target bucket
        no_ops, bkt_id, other_vol = measure_for_one(bucket2, bucket1, goal)
        bkt_id = (bkt_id == 1 ? 2 : 1)
        return no_ops, bkt_id, other_vol
    else
        throw(DomainError(start, "Invalid start bucket"))
    end
end
