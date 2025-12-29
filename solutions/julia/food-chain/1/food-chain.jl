line_one = "I know an old lady who swallowed a "
spider = " that wriggled and jiggled and tickled inside her."
line_end = "I don't know why she swallowed the fly. Perhaps she'll die."

animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
phrases =  ["",
        "It wriggled and jiggled and tickled inside her.", 
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"]

function recite(number)
    first_line = line_one * animals[number] * "."    
    res = [first_line]
    if number==1
        push!(res, line_end)
    else
        push!(res, phrases[number])
    end
    if 1<number && number<8
        for n in number:-1:2
            line = "She swallowed the " * animals[n] * " to catch the " * animals[n-1]
            if n-1==2
                line *= spider
            else
                line *="."  
            end
            push!(res, line)
            if n==2
                push!(res, line_end)
            end
        end
    end
    res   
end

function recite(start_verse, end_verse)
    result = []
    for k in start_verse:end_verse
        result = [result ; recite(k)]
        if k<end_verse
            push!(result, "")
        end
    end
    result
end
