def saddle_points(matrix):
    result = []
    if matrix==[]:
        return result
    no_rows = len(matrix)
    no_cols = len(matrix[0])
    for r in range(0,no_rows):
        if len(matrix[r]) != len(matrix[0]):
            raise ValueError("irregular matrix")
        m = max(matrix[r])
        
        for c in range(0, no_cols):
            if matrix[r][c]==m and min([row[c] for row in matrix])==m:
              result.append({"row" : r+1, "column" : c+1})  
    return result