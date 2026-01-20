get_vector_of_wagons(args...) =  collect(args)
add_missing_stops(route, stops...) =
    merge(route, Dict("stops" => [v for (k,v) in stops]))
 extend_route_information(route; more_route_information...) =
    merge(route, Dict(more_route_information))

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    due, tre, uno, rest... = each_wagons_id
    [[uno]; missing_wagons; rest; [due, tre]]
end

