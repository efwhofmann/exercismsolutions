c_map = x-> (x%2 == 0 ? div(x,2) : 3*x +1)

function collatz_steps(n)
    if (n<=0) 
        throw(DomainError(n))
    else
        k = 0 
        while (n!=1) 
            n = c_map(n)
            k+=1
        end
        k
    end
end