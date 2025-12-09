class School:
    def __init__(self):
        self.school={}
        self.aditions=[]

    def add_student(self, name, grade):
        if name not in self.roster():
            self.school[grade] = self.school.get(grade, []) + [name]  
            self.aditions.append(True)
        else:
            self.aditions.append(False)
            
    def roster(self):
        return [name 
                for grade in sorted(self.school.keys())
                for name in sorted(self.school[grade])]

    def grade(self, grade_number):
        return sorted(self.school.get(grade_number, []))
        

    def added(self):
        return self.aditions
