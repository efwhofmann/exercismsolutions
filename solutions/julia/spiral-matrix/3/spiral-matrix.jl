function spiral_matrix(n)
    # east, south, west, north
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    s_matrix = zeros(Int8, n, n)
    cur = 1
    dir = directions[cur]
    pos = CartesianIndex(1,1)
    for k=1:n^2 
        s_matrix[pos] = k
        update = pos + CartesianIndex(dir)        
        if ( !checkbounds(Bool, s_matrix, update)
                    ||  s_matrix[update] !=0 )
            cur = cur % 4 + 1
            dir = directions[cur]
        end
        pos = pos + CartesianIndex(dir)
    end
    s_matrix
end
