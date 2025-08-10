"""Calculate the number of grains on square `square`."""
function on_square(square)
     if square<1 || square> 64
        throw(DomainError(square))
    else
        BigInt(2)^(square -1)
    end
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    if square<1 || square>64
        throw(DomainError(square))
    else
        BigInt(2)^square -1
    end
end
