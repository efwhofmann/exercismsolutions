function matrix(strmatrix)
    rows = [map(x->parse(Int64,x),split(r)) 
         for r in split(strmatrix,'\n')]
    
    columns = []
    for i in 1:length(rows[1])      
        push!(columns, [r[i] for r in rows])   
    end
    rows, columns
end
