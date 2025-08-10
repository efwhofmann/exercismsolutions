function encode(lt::AbstractChar)
        if !(isspace(lt)||ispunct(lt))
            isletter(lt) ? Char(Int('z') - (Int(lt) - Int('a'))) : lt
        else 
            ""
        end
end  

function encode(input::String; group=true)
     raw = join(map(encode,collect(lowercase(input))))
     group ? join(map(join, Iterators.partition(raw,5)), " ") : raw
end

function decode(input)
    encode(input, group=false)
end

