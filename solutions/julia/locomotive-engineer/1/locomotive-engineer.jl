function get_vector_of_wagons(args...)
    length(args)==1 ? [first(args)] : reduce(vcat, args)
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    due, tre, uno, rest... = each_wagons_id
    [[uno]; missing_wagons; rest; [due, tre]]
end

function add_missing_stops(route, stops...)
    merge(route, Dict("stops" => [pair[2] for pair in stops]))
end

function extend_route_information(route; more_route_information...)
    merge(route, Dict(more_route_information))
end
