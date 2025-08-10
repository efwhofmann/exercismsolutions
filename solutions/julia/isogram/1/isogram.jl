function isisogram(s)
   letters = join(split(lowercase(s), r"[^a-z]", keepempty=false))
    length(letters) == length(Set(letters))
end
