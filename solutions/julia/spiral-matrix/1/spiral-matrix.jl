function spiral_matrix(n)
    # east, south, west, north
    directions = [(h=1, v=0), (h=0, v=1), (h=-1, v=0), (h=0, v=-1)]
    s_matrix = zeros(Int8, n, n)
    cur = 1
    dir = directions[cur]
    pos = [1,1]
    for k=1:n^2 
        s_matrix[pos[1], pos[2]] = k
        if ( !(0< pos[1] + dir.v < n+1) || !(0< pos[2] + dir.h < n+1) 
                    ||  s_matrix[pos[1] + dir.v, pos[2] + dir.h] !=0 )
            cur = cur % 4 + 1
            dir = directions[cur]
        end
        pos[1] += dir.v; pos[2] += dir.h
       # @show pos
    end
    s_matrix
end
