# Change any of the following NamedTuple values to true to 
# enable testing different bonus tasks
tested_bonus_tasks = (rev = false, by = false, lt = false, multiple_matches = true)

# second iteration, with multiple_matches

function extend_range(sorted_v, rng)
    left = right = pos = collect(rng)[1]
    key = sorted_v[pos]
    rmax = length(sorted_v)
    lmin = 1
    while (left - 1)>=lmin && sorted_v[left-1]==key 
        left -=1
    end
    while (right+1)<= rmax && sorted_v[right+1]==key 
        right +=1
    end
    left:right
end    
    



function binarysearch(sorted_v, key)
    res = 0:0
    high = length(sorted_v)
    low = 1
    while low<=high
        mid = (high + low) ÷ 2
        if sorted_v[mid] > key
              high = mid-1
        elseif sorted_v[mid] < key
                low = mid+1
        elseif sorted_v[mid] == key
                res = mid:mid
                break 
            end
    end
    if low == high 
         res
    elseif low>high # not found, return insertion point
            res = low:high
    else # found, multiple_matches possible
            res = extend_range(sorted_v,res) 
    end

end