function luhn(str)
    len = 0
    sum = 0
    for ch in Iterators.reverse(str)
        if isdigit(ch)
           len += 1
           x = ch - '0'
           sum += iseven(len) ?  (x==9 ? 9 : mod(2*x,9)  ) : x 
        elseif ch!=' ' 
           return false 
        end
    end
   return len>1 ? (sum % 10  == 0) : false
end