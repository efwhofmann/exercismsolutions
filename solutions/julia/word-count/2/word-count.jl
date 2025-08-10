function wordcount(sentence)
    words =  split(lowercase(sentence), r"\s|[^a-z0-9']|'\B|\B'";
                        keepempty=false)
    return Dict(word => count(==(word), words) for word in words)
end
