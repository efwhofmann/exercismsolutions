
function sum_of_multiples(limit, factors)
    s = Set(0)
    for f in factors 
                 s = f==0 ? s : union(s, Set(collect(f:f:limit-1)))
    end
    sum(s)
end
