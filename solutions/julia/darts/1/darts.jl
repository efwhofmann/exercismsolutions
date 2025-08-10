function score(x, y)
    rsq = x*x + y*y
    rsq <= 1 ? 10 : (rsq <= 25 ? 5 : (rsq <=100 ? 1 : 0))
end
