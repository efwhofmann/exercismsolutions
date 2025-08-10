function is_valid(dna)
    match(r"[^ACGT]",dna) == nothing
end

function translate(nuclt)
    nuclt == 'A' && return 'U'
    nuclt == 'T' && return 'A'
    nuclt == 'C' && return 'G'
    nuclt == 'G' && return 'C'
 end

function to_rna(dna)
    rna=""
    if is_valid(dna) 
        for  nuclt in dna
            rna = string(rna, translate(nuclt))
        end
    else
       throw(error("Invalid DNA input.")) 
    end
    rna
end

