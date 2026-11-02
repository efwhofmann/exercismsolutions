package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if(len(a)!=len(b)){
        return 0, errors.New("invalid input")
    }
	dist := 0
    for i := range a {
        if(b[i]!=a[i]){
            dist++}
    }
    return dist,nil     
}
