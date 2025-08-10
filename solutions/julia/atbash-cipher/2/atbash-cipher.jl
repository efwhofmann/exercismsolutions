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

function encode(input)
     raw = atbash(lowercase(input))
     join(map(join,Iterators.partition(raw,5)), " ") 
end

function decode(input)
    atbash(lowercase(input))
end

