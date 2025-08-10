function luhn(str)
    str = join(map(x -> isspace(str[x]) ? "" : str[x], 1:length(str) ))
    for i in 1:length(str)
        if !(isdigit(str[i]))
               return false
        end
    end
    digits = [ (c-'0') for c in str]
    len = length(digits)
    if(len<=1)
        return false
    end 
    for i in 1:len
        if mod(len-i,2) == 1 
            if digits[i]!=9 
                digits[i] = mod(2*digits[i], 9) 
            end
        end
    end
   return (mod(sum(digits),10) == 0)
end