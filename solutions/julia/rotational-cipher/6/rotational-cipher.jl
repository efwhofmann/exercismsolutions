validate_key(n) = n ∉ 0:26 &&  throw(error("Invalid key!"))

function rotate(key::Integer, c::Char)
    validate_key(key)
    base = islowercase(c) ? 'a' : 'A'
    isletter(c) ? (c - base + key) % 26 + base : c
end

function rotate(key::Integer,str::String) 
     # validate_key(key)
     map(c->rotate(key,c), str)
end

#Bonus A
macro R13_str(s)
    rotate(13,s)
end
export @R13_str

#Bonus B
for i in 1:26
    macro_name = Symbol("R"*string(i)*"_str")
    @eval macro $macro_name(s) 
        rotate($i, s) 
        end
end