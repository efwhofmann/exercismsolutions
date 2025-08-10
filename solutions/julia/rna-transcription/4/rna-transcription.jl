function to_rna(dna)
      nucleotid_d = Dict('A'=>'U', 'T'=>'A', 'C'=>'G', 'G'=>'C') 
     if isempty(dna)
        return dna
     end
     try 
         map(x -> nucleotid_d[x], dna)
     catch e
        if isa(e,KeyError) 
            throw(ErrorException("invalid input."))
        end
     end   
end

