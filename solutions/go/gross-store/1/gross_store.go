package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{"quarter_of_a_dozen" :	3,
	"half_of_a_dozen" :	6,
	"dozen" :	12,
	"small_gross" :	120,
	"gross"	: 144,
	"great_gross" :	1728}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	val, exists := units[unit]
    if exists {
        bill[item] += val
    }
    return exists        
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	u, unit_exists:= units[unit]
    v, item_exists:= bill[item]
    both_exist := unit_exists && item_exists
    if(both_exist){
        new_val := v-u
        if new_val>0 {
            bill[item] = new_val
        } else if new_val==0 {
            delete(bill,item)
        } else {
            return false}
    } 
    return both_exist
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
    v,e := bill[item]
	return v,e
}
