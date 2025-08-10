scrabble_dict = 
    Dict(1=>['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ],
         2=>['D', 'G'],
         3=>['B', 'C', 'M', 'P' ],
         4=> ['F', 'H', 'V', 'W', 'Y'],  
         5=> ['K'], 
         8=> ['J','X'],
         10=> ['Q','Z'])

score(lt::AbstractChar) =
begin
    for score in keys(scrabble_dict) 
        if lt in scrabble_dict[score]
            return score
        end
    end
    return 0    
end

function score(str::String)
    str=="" && return 0
    reduce(+, map(score, collect(uppercase(str))))
 end
