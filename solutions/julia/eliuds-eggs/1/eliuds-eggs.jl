function eggcount(number)
    sum = 0
    while number>0
       sum += (number & 1)
       number = number >>> 1 
    end
    sum
end
