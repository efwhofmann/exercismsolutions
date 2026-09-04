KeysAndInvs = Dict( 1=>1, 3=>9, 5=>21, 7=>15, 9=>3, 11=>19, 15=>7, 17=>23, 19=>11, 21=>5, 23=>17, 25=>25)

function validateKey(a::Integer)
    get(KeysAndInvs, a, 0)!=0 ||                 throw(ArgumentError("Invalid key"))
end

function encode(c::Char, a::Integer, b::Integer)
 validateKey(a)
 isletter(c) ?  ((lowercase(c)-'a')*a + b) % 26 + 'a' : c  
end


function encode(plaintext::String, a::Integer, b::Integer)
    clean = filter(c->isletter(c)||isdigit(c), plaintext)
    crypt = map(c->encode(c,a,b), clean)
    join(map(join, Iterators.partition(crypt,5)), " ")
end

function decode(c::Char, a::Integer, b::Integer)
    validateKey(a)
    isdigit(c) && return c
    ia = KeysAndInvs[a]
    d = (ia*(c-'a' - b))% 26
    d<0 ? d+26 + 'a' : d + 'a'
end

function decode(ciphertext::String, a::Integer, b::Integer)
    clean = filter(c->isletter(c)||isdigit(c), ciphertext)
    map(c->decode(c,a,b), clean)
end
