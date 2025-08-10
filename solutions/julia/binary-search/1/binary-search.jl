# Change any of the following NamedTuple values to true to 
# enable testing different bonus tasks
tested_bonus_tasks = (rev = false, by = false, lt = false, multiple_matches = false)

# first iteration, no bonus tasks
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
    low>high && (res = low:high) 
    res   
end