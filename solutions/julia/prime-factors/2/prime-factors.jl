function prime_factors(num)
    factors = []
    while num % 2 == 0
        push!(factors, 2)
        num = div(num,2)
    end
    for k in 3:2:isqrt(num)
       while num % k == 0 
            push!(factors, k)
            num = div(num,k)
        end
    end
    num>1 && push!(factors,num)
    factors
end
