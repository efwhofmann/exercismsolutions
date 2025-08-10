function encode(lt::AbstractChar)
        if lt in 'a':'z' 
            c = Char(Int('z') - (Int(lt) - Int('a')))
         elseif lt in '0':'9'
            c = lt
        else
            c=""
        end
end  

function encode(input::String)
     raw = join(map(encode,collect(lowercase(input))))
     join(map(join, Iterators.partition(raw,5)), " ") 
end

function decode(input)
    join(map(encode,collect(lowercase(input))))
end

