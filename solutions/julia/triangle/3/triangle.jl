function is_valid_triangle(sides)
    any(sides.<=0) && return false
    ssides = sort(sides) 
    sum(ssides[1:2]) >= ssides[3]
end

is_equilateral(sides) =
    is_valid_triangle(sides) && (sides[1] == sides[2] == sides[3])

is_isosceles(sides) =
   is_valid_triangle(sides) && (sides[1] == sides[2] || sides[1] == sides[3] || sides[2] == sides[3])

is_scalene(sides) = 
   is_valid_triangle(sides) && (sides[1] != sides[2] && sides[1] != sides[3] && sides[2] != sides[3])

