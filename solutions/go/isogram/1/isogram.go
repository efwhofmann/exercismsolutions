package isogram
import (
    "strings"
	"unicode"
)

func IsIsogram(word string) bool {
	lc := strings.ToLower(word)
    var letters= "";
    for _,c := range(lc) {
        if strings.ContainsRune(letters,c) {
            return false
        } 
    	if unicode.IsLetter(c) {
            letters += string(c) 
        }
    }
    return true
}
