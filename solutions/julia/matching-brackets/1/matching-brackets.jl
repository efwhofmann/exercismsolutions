
function is_left(ch)
    ch == '(' || ch == '{' || ch=='['
end

function is_right(ch)
    ch == ')' || ch == '}' || ch==']'
end 

function matches(l, r)
   l == '(' && r == ')' || l == '{' && r == '}' || l == '[' && r == ']'
end

function matching_brackets( input )
    lifo = Char[] 
    for ch in input
        if is_left(ch)
            push!(lifo, ch)
        elseif is_right(ch)
            if 0==length(lifo)
                return false
            elseif matches(pop!(lifo),ch)
                continue
            else
                return false
            end        
        end
    end
    return 0==length(lifo)
end