def transform(ch,a,b):
    d = ((ord(ch.lower()) - ord('a'))*a + b)%26
    return chr(d + ord('a'))

def inv_transform(ch,a,b):
    # modular inverses for 2*idx+1, i.e. 1,3,5,...  (not for 13)
    inverses = [1, 9, 21, 15, 3, 19, 0, 7, 23, 11, 5, 17, 25]
    ia = inverses[((a-1)//2)]
    d = ia*((ord(ch.lower()) - ord('a'))-b)%26
    if d<0:
        d += 26
    return chr(d + ord('a'))

def chunk_k(str,k):
    if len(str)<=k:
        return str
    else:
        return str[0:k] + ' ' + chunk_k(str[k:],k)

def apply_code(txt, a, b, mode):
     if a%2==0 or a%13==0:
        raise ValueError("a and m must be coprime.")
     out = ""
     for c in txt:
        if c.isdigit():
            out += c
        elif c.isalpha():
            if mode=="en":
                out += transform(c, a, b)  
            else:
                out += inv_transform(c, a, b)
     if mode=="en":
        return chunk_k(out,5)
     else:
        return out    
    
def encode(plain_text, a, b):
    return apply_code(plain_text, a, b, "en")
    
def decode(ciphered_text, a, b):
    return apply_code(ciphered_text, a, b, "de")