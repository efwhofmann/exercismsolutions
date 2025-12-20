// Implements the twofer Exercise in Go

package twofer

// Returns One for {name}, one for me. If name is empty, you is used instead. 
func ShareWith(name string) string {
    var msg string 
	if name=="" {
        msg =  "One for you, one for me."
    } else {
        msg = "One for " + name + ", one for me."
    }
    return msg
}
