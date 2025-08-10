function sigma_n(n) 
    if (n<=0) 
        throw(DomainError(n))
    else
        sum = 0
        for i in 1:(n-1) 
            if (n % i) == 0
                sum += i
            end
        end
        sum
    end
end

isperfect(n) = (sigma_n(n)==n)

isabundant(n) = (sigma_n(n)>n)

isdeficient(n) = (sigma_n(n)<n)

