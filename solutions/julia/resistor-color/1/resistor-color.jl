color_dict = 
    Dict("black"=>0, "brown"=>1, "red"=>2, "orange"=>3,
        "yellow"=>4, "green"=>5, "blue"=>6, "violet"=>7,
        "grey"=>8, "white"=>9)

function colorcode(color)
    color_dict[color]
end

function colors()
    sort(collect(keys(color_dict)); lt=(a,b) -> color_dict[a] < color_dict[b]) 
 end