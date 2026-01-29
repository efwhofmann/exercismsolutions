validate_key(n) = n ∉ 0:26 &&  throw(error("Invalid key!"))

function rotate(key::Integer, c::Char)
    validate_key(key)
    if islowercase(c)
         (c - 'a' + key) % 26 + 'a'
    elseif isuppercase(c)
        (c - 'A' + key) % 26 + 'A'  
    else 
        c
    end
end

function rotate(key::Integer,str::String) 
     # validate_key(key)
     map(c->rotate(key,c), str)
end

macro R13_str(s)
    rotate(13,s)
end
export @R13_str