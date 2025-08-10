function max_in_row(R, nr)
    s = Set()
    m = maximum(R)
    for i in 1:length(R)
        if R[i]==m 
            push!(s, (nr,i))
        end
    end
    s
end

function min_in_col(C,nr)
    s = Set()
    m = minimum(C)
    for j in 1:length(C)
        if C[j]==m 
            push!(s, (j,nr))
        end
    end
    s
end

function get_maxes(M)
    s = Set()
    no_rows = size(M,1)
    no_cols = size(M,2)
    for r in 1:no_rows
        @show max_in_row(M[r,1:no_cols], r)
        s = union(s,max_in_row(M[r,1:no_cols], r))
    end
    s
end

function get_mins(M)
 s = Set()
    no_rows = size(M,1)
    no_cols = size(M,2)
    for c in 1:no_cols
        @show min_in_col(M[1:no_rows,c], c)
        s = union(s,min_in_col(M[1:no_rows,c], c))
    end
    s
end


function saddlepoints(M)
 if M!=[]
        sort(collect(intersect(get_maxes(M),get_mins(M))))
    else [] end
end
