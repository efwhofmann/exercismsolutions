from itertools import product

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))


class WordSearch:
    def __init__(self, puzzle):
        self.puzzle = puzzle

    def look_from(self, word, row, col):
        wlen = len(word)
        height = len(self.puzzle)
        width = len(self.puzzle[0])
        for dv,dh in product(range(-1,2),range(-1,2)):
            if (dv,dh)!=(0,0):
                line = "".join([self.puzzle[row + dv*k][col + dh*k] for k in range(0,wlen) if 0<=row + dv*k<height and 0<=col + dh*k<width])
                if line==word:
                    return Point(col+dh*(wlen-1),row+dv*(wlen-1)) 
        return None
            
     
    def search(self, word):
        height = len(self.puzzle)
        width = len(self.puzzle[0])
        for row,col in product(range(height), range(width)):
            if self.puzzle[row][col]==word[0]:
                end = self.look_from(word, row, col)
                if end is not None:
                    return(Point(col,row), end)   
        return None           