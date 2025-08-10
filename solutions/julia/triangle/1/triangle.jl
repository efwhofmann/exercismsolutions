function is_valid_triangle(sides)
    any(sides.<=0) && return false 
    m = maximum(sides) 
    idx_c = findfirst(sides.==m)
    idx_a = (idx_c == 3) ? 1 : idx_c + 1
    idx_b = (idx_c == 1) ? 3 : (idx_c + 2) % 3
    m<= sides[idx_a] + sides[idx_b]
end

function is_equilateral(sides)
    is_valid_triangle(sides) && (sides[1] == sides[2] == sides[3])
end

function is_isosceles(sides)
   is_valid_triangle(sides) && (sides[1] == sides[2] || sides[1] == sides[3] || sides[2] == sides[3])
end

function is_scalene(sides)
   is_valid_triangle(sides) &&  sides[1] != sides[2] && sides[1] != sides[3] && sides[2] != sides[3]
end
