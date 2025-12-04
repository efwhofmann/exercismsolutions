class Allergies:

    def __init__(self, score):
        self.allergies_dict = { 0:"eggs", 1:"peanuts", 2:"shellfish", 3:"strawberries",
4:"tomatoes", 5:"chocolate", 6:"pollen", 7: "cats"}
        self.score = score
        
    def allergic_to(self, item):
        return item in self.lst

    @property
    def lst(self):
        result = []
        for k in range(0,8):
            if self.score>>k&1==1:
                result.append(self.allergies_dict[k])
        return result
