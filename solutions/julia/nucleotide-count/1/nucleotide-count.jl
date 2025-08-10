"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    if match(r"[^ACGT]",strand)!=nothing    
        throw(DomainError("Invalid strand", strand))
    end
    mergewith(+,
        Dict('A'=>0, 'C'=>0, 'G'=>0, 'T'=>0),
        Dict(nucleotid => count( ==(nucleotid), strand) for nucleotid in strand))

end
