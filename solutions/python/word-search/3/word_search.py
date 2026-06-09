from itertools import product

class Point:
    def __init__(self, x, y):
        self.x = None
        self.y = None

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))


class WordSearch:
    def __init__(self, puzzle):
        self.puzzle = puzzle

    def search(self, word):
        height = len(self.puzzle)
        width = len(self.puzzle[0])
        deltas = ((1,0), (-1,0), (0,1), (0,-1), (1,1), (1,-1), (-1,1), (-1,-1))
        for y,x in product(range(height), range(width)):
            if self.puzzle[y][x]==word[0]:
                for delta in deltas:
                    letter = 0
                    new_y = y
                    new_x = x
                    while self.puzzle[new_y][new_x]==word[letter]:    
                        if letter==len(word)-1:
                            point1 = Point(x,y)
                            point2 = Point(new_x, new_y)
                            return point1,point2   
                        new_y = new_y + delta[0]
                        new_x = new_x + delta[1]
                        if new_x<0 or new_x>=width or new_y<0 or new_y>=height:
                            break
                        letter += 1                            
        return None           