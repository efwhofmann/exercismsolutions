function keep(values, predicate)
    [v for v in values if predicate(v)]
end

function discard(values, predicate)
    [v for v in values if !predicate(v)]
end
