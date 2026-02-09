function acronym(phrase)
    out = ""
    for i in 1:length(phrase)        
        if 1==i || phrase[i-1] in [' ', '-', '_']
            c = phrase[i]
            if isletter(c) 
                out *= uppercase(c)
            end
        end
    end
    out
end
