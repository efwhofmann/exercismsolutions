function wordcount(sentence)
 word_dict = Dict()
    words =  split(lowercase(sentence), r"\s|[^a-z0-9']|'\B|\B'";
                        keepempty=false)
    for wd in words
        word_dict = mergewith(+, word_dict, Dict(wd=>1))
    end
    word_dict
end
