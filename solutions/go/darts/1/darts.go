package darts

import "math"

func Score(x, y float64) int {
	r:=math.Sqrt(x*x + y*y)
    var score int
    switch {
        case r <= 1: score = 10
        case r <= 5: score = 5
        case r <= 10: score = 1
        default: 
        	score = 0
    }
    return score
}
