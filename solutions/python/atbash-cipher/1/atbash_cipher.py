def code_by_char(ch):
    if ch.isalnum():
        if ch.isalpha():
            new_ord = ord('z') - (ord(ch) - ord('a'))
            return chr(new_ord)
        else:
            return ch
    else:
        return ''

def chunk_k(text, k):
   if len(text)<=k:
       return text
   else:
       return text[0:k] + " " + chunk_k(text[k:],k)    
     

def encode(plain_text):
    return chunk_k(decode(plain_text),5)


def decode(ciphered_text):
    return "".join([code_by_char(c) for c in ciphered_text.lower()]) 