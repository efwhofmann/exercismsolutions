package reverse
import "strings"

func Reverse(input string) string {
    var sb strings.Builder
    runes := []rune(input)
    for i:= len(runes)-1; 0<=i; i-- {
        sb.WriteRune(runes[i])
    }
    return sb.String()
}
