function generate_key()
    join([rand('a':'z') for _ in 1:100])
end

modLength(idx,len) = idx%len==0 ? len : idx%len
function getLowerCaseLetter(c) 
    if c >= 26 
        c = c - 26
    elseif c < 0 
        c = c + 26
    end
    c + 'a'    
end

function encodeLetter(c,k)
    shift = k - 'a'    
    new = (c - 'a'+ shift)   
    getLowerCaseLetter(new)
end

function encode(plaintext, key)
    len = length(key)
    join([encodeLetter(c,key[modLength(i,len)]) for (i, c) in enumerate(plaintext)])
end

function decodeLetter(c,k)
     shift = k - 'a'    
    new = (c - 'a' - shift)   
    getLowerCaseLetter(new)
end

function decode(ciphertext, key)
    len = length(key)
    join([decodeLetter(c,key[modLength(i,len)]) for (i, c) in enumerate(ciphertext)])
end
