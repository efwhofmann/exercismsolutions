function encode(s)
    result = ""
    regexp = r"(.)\1*"
    for matched in eachmatch(regexp,s)
        l = length(matched.match)
        repno = (l > 1) ? string(l) : "" 
        result *= repno*matched[1]
    end
    result
end



function decode(s)
    result = ""
    regexp = r"(\d*)([^1-9])"
    for matched in eachmatch(regexp,s)
        reps = matched[1] == "" ? 1 : parse(Int, matched[1]) 
        result *= repeat(matched[2], reps)     
    end
    result    
end
