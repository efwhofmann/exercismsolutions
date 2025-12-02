import random

class Cipher:
    def __init__(self, key=None):
        if key!=None:
            self.key = key
        else:
            self.key = ""
            for _ in range(0,100):
                self.key += chr(random.randint(0,25) + ord('a'))   
        self.key_pos = 0


    def code_by_letter(self, lt, mode="encoding"):
        if lt.isalpha():
            if mode=="encoding":
                new_ord = (ord(lt) + (ord(self.key[self.key_pos]) - ord('a')))
            else:                                     
                new_ord = (ord(lt) - (ord(self.key[self.key_pos]) - ord('a')))             
            if new_ord>ord('z'):
                new_ord -= 26
            elif new_ord<ord('a'):
                new_ord += 26
            self.key_pos +=1
            self.key_pos %= len(self.key)
            return chr(new_ord)
        else:
            return lt

    def encode(self, text):
        self.key_pos = 0
        return "".join([ self.code_by_letter(ch) for ch in text.lower()])
        
    def decode(self, text):
        self.key_pos=0
        return "".join([ self.code_by_letter(ch, "decoding") for ch in text.lower()])
