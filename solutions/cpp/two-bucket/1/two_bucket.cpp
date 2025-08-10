#include "two_bucket.h"

#include <stdexcept>

namespace two_bucket
{

    unsigned int gcdx(unsigned int a, unsigned int b, int &u, int &v){
    if (b==0) {
        u = 1;
        v = 0;
        return a;
    }
    int u1, v1;
    unsigned int d = gcdx(b, a%b, u1, v1);
    u = v1;
    v = u1 - v1*(a/b);
    return d;
}


    measure_result measure_one(int bucket1_capacity,
                        int bucket2_capacity,
                        int target_volume){
        if (target_volume==bucket1_capacity)
            return measure_result{1,bucket_id::one,0};
        else if (target_volume==bucket2_capacity)
            return measure_result{2,bucket_id::two,bucket1_capacity};
        int u,v;
        int d = gcdx(bucket1_capacity, bucket2_capacity, u, v);
        if(target_volume % d !=0)
            throw std::invalid_argument("No possible.");
        u *= target_volume/d;
        v *= target_volume/d;
        if (u<0) {
            int t = -u*d/bucket2_capacity + 1;
            u += (bucket2_capacity/d)*t;
            v -= (bucket1_capacity/d)*t;
        }
        if (bucket1_capacity>=target_volume)
            return measure_result{2*(u-v) -2, bucket_id::one, bucket2_capacity};
        else
            return measure_result{2*(u-v), bucket_id::two, 0};
    }


    measure_result measure(int bucket1_capacity,
                        int bucket2_capacity,
                        int target_volume, bucket_id start_bucket){
        if(!target_volume)
             return measure_result{0,bucket_id::one,0};
        else if (target_volume>bucket1_capacity &&
             target_volume>bucket2_capacity)
             throw std::invalid_argument("Not possible.");
        if(start_bucket == bucket_id::one)
            return measure_one(bucket1_capacity, bucket2_capacity, target_volume);
        else {
            measure_result res =
                measure_one(bucket2_capacity, bucket1_capacity, target_volume);
            res.goal_bucket = 
                (res.goal_bucket == bucket_id::one) ? bucket_id::two : bucket_id::one;
            return res;
        }
    }
    
    
}  // namespace two_bucket
