function triangle(n)
    n>=0 || throw(DomainError(n))
    n==0 && return []
    n==1 && return [[1]]

    current = [[1],[1,1]]
    for row in 3:n
        prev = current[end]
        push!(current, append!([1],[prev[i]+prev[i+1] for i in 1:(length(prev)-1)],[1]))
    end
    current
end