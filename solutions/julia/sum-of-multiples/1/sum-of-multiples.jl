function get_one_set(limit, factor)
    factor == 0 ? Set() : 
     Set(collect(factor:factor:limit-1))
end

function sum_of_multiples(limit, factors)
    s = Set()
    for i in 1:length(factors)
                 s = union(s, get_one_set(limit,factors[i]))
    end
    isempty(s) ? 0 : sum(s)
end
