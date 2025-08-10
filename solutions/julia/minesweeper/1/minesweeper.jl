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
        if field[s] == '*'
            for delta in directions
                update = s + CartesianIndex(delta)
                if checkbounds(Bool, field, update) &&  field[update] != '*'
                    if field[update] == ' '
                        field[update] = '1'
                    else
                        field[update] +=1
                    end
                end
            end
        end           
    end
    reduce(*,reshape(field, (sizex, sizey)),dims=2)[:]
end