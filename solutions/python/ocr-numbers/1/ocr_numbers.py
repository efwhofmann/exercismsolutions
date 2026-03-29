numbers = {(" _ ","| |", "|_|","   "):"0",
           ("   ", "  |", "  |","   " ):"1",
           (" _ ", " _|", "|_ ","   "):"2",
           (" _ ", " _|", " _|","   "):"3",
           ("   ", "|_|", "  |","   "):"4",
           (" _ ", "|_ ", " _|","   "):"5",
           (" _ ", "|_ ", "|_|","   "):"6",
           (" _ ", "  |", "  |","   "):"7",
           (" _ ", "|_|","|_|","   "):"8",
           (" _ ", "|_|"," _|","   "):"9"}

def convert(input_grid):
    if len(input_grid)%4!=0:
        raise ValueError("Number of input lines is not a multiple of four")
    if any([len(row)%3!=0 for row in input_grid]):
        raise ValueError("Number of input columns is not a multiple of three")
    lines = []
    for i in range(0,len(input_grid),4):
        line_grid=input_grid[i:i+4]
        nbs = ""
        for j in range(0,len(line_grid[0]),3):
            nbs += numbers.get((line_grid[0][j:j+3],
                  line_grid[1][j:j+3],
                  line_grid[2][j:j+3],
                  line_grid[3][j:j+3]), "?")
        lines.append(nbs)    
    return ",".join(lines)

