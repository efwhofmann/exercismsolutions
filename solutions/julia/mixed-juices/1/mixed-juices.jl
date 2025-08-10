function time_to_mix_juice(juice)
    if "Pure Strawberry Joy"==juice
        0.5
    elseif "Green Garden"==juice || "Energizer"==juice
        1.5
    elseif "Tropical Island"==juice
        3
    elseif "All or Nothing"==juice
        5
    else
       2.5 
    end
end

function wedges_from_lime(size)
    if "small"==size
        6
    elseif "medium"==size
        8
    else
        10
    end
end

function limes_to_cut(needed, limes)
    if []==limes
        0
    end
   count = 0
    while needed>0 && count<length(limes)
       count +=1
       needed -= wedges_from_lime(limes[count])
   end
   count
end

function order_times(orders)
    res = []
    for juice in orders
        push!(res, time_to_mix_juice(juice))
    end
    res
end

function remaining_orders(time_left, orders)
    if orders == [] 
        return 0
    end
    idx = 1;
    while time_left>0 && idx<=length(orders)        
        time_left -= time_to_mix_juice(orders[idx])
        idx += 1
    end
    orders[idx:length(orders)]
end
