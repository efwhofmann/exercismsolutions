function isarmstrong(num)
    if (num<=0) 
        num==0 
    else
        digits = []
        n = num
        while n>0
            d = n % 10 
            push!(digits, d)
            n = (n - d) /10
        end
        sum(x->x^length(digits),digits) == num  
    end
end 