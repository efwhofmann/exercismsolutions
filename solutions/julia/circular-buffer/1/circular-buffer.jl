mutable struct CircularBuffer{T}
    buffer::Array{T,1}
    capacity::Integer
    
    function CircularBuffer{T}(capacity::Integer) where {T}
        new(Array{T,1}(), capacity)
    end
end

isfull(cb::CircularBuffer) = length(cb.buffer) == cb.capacity


function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if isfull(cb)  
        if !overwrite
            throw(BoundsError())
        else
            popfirst!(cb.buffer)
        end
    end
    push!(cb.buffer, item)
    cb
end

function Base.popfirst!(cb::CircularBuffer)
    if !isempty(cb.buffer)
        popfirst!(cb.buffer)
    else
        throw(BoundsError())
    end
end

function Base.empty!(cb::CircularBuffer)
    empty!(cb.buffer)
    cb
end
