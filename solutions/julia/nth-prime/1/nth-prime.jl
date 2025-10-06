function prime(num)
    if num<1
        error("No such prime!")
    else
        primes = Int[2]
        candidate = 3
        while length(primes)<=num 
            is_prime = true
            for p in primes
                if candidate%p==0 
                    is_prime = false
                    break
                end
            end
            is_prime && push!(primes, candidate)
            candidate += 2
        end
        primes[num]
    end
end
