function trinary_to_decimal(str)
    digits = collect(str)
    value = 0
    for d in digits
        if d in '0':'2'
            value = 3*value + (d - '0')
        else
            return 0
        end
    end
    value
end
