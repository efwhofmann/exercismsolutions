import itertools

class Matrix:
    def __init__(self, matrix_string):      
        char_matrix = [s.split() for s in matrix_string.split("\n")]
        matrix = []
        for cline in char_matrix:
            line = []
            for c in cline:
                line += [int(c)]
            matrix += [line]                
        self.matrix = matrix
        
    def row(self, index):
        return self.matrix[index-1]

    def column(self, index):
        max_len = max([len(r) for r in self.matrix])
        col = []
        for row in self.matrix:
            if len(row)>=index:
                col.append(row[index-1])
        return col
