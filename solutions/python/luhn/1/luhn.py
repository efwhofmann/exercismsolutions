class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num

    def valid(self):
        len = 0
        sum = 0
        for ch in self.card_num[::-1]:
            if ch.isdigit():
                len += 1
                x = int(ch)
                if len%2==0:
                    if x==9:
                        sum += 9
                    else:
                        sum += (2*x)%9
                else:
                    sum += x                    
            elif ch!=' ':
                return False
        return len>1 and sum%10==0
            
