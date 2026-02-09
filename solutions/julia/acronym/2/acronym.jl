function acronym(phrase)
    str = replace(phrase, r"[-_]"=>" ")          
    words = collect(eachsplit(str))
    join([uppercase(w[1]) for w in words])
end
