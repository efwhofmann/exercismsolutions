function get_one_set(limit, factor)
    factor == 0 ? Set() : 
     Set(collect(factor:factor:limit-1))
end

function sum_of_multiples(limit, factors)
    s = Set(0)
    for f=factors 
                 s = union(s, get_one_set(limit,f))
    end
    sum(s)
end
