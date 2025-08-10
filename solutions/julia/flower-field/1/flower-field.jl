function annotate(field)
   if length(field)==0 
        return []
    end
    out = []
    sums = zeros(Int, length(field[1]), length(field))
    for (y,row) in enumerate(field)
        out_r = ""
        for (x,square) in enumerate(row)
            if square=='*'
                out_r = out_r*'*'
            else
                for dx in -1:1
                    for dy in -1:1
                        if checkbounds(Bool,sums,x+dx,y+dy)
                            sums[x,y] += field[y+dy][x+dx] == '*' ? 1 : 0
                        end
                    end
                end
                out_r = out_r*(sums[x,y] == 0 ? ' ' : string(sums[x,y]))
            end
        end
        push!(out, out_r)
    end 
    out
end