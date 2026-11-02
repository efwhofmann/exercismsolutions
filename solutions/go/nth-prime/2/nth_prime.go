package nthprime

import "errors"

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
    if n<=0 {
        return 0,errors.New("input must be greater than 0")
    }
    if n == 1 {
        return 2,nil
    }
	primes := []int{2,3}
    candidate := 3
    var is_prime = true
    for len(primes)<n {
        candidate += 2
        is_prime = true
        for _,prime := range(primes) {
            if candidate % prime == 0 {
                is_prime = false
            }
        }
        if is_prime {
       	 	primes = append(primes, candidate)
        }
    } 
    return primes[len(primes)-1],nil
}
