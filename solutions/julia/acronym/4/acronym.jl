function acronym(phrase)
    f = w->uppercase(w[1])
    replace(phrase, r"[-_]"=>" ") |>
        eachsplit |>
        collect |> 
        (l->map(f,l))|>
        join
end