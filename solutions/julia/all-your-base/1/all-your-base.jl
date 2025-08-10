function validate_input(digits, base_in, base_out)
    if base_in<=1
        throw(DomainError(base_in, "Invalid base"))
    elseif base_out<=1
        throw(DomainError(base_out, "Invalid base"))
    else
        for i in eachindex(digits)
            if digits[i]<0 || digits[i]>=base_in 
                throw(DomainError(digits[i], "Invalid Digit"))
            end
        end        
    end
end

function digits_to_int(digits, base)
    num = 0
    b_power = 1
    ds = reverse(digits)
    for i in eachindex(ds)
        num += ds[i]*b_power
        b_power *= base
    end
    num
end

function int_to_digits(num, base)
    digits = []
    while num>0
        push!(digits, num % base)
        num ÷= base
    end
    reverse(digits)
end


function all_your_base(digits, base_in, base_out)
    validate_input(digits, base_in, base_out)
    number = digits_to_int(digits, base_in)
    result = int_to_digits(number, base_out)    
    isempty(result) ? [0] : result
end