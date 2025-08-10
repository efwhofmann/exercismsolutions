function combos(digits, n)
    res = [[]]
    for d in digits, j in eachindex(res)
        push!(res, [res[j]; d])
    end
    filter(x->length(x)==n,res)
end

function combinations_in_cage(s, no) 
    digits = [1,2,3,4, 5, 6, 7, 8, 9]
    v = collect(combos(digits, no))
    res = []
    if v!= []
        for i=1:length(v) 
            if sum(v[i]) == s 
                push!(res , v[i])
            end
        end
    end
    res |> sort
end

function combinations_in_cage(s, no, excl) 
    digits = [1,2,3,4, 5, 6, 7, 8, 9]
    if excl != []
        for i = 1:length(excl)
            deleteat!(digits, findall(x->x==excl[i],digits))
        end
    end
    v = collect(combos(digits, no))
    res = []
    if v!= []
        for i=1:length(v) 
            if sum(v[i]) == s 
                push!(res , v[i])
            end
        end
    end
    res |> sort
end