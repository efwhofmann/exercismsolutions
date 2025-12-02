class Garden:
    def __init__(self, diagram, students=None):
        self.garden = diagram
        self.students = []
        if students == None:
            self.students = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
        else:
            self.students = students
            self.students.sort()        
        

    def letter_to_plant(self, letter):
        if letter == 'R':
            return "Radishes"
        elif letter == 'C':
            return "Clover"
        elif letter == 'V':
            return "Violets"
        else:
            return "Grass"

    def plants(self, student):
        if student not in self.students:
            raise ValueError("Invalid student")
        idx = self.students.index(student)
        offset = len(self.garden)//2 + 1 + 2*idx
        return [self.letter_to_plant(self.garden[2*idx]),
                 self.letter_to_plant(self.garden[2*idx+1]),
                 self.letter_to_plant(self.garden[offset]),
                 self.letter_to_plant(self.garden[offset+1])]