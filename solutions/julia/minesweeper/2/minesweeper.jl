function annotate(a)
    if length(a) == 0 || a==[""]
        return a
    end
    directions = [(1,0),(1,-1),(0,-1),(-1,-1),(-1,0),(-1,1),(0,1), (1,1)]
    field = permutedims(reduce(hcat,collect.(a)))
    sizex = size(field)[1]
    sizey = size(field)[2]
    Coords = CartesianIndices(field)
    for s in Coords
        if field[s] == ' '
            count = -1
            for delta in directions
                update = s + CartesianIndex(delta)
                if checkbounds(Bool, field, update) &&  field[update] == '*'
                    count = count+1
                end
            end
            if count>=0 
                field[s] = '1' + count
            end
        end           
    end
    reduce(*,reshape(field, (sizex, sizey)),dims=2)[:]
end