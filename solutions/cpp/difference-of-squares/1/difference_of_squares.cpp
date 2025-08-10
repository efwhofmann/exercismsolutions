#include "difference_of_squares.h"

namespace difference_of_squares {
    int square_of_sum(int n){
        return (n*n*(n+1)*(n+1)/4);
    }

    int sum_of_squares(int n){
        return (2*n+1)*(n+1)*n/6;
        
    }

    int difference(int n) {
       return square_of_sum(n) - sum_of_squares(n);
    }

}  // namespace difference_of_squares
