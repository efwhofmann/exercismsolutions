function atbash(st)
    res =""
     for lt in st
        if lt in 'a':'z' 
            c = Char(Int('z') - (Int(lt) - Int('a')))
         elseif lt in '0':'9'
            c = lt
        else
            c=""
        end
        res = string(res,c)
    end
    res
end  

group5(s) = 
begin
    res=""
    i = 0
    for lt in s
        i+=1
        res=string(res,lt)
        if (mod(i, 5)==0) && i!=length(s) 
            res=string(res," ") 
        end
    end
    res
end

function encode(input)
     raw = atbash(lowercase(input))
     group5(raw)
end

function decode(input)
    atbash(lowercase(input))
end

