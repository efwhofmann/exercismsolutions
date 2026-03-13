function message(msg)
    rg =  findlast("]: ",msg)
    strip(msg[(rg[end]+1):end])
end

function log_level(msg)
    rg = findlast("]", msg)
    lowercase(msg[2:(rg[1]-1)])
end

function reformat(msg)
    level = log_level(msg)
    message(msg)*" ($level)"
end
