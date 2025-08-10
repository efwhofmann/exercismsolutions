"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    lt_set = Set(replace(lowercase(input), r"[^a-z]"=>""));
    length(lt_set) == 26
end

