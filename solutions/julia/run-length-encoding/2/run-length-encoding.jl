function encode(s)
    replace(s, r"(.)\1+" => x -> string(length(x))*x[1])
end



function decode(s)
    replace(s, r"\d+." => x -> x[end]^parse(Int, x[begin:end-1]))
end
