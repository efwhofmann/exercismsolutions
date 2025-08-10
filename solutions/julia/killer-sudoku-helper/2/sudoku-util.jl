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
    filter(x->sum(x)==s,v)|> sort
   
end

function combinations_in_cage(s, no, restr) 
    digits = [1,2,3,4, 5, 6, 7, 8, 9]
    res_digits = filter(y-> !(y in restr),digits)
    v = collect(combos(res_digits, no))
    filter(x->sum(x)==s,v)|> sort
end