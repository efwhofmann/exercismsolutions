function acronym(phrase)
    words = replace(phrase, r"[-_]"=>" ") |>         
            eachsplit |>
            collect
    join([uppercase(w[1]) for w in words])
end
