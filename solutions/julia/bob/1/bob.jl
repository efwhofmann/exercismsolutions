responses = (
    "Sure.",
    "Whoa, chill out!",
    "Calm down, I know what I'm doing!",
    "Fine. Be that way!",
    "Whatever."
)

function is_shouting(stimulus)
    occursin(r"\p{Lu}", stimulus) && !occursin(r"\p{Ll}", stimulus)
end

function is_silence(stimulus)
    !occursin(r"\S", stimulus)
end

function bob(stimulus)
    if is_silence(stimulus) 
        reaction = responses[4]
    elseif last(strip(stimulus)) == '?'
        is_shouting(stimulus) ? reaction = responses[3] : reaction = responses[1]
    elseif is_shouting(stimulus)
        reaction = responses[2]
    else 
        reaction = responses[5]
    end
end
