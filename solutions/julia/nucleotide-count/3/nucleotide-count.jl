"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    all([nucleotid in "ACGT" for nucleotid in strand]) || 
         throw(DomainError(strand, "Invalid DNA sequence"))
    merge(Dict('A'=>0, 'C'=>0, 'G'=>0, 'T'=>0),
        Dict(nucleotid => count( ==(nucleotid), strand) for nucleotid in strand))
end
