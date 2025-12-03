class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num
        self.pos = 0

    def valid(self):
        self.pos = 0
        if any(not ch.isdigit() and ch!=' ' for ch in self.card_num):
            return False
        mysum = sum([self.luhn_digit(ch) for ch in self.card_num[::-1]])
        return self.pos>1 and mysum%10==0

    def luhn_digit(self,ch):
        if not ch.isdigit():
            return 0
        self.pos += 1
        x = int(ch)
        if self.pos%2==0 and x!=9:
            x = 2*x % 9
        return x
       
            
