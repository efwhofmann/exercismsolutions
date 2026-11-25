function slices(series, slicelength)
    res = []
    (length(series)>0 && slicelength>0 && slicelength<=length(series) ) || throw(ErrorException("Invalid input"))
    max = length(series)-slicelength+1
    for i in 1:max
        push!(res,series[i:i+slicelength-1])
    end
    res
end
