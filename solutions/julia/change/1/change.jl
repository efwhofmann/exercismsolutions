# solutions finds the correct starting coin for every amount 
# between 1 and target 

function solutions(coins, target)
    c_nums = Dict(0=>0) # min no. of coins for each amount
    sol_indices = []    # starting coin for each amount
    for p in 1:target 
        coin = 0
        min = typemax(Int64)
        for i in 1:length(coins)
            if coins[i]<=p 
                if c_nums[p-coins[i]]<min
                    min = 1 + c_nums[p-coins[i]]
                    coin = i
                end
            end
        end
        c_nums[p] =  min
        push!(sol_indices, coin)
    end
    sol_indices
end

# make_solution retives the solution for target n from 
# sols, the vector of first coins to use

function make_solution(sols, coins, n)
    res = []
    while n>0 
        sols[n] !=0 || throw(DomainError(n,"can't make target with given coins"))
        coin = coins[sols[n]]
        push!(res,coin)
        n -= coin
    end
    sort(res)
end

function change(coins, target)
    target>=0 || throw(DomainError(target, "target can't be negative"))
    sols = solutions(coins, target)
    make_solution(sols, coins, target)
end
