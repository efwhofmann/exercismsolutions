function matrix(strmatrix)
    rows = [map(x->parse(Int64,x),split(r)) 
         for r in split(strmatrix,'\n')]    
    columns = [[r[i] for r in rows] 
                   for i in 1:length(rows[1])]
    rows, columns
end
