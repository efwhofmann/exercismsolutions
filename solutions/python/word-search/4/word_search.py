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

    def look_from_to(self, word, start, delta):
        next_pt = Point(start.x, start.y)
        lt_idx = 0
        while self.puzzle[next_pt.y][next_pt.x] == word[lt_idx]:            
            if lt_idx==len(word)-1:                
                return next_pt
            next_pt.x += delta[1]
            next_pt.y += delta[0]
            if next_pt.x<0 or next_pt.x>=len(self.puzzle[0]) or next_pt.y<0 or next_pt.y>=len(self.puzzle):
                break
            lt_idx+=1
        return None
            
     
    def search(self, word):
        height = len(self.puzzle)
        width = len(self.puzzle[0])
        deltas = ((1,0), (-1,0), (0,1), (0,-1), (1,1), (1,-1), (-1,1), (-1,-1))
        for row,col in product(range(height), range(width)):
            if self.puzzle[row][col]==word[0]:
                start = Point(col,row)
                for delta in deltas:
                    end =  self.look_from_to(word, start, delta) 
                    if end is not None:
                        return start, end
        return None           