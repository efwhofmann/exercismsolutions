import itertools

class Matrix:
    def __init__(self, matrix_string):      
        self.matrix = [[int(c) for c in row.split()] 
                       for row in matrix_string.split("\n")]        
        
    def row(self, index):
        return self.matrix[index-1]

    def column(self, index):
        max_len = max([len(r) for r in self.matrix])
        col = []
        for row in self.matrix:
            if len(row)>=index:
                col.append(row[index-1])
        return col
