import Base: isvalid, tryparse, iterate, show

struct ISBN <: AbstractString
   d::Vector{Int}
    
    function ISBN(s::AbstractString)
        if !isbn_valid(s)
            throw(DomainError(s))
        else
          tmp = split(replace(s,"-"=>""),"")
          tmp = length(tmp) == 10 ? tmp[1:9] : tmp[4:12]
          d =  map(s-> parse(Int32,s), tmp)          
        end
    end

end


function checksum_isbn13(numbers) 
    sum(map(x->(x[1]%2 == 1 ? 3*x[2] : x[2]), enumerate(numbers))) % 10
end

function checksum_isbn10(numbers)
   sum(map(x->(x[1]*x[2]),enumerate(numbers))) % 11  
end

function isbn_valid(str)
    (occursin(r"[^0-9X\-]",str) || str=="") && return false
    str = replace(str,"-"=>"")
    occursin(r"[X+]",str[1:length(str)-1]) && return false
    check= str[length(str)] 
    numbers = map(x->parse(Int32,x), split(str[1:length(str)-1],""))
    if length(str) == 10
         check_num = check=='X' ? 10 : parse(Int32,check)
         (check_num - checksum_isbn10(numbers)) % 11 == 0 
    elseif length(str) == 13 && check!='X'
         (parse(Int32,check) -  checksum_isbn13(numbers)) % 10 == 0   
    else
         false
    end
end

macro isbn_str(s) ISBN(s) end

function tryparse(::Type{ISBN}, s::AbstractString)::Union{ISBN, Nothing}
    if isbn_valid(s) 
        ISBN(s)
    else
        nothing
    end
end

Base.:(==)(a::ISBN,b::ISBN)= a.d == b.d
Base.:(!=)(a::ISBN,b::ISBN) = !(a==b)
 
isvalid(::Type{ISBN}, s::AbstractString) = isbn_valid(s)
iterate(n::ISBN) = iterate(n.d)
iterate(n::ISBN, i::Int=0) = iterate(n.d,i)
show(io::IO, n::ISBN) = show(io,n.d)
