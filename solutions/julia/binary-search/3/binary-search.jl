# Change any of the following NamedTuple values to true to 
# enable testing different bonus tasks
tested_bonus_tasks = (rev = true, by = true, lt = true, multiple_matches = true)

function extend_range(A, rng)
    left = right = pos = collect(rng)[1]
    key = A[pos]
    rmax = length(A)
    lmin = 1
    while (left - 1)>=lmin && A[left-1]==key 
        left -=1
    end
    while (right+1)<= rmax && A[right+1]==key 
        right +=1
    end
    left:right
end       

function binarysearch(sorted_v, key; rev=false, by = identity, lt = <)
    A = by.(sorted_v)
    k = by(key)
    rev && (lt = >)
    high = length(A)
    low = 1
    while low<=high
        mid = (high + low) ÷ 2
        if lt(A[mid],k)
              low = mid + 1
        elseif A[mid] == k
                res = mid:mid
                break 
        else  !lt(A[mid],k)
                high = mid-1
        end
    end
    if low == high 
         res
    elseif low>high # not found, return insertion point
            res = low:high
    else # found, multiple_matches possible
            res = extend_range(A,res) 
    end
end