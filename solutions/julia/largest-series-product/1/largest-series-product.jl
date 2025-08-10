function sub_product(sub_str)
    r = 1 
    for i in 1:length(sub_str)
        r *= parse(Int64, sub_str[i]) 
    end
    r
end

function largest_product(str, span)
        if span<0 || span > length(str)
            throw(ArgumentError("Invalid Span"))
            # most "error handling" test cases produce ArgumentErrors directly
         else
           products = Int64[]
           len = length(str)
           for i in 1:len-span+1 
                push!(products, sub_product(str[i:i+span-1]))
           end
           maximum(products)
        end
end
