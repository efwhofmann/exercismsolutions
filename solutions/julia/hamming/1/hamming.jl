"Calculates hamming distance of two DNA strands"
function distance(a, b)
    if length(a)!=length(b)
        throw(ArgumentError("Strands must be of the same length"))
    end
    delta = 0
    for i=1:length(a) 
        delta += a[i] != b[i] ? 1 : 0
    end
    delta
end
