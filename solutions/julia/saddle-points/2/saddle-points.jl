function saddlepoints(M)
    result = []
    no_rows = size(M,1)
    no_cols = size(M,2)
    for r in 1:no_rows
        m = maximum(M[r,1:no_cols])
        for c in 1:no_cols
            if M[r,c]==m && minimum(M[1:no_rows,c])==m
                push!(result,(r,c)) end            
        end
     end
    result
end
