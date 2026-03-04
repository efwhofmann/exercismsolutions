using Dates

function shared_birthday(birthdates)
    monthday = map(d->d[6:end], birthdates)
    monthday != unique(monthday)
end

days = [31,28,31,30,31,30,31,31,30,31,30,31]

function random_date()    
    y = 0
    while true
        y = rand(1900:2025)
        if y%4!=0 
            break
        end
    end
    m = rand(1:12)
    d = rand(1:days[m])
    Date(join([string(y), lpad(string(m), 2, '0'), lpad(string(d), 2, '0')], '-'))
end

function random_birthdates(groupsize)
    [random_date() for _ in 1:groupsize]
end

function estimate_probability_of_shared_birthday(groupsize)
    p = 1.0
    for i in 1:(groupsize-1)
        p *= (1.0-i/365.0)
    end
    1.0 - p
end
