function row(k)
    [binomial(k,l) for l in 0:k]
end

function triangle(n)
    n>=0 || throw(DomainError(n))
    [row(k) for k in 0:n-1]
end