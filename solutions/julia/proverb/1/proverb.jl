function recite(pieces)
    length(pieces)==0 && return ""
    lines = ["For want of a "*pieces[i-1]*" the "*pieces[i]*" was lost." for i in 2:length(pieces)]
    push!(lines, "And all for the want of a "*pieces[1]*".")
    join(lines, '\n')
end
