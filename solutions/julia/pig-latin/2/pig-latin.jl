function translate(phrase)
    inital_vowls = r"(\b)([aeiou]|xr|yt)" 
    consonants = r"(\b)([^aeou]?qu|y|[^aeiouy]+)"
    if occursin(inital_vowls, phrase)
        phrase =  phrase * "ay"
    else
        result = ""
        for subphrase in split(phrase)
        if occursin(consonants, subphrase)
            first = subphrase[findfirst(consonants, subphrase)]
            second = replace(subphrase, consonants => "")      
            subphrase =  second * first * "ay"
            result = result*subphrase*" "            
        end
        end
        if result != "" 
            phrase = rstrip(result)
        end
    end
    return phrase
end

