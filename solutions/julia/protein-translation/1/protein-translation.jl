
codon_dict = Dict("UGU" =>  "Cysteine",
        "UGC" =>  "Cysteine",
        "UUA" =>  "Leucine",
        "UUG" =>  "Leucine",
        "AUG" =>  "Methionine",
        "UUU" =>  "Phenylalanine",
        "UUC" =>  "Phenylalanine",
        "UCU" =>  "Serine",
        "UCC" =>  "Serine",
        "UCA" =>  "Serine",
        "UCG" =>  "Serine",
        "UGG" =>  "Tryptophan",
        "UAU" =>  "Tyrosine",
        "UAC" =>  "Tyrosine",
        "UAA" =>  "STOP",
        "UGA" =>  "STOP",
        "UAG" =>  "STOP")

 
function proteins(strand)    
    result = String[]
    if 0==length(strand)
        return result
    end
    codons = collect(Iterators.partition(strand, 3))
    for codon in codons
        if haskey(codon_dict, codon) 
            p = codon_dict[codon]
            if "STOP" == p
                break
            else
                push!(result,p)
            end
        else
            throw(DomainError(strand))
        end
    end
    result
end
