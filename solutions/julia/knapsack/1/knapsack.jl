function maximum_value(maximum_weight, items)
    0 == length(items)  && return 0
    table = zeros(Int64, length(items)+1, maximum_weight + 1)
    for (idx,itm) in enumerate(items)
        for wgt in 1:maximum_weight
            prevItemVal= table[idx,wgt+1]
            if wgt>= itm.weight
                table[idx+1,wgt+1] = max(table[idx,wgt - itm.weight+1] + itm.value, prevItemVal)
            else
                table[idx+1,wgt+1] = prevItemVal
            end
        end
    end
    table[length(items)+1, maximum_weight+1]
end