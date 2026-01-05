function is_valid_clean(str)
    len = length(str)
    len <=11 && len >=10 || return false
    if len == 11 && str[1]!='1'
        false
    elseif parse(Int, str[end-9])<2 || parse(Int, str[end-6])<2
        false
    else
        true
    end
end

function clean(phone_number)
    clean = replace(phone_number, r"\D"=>"")
    is_valid_clean(clean) || throw(ArgumentError("invalid number"))
    clean[end-9:end]
end
