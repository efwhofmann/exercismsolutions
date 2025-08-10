"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    lt_set = Set(join(split(lowercase(input), r"[^a-z]", keepempty=false)))
    length(lt_set) == 26
end

