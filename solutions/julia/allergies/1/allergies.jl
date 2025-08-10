allergies_dict = Dict([(0,"eggs"), (1,"peanuts"), (2, "shellfish"), (3, "strawberries"),
                        (4, "tomatoes"), (5, "chocolate"), (6, "pollen"), (7, "cats")])

function allergic_to(score, allergen)
     allergen in allergy_list(score)
end

function allergy_list(score)
    list = Set()
    for k in 0:7
       if score >> k & 1 == 1 
            push!(list, allergies_dict[k])
       end
    end
    list
end
