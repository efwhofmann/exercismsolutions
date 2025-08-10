function square_root(n)
    if  n<0 
        throw(DomainError(n, "n must be non-negative"))
    elseif n==0
        return 0
    else
        a = 0.5*(n + 1)
        while a^2 != float(n)
         a = 0.5*(a +  n/a)
        end
       a
    end
end
