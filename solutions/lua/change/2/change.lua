-- my first, recursive version doesn't find the solution with the minimum number of coins 
-- the following is essentially Gelennj's solution
-- (I wanted to understand the algorithm better)

-- the following function finds the solutions for all amounts up to amount the given values (i.e. coin denominations)
-- only S, which stores the first coin idx for every amount is used later

local function change (amount, values)
  local C = {[0] = 0} 
  local S = {}
  for p = 1, amount do
      local min = math.maxinteger
      local coin
      for i = 1, #values do
        if values[i] <= p then
          if C[p - values[i]]<min then
                 min = 1 + C[p - values[i]]
                 coin = i
          end
        end              
      end
      C[p] = min
      S[p] = coin
  end
  return C,S
end

-- now, starting with n, we retrive the solution from S

local function make_solution (S, values, n)
    result = {}
    while n>0 do
      local coin = values[S[n]] 
      assert(coin, "can't make target with given coins")
      table.insert(result, 1, coin)
      n = n - coin
    end
    return result
end

return function (amount, values)
  assert(amount>=0, "target can't be negative") 
  if amount==0 then 
      return {}
  end
  _, first_cs = change(amount, values)
  return make_solution(first_cs, values, amount)  
end   