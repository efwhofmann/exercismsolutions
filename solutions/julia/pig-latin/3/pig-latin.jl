function otayigpay(word)
    vowls = r"^([aeiou]|yt|xr)(\w*)"
    consonant_rules = [r"^([^aeiou]*qu)(\w*)", r"^([^aeiou]+)(y\w*)", r"^([^aeiou]+)(\w*)"]
    occursin(vowls, word) && return word*"ay"
    for rule in consonant_rules
        parts = match(rule, word)
        !isnothing(parts) && return last(parts.captures) * first(parts.captures) * "ay"
    end
end

function translate(phrase)
     join( otayigpay.(split(phrase)), " ")
end

