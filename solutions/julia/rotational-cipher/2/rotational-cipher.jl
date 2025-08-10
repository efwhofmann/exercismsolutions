 validate_key(n) = n ∉ 0:26 &&  throw(error("Invalid key!"))

function rotate(n::Integer, c::Char)
    validate_key(n)
    if c in 'A':'Z'
         out = ((x = (Int(c) + n)) > Int('Z') ? (x - Int('Z') + Int('A')-1)  : x)
    elseif c in 'a':'z'
         out = ((x = (Int(c) + n)) > Int('z') ? (x - Int('z') + Int('a')-1)  : x)
   else 
         out = c
   end
   Char(out)
end



function rotate(n::Integer,str::String) 
     validate_key(n)
     map(c->rotate(n,c), str)
end

