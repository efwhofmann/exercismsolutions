nucleotide_dict = Dict('A'=>'U', 'T'=>'A', 'C'=>'G', 'G'=>'C') 

function is_valid(dna)
    match(r"[^ACGT]",dna) == nothing
end


function to_rna(dna)
    rna=""
    if is_valid(dna) 
        rna = join(map(x->nucleotide_dict[x], dna))
    else
       throw(error("Invalid DNA input.")) 
    end
    rna
end

