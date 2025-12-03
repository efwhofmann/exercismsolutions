function sigma_n(n) 
    n>0 || throw(DomainError(n))
    n>1 ? sum( x->(n%x == 0 ? x : 0) , 1:div(n,2)) : 0
end

isperfect(n) = (sigma_n(n)==n)

isabundant(n) = (sigma_n(n)>n)

isdeficient(n) = (sigma_n(n)<n)

