function cleanupname(name)
    replace(name, r"[^a-zA-Z]" => " ") .|> strip
end

function firstletter(name)
    name .|> cleanupname .|> first .|> string
end

function initial(name)
    titlecase(firstletter(name)) * "."
    
end

function couple(name1, name2)
    "❤ "*initial(name1)*"  +  "*initial(name2)*" ❤"
end
