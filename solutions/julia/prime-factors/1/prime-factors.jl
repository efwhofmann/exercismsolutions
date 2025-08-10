function prime_factors(num)
    factors = []
    for k=2:isqrt(num)
       while num % k == 0 
            push!(factors, k)
            num/=k
        end
    end
    num>1 && push!(factors,num)
    factors
end
