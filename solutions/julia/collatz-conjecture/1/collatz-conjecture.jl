c_map = x-> (x%2 == 0 ? x/2 : 3*x +1)

function collatz_steps(n)
    if (n<=0) 
        throw(DomainError(n))
    else
        t = n*1.0
        k = 0 
        while (t!=1.0) 
            t = c_map(t)
            k+=1
        end
        k
    end
end