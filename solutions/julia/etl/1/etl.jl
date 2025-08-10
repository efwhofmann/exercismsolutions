function transform(dict_in)
    result = Dict()
    for ky in keys(dict_in)
        for u_lt in 1:length(dict_in[ky]) 
            letter = lowercase(dict_in[ky][u_lt])
            single_lt_dict = Dict(letter=>ky)
            result = merge(result, single_lt_dict)
        end
    end
    result
end

