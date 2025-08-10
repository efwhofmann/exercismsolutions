function detect_anagrams(subject, candidates)
    sub = lowercase(subject)
    letters = Dict(lt=>count(==(lt), sub) for lt in sub)
    anagrams = String[];
    for candidate in candidates
        cand = lowercase(candidate)
        if(length(cand)==length(sub) && cand!=sub)
            if Dict(c=>count(==(c), cand) for c in cand) == letters
                push!(anagrams, candidate)
            end
        end
    end
    anagrams
end
