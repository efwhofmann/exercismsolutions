function sigma_n(n) 
    if (n<=0) 
        throw(DomainError(n))
    else
        n>1 ? sum( x->(n%x == 0 ? x : 0) , 1:(n-1)) : 0
    end
end

isperfect(n) = (sigma_n(n)==n)

isabundant(n) = (sigma_n(n)>n)

isdeficient(n) = (sigma_n(n)<n)

