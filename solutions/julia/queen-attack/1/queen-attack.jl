import Base: ==

struct InvalidPosition <: Exception
    
end

struct Queen
    x::Int8
    y::Int8    
    Queen(r,c) = r<0 || r>=8 || c<0 || c>=8 ?
        throw(InvalidPosition()) : new(r,c)
end

==(w::Queen, b::Queen) = (w.x == b.x && w.y == b.y)

function canattack(white::Queen, black::Queen)
    Δx = abs(white.x - black.x)
    Δy = abs(white.y - black.y)
    Δx == 0 ||  Δy == 0 ||  Δx  ==  Δy 
end    
