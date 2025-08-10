color_dict = 
    Dict("black"=>0, "brown"=>1, "red"=>2, "orange"=>3,
        "yellow"=>4, "green"=>5, "blue"=>6, "violet"=>7,
        "grey"=>8, "white"=>9)


function label(colors)
    n1= color_dict[colors[1]]
    n2 = color_dict[colors[2]]
    n3 = color_dict[colors[3]]
    ohms = 10*n1 + n2
    if (n3<=1) || (n1 ==0 && n3==2) 
        ohms *= 10^n3
        color_label = string(ohms)*" ohms"
    elseif (n1 ≠ 0  && n2==0 && n3==2)    
        color_label = string(n1)*" kiloohms"
    elseif (n1 ≠ 0  && n2 ≠ 0 && n3==2) 
        ohms *=0.1
        color_label = string(round(ohms,digits=1))*" kiloohms"
    elseif (n3<=4) || (n1 ==0 && n3==5) 
        ohms *=10^(n3-3)
        color_label = string(ohms)*" kiloohms"
    elseif (n1 ≠ 0 && n2 == 0 && n3==5)    
        color_label = string(n1)*" megaohms"
    elseif (n1 ≠ 0  && n2 ≠ 0 && n3==5)
        color_label = string(round(0.1*ohms, digits=1))*" megaohms"
    elseif (n3<=7) || (n1==0 && n3==8) 
        ohms *=10^(n3-6)
        color_label = string(ohms)*" megaohms"
    elseif (n1 ≠ 0  && n2 ≠ 0 && n3==8)
        color_label = string(round(0.1*ohms, digits=1))*" gigaohms"
    else
        color_label = string(ohms)*" gigaohms"
    end
end