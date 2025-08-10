function trinary_to_decimal(str)
    digits = collect(str)
    value = 0
    for d in digits
        dval = d -'0'
        if (dval>2 || dval<0) 
            return 0
        else
            value = 3*value + dval
        end
    end
    value
end
