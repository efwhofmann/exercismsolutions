const base_amount = 221

function success_rate(speed)
    if speed >=1 && speed<=4 
        1.0
    elseif 5<=speed && speed<=8
        0.9
    elseif 9==speed
        0.8
    elseif 10==speed
        0.77
    else
        0
    end
end

function production_rate_per_hour(speed)
    base_amount*speed*success_rate(speed)
end

function working_items_per_minute(speed)
    floor(Int, production_rate_per_hour(speed)/60)
end
