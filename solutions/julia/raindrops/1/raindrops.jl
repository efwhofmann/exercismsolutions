function pling(number)
    if (number % 3 == 0) 
        "Pling"
    else
        ""
    end
end

function plang(number)
    if (number % 5 == 0) 
        "Plang"
    else
        ""
    end
end

function plong(number)
    if (number % 7 == 0) 
        "Plong"
    else
        ""
    end
end

function nodrops(number)
    if  !((number % 3 == 0) || (number % 5 == 0) || (number % 7 ==0)) 
        "$number"
    else
        ""
    end
end

function raindrops(number)
     string(pling(number), plang(number), plong(number), nodrops(number))
end
