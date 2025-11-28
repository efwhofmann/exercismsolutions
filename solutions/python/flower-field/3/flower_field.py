def valid_garden(garden):
    if any(len(row)!=len(garden[0]) or any(ch not in "* " for ch in row) for row in garden):
        return False
    return True

def annotate(garden):
    Deltas = [[dx,dy] for dx in [-1,0,1] for dy in [-1,0,1]]
    
    numrows = len(garden)
    if 0==numrows:
        return []
    numcols = len(garden[0])
    if 0==numcols:
        return garden
    if not valid_garden(garden):
        raise ValueError("The board is invalid with current input.")
    output = garden
        
    for x in range(0,numrows):
        cur_row = list(output[x])
        for y in range(0, numcols):      
           if " "==garden[x][y]:
                count = 0
                for d in Deltas:
                    new_x = x+d[0]
                    new_y = y+d[1]
                    if (new_x>=0 and new_x<numrows) and (new_y>=0 and new_y<numcols) and '*'==garden[new_x][new_y]:
                        count+=1
                if count>0:
                    cur_row[y] = str(count)
        output[x] = "".join(cur_row)
    return output            