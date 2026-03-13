function clean_ingredients(dish_name, dish_ingredients)
    (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    type = isempty(Set(drink_ingredients) ∩ ALCOHOLS) ? "Mocktail" : "Cocktail"
    drink_name * " " * type
end

function categorize_dish(dish_name, dish_ingredients)
    if VEGAN  ⊇ dish_ingredients
        category = "VEGAN"
    elseif VEGETARIAN ⊇ dish_ingredients
        category = "VEGETARIAN"
    elseif PALEO ⊇ dish_ingredients 
        category = "PALEO"
    elseif KETO ⊇ dish_ingredients 
        category = "KETO"
    else 
        category = "OMNIVORE"
    end
    dish_name * ": " * category
end

function tag_special_ingredients(dish)
    (dish[1], Set(dish[2]) ∩ SPECIAL_INGREDIENTS)
end

function compile_ingredients(dishes)
    s = Set()
    for dish in dishes
        s = union(s,dish)
    end
    s
end

function separate_appetizers(dishes, appetizers)
    ds = Set(dishes)
    as = Set(appetizers)
    collect(setdiff(ds, as))
end

function singleton_ingredients(dishes, intersection)
    s=Set()
    for d in dishes
        s = union(s, setdiff(d,intersection))
    end
    s
end
