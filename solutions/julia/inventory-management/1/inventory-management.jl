function create_inventory(items)
    res = Dict()
    for itm in items
        res=mergewith(+, res, Dict(itm=>1))
    end
    res
end

function add_items(inventory, items)
    mergewith(+, inventory, create_inventory(items))
end

function decrement_items(inventory, items)    
    for item in items
         if haskey(inventory, item)  && inventory[item]>0 
              inventory[item] -=1
         end
    end   
    inventory
end

function remove_item(inventory, item)
    delete!(inventory, item)
end

function list_inventory(inventory)
   sort([item for item in inventory if item.second>0] )
end
