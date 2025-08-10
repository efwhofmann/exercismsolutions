function transform(ch)
    if ch=='-' 
        res = "_"
    elseif ch>='α' && ch<='ω' || ch>='ϐ' && ch<='ϛ'
        res = "?"
    elseif isspace(ch)
        res = ""
    elseif isletter(ch) && (ch == uppercase(ch))
        res = "-"*lowercase(ch)
    elseif isdigit(ch)
        res = ""
    else
        res = ""*ch
    end
end

function clean(str)
    res = ""
    for ch in str
        res = res*transform(ch)
    end
    res
end
