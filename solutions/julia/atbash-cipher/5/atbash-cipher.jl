function encode(lt::AbstractChar)
        if lt in 'a':'z' 
            c = Char(Int('z') - (Int(lt) - Int('a')))
         elseif lt in '0':'9'
            c = lt
        else
            c=""
        end
end  

function encode(input::String; group=true)
     raw = join(map(encode,collect(lowercase(input))))
     group ? join(map(join, Iterators.partition(raw,5)), " ") : raw
end

function decode(input)
    encode(input, group=false)
end

