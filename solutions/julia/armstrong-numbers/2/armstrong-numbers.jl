function isarmstrong(num)
    if (num<0) 
        false 
    else
        d = digits(num)
        sum(d.^length(d)) == num  
    end
end 