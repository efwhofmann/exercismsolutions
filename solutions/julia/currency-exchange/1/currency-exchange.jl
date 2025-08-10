function exchange_money(budget, exchange_rate)
    budget/exchange_rate
end

function get_change(budget, exchanging_value)
    budget-exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    denomination*number_of_bills
end

function get_number_of_bills(amount, denomination)
    floor(Int,amount/denomination)
end

function get_leftover_of_bills(amount, denomination)
    amount-(denomination*get_number_of_bills(amount, denomination))
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    spread_factor = 1.0 + spread/100.0
    exchanged_value = exchange_money(budget, exchange_rate * spread_factor)
    get_number_of_bills(exchanged_value, denomination)*denomination
end
