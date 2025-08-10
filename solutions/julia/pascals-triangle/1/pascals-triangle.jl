function binom(n,k)
    if n==0 || k==0 || k==n
        1
    else
        binom(n-1,k) + binom(n-1, k-1)
    end
end


function triangle(n)
    if n<0 
        throw(DomainError(n))
    else
        p_triangle = []
        for N in 0:(n-1) 
            row = []
            for k in 0:N 
                push!(row, binom(N,k))
            end
            push!(p_triangle,row)
        end
        p_triangle
    end
end
