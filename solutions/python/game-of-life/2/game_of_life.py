def tick(matrix):
    if not matrix:
        return []
    no_rows = len(matrix)
    no_cols = len(matrix[0])
    new_state = []
    for j in range(0,no_rows):
        current_row = []
        for k in range(0,no_cols):   
            cell_value = matrix[j][k]
            neighbors_alive = sum([matrix[a][b] for a in {j-1,j,j+1} 
                                   if a>=0 and a<no_rows 
                                   for b in {k-1,k,k+1} 
                                   if b>=0 and b<no_cols 
                                   and not (a==j and b==k)])
            match(neighbors_alive):
                case 2: 
                    current_row.append(cell_value)
                case 3: 
                    current_row.append(1)
                case _:
                    current_row.append(0)
        new_state.append(current_row)
    return new_state
            
            
