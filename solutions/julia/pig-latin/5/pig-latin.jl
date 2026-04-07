function otayigpay(word)
    rules = [r"^([aeiou].*|yt.*|xr.*)()", #vowls
            r"^([^aeiou]*qu)(.*)$",	 #rule 3
			r"^(y?[^aeiouy]*)(.*)$"] #rule 2 and 4
    for rule in rules
        parts = match(rule, word)
        isnothing(parts) || return parts[2]*parts[1]*"ay"
    end
end

function translate(phrase)
     join( otayigpay.(split(phrase)), " ")
end

