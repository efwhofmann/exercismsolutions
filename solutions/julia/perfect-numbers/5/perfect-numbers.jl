function sigma_n(n) 
    n>0 || throw(DomainError(n))
    sum( x->(n%x == 0 ? x : 0) , 1:div(n,2) ; init=0)
end

isperfect(n) = (sigma_n(n)==n)

isabundant(n) = (sigma_n(n)>n)

isdeficient(n) = (sigma_n(n)<n)

