function sieve(limit)
    allns = [n for n=1:limit]
        for cur in 2:limit
             if  allns[cur]!=0 
                next_prime = cur
                k = 2*next_prime
                while k<=limit
                    allns[k] = 0
                    k += next_prime
                end
             end
         end 
    allns[allns .> 1]
end
