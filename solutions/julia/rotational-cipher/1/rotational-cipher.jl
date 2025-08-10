function rotate(n,s) 
    if n ∈ 0:26 
         c = ""
        for lt in s
          if lt in 'A':'Z'
              tl = ((x = (Int(lt) + n)) > Int('Z') ? (x - Int('Z') + Int('A')-1)  : x)
          elseif lt in 'a':'z'
              tl = ((x = (Int(lt) + n)) > Int('z') ? (x - Int('z') + Int('a')-1)  : x)
          else 
                tl = lt
           end
          c = string(c, Char(tl) )    
        end
        (length(s)==1 && typeof(s) == Char) ? c[1] : c
    else
        throw(error("Invalid key!"))
    end
end

for i in 0:26
    eval(Meta.parse("macro R$(i)_str(s) rotate($(i),s) end")) 
end