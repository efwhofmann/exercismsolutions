function ispalindrome(num) 
    dgts = digits(num)
    dgts[1] == last(dgts) && dgts==reverse(dgts)
end

function palindromeproducts(low::Int, high::Int, smallest::Bool)
    low>high && throw(ArgumentError(""))
    factors = []
    palindrome = nothing
    for i in low:high 
        for j in i:high
            prod = i*j
            if ispalindrome(prod) 
                if isnothing(palindrome) || 
                    (smallest && prod < palindrome) || 
                        (!smallest && prod>palindrome) 
                    palindrome = prod
                    factors = [[i,j]]
                elseif prod==palindrome
                    push!(factors, [i,j])
                end                    
            end    
        end
    end
    palindrome, factors
end