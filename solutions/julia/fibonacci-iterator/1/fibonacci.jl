struct Fiberator
    idx::Int
end

function Base.iterate(F::Fiberator, state=(1,1,1))
    cur1,cur2,idx = state
    next = cur1 + cur2
    if idx==1 
        return (1, (1, 1, 2))
    elseif idx==2
        return (1, (1, 1, 3))
    elseif idx <= F.idx
        return (next, (cur2, next, idx+1))
    end
    return nothing
end

Base.length(F::Fiberator) = F.idx

Base.eltype(::Fiberator)=Int
