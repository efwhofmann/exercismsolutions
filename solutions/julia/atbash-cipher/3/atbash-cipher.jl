function atbash(lt)
        c = ""
        if lt in 'a':'z' 
            c = Char(Int('z') - (Int(lt) - Int('a')))
         elseif lt in '0':'9'
            c = lt
        else
            nothing
        end
       c
end  

function encode(input)
     raw = join(map(atbash,collect(lowercase(input))))
     join(map(join, Iterators.partition(raw,5)), " ") 
end

function decode(input)
    join(map(atbash,collect(lowercase(input))))
end

