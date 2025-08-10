color_dict = 
    Dict("black"=>0, "brown"=>1, "red"=>2, "orange"=>3,
        "yellow"=>4, "green"=>5, "blue"=>6, "violet"=>7,
        "grey"=>8, "white"=>9)

function colorcode(colors)
    n1= color_dict[colors[1]]
    n2 = color_dict[colors[2]]
    ohms = 10*n1 + n2
end
