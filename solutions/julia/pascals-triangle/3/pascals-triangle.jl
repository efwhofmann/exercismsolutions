function triangle(n)
    n>=0 || throw(DomainError(n))
    [[binomial(k,l) for l in 0:k] for k in 0:n-1]
end