nucleotide_dict = Dict('A'=>'U', 'T'=>'A', 'C'=>'G', 'G'=>'C') 

function is_valid(dna)
    match(r"[^ACGT]",dna) == nothing
end


function to_rna(dna)
    rna=""
    if is_valid(dna) 
        for  nuc in dna
            rna = string(rna, nucleotide_dict[nuc])
        end
    else
       throw(error("Invalid DNA input.")) 
    end
    rna
end

