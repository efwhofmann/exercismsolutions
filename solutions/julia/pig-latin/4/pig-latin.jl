function otayigpay(word)
    vowls = r"^([aeiou]|yt|xr)(\w*)"
    consonant_rules = [r"^([^aeiou]*qu)(.*)",	 
					 r"^(y[^aeiouy]*)(.*)$", 
                     r"^([^aeiouy]+)(.*)$"] 
    occursin(vowls, word) && return word*"ay"
    for rule in consonant_rules
        parts = match(rule, word)
        isnothing(parts) || return parts[2]*parts[1]*"ay"
    end
end

function translate(phrase)
     join( otayigpay.(split(phrase)), " ")
end

