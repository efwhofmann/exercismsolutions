#include "two_bucket.h"


unsigned int gcdx(unsigned int a, unsigned int b, int *u, int *v){
    if (b==0) {
        *u = 1;
        *v = 0;
        return a;
    }
    int u1, v1;
    unsigned int d = gcdx(b, a%b, &u1, &v1);
    *u = v1;
    *v = u1 - v1*(a/b);
    return d;
}

bucket_result_t measure_one(bucket_liters_t buck_1,
                        bucket_liters_t buck_2,
                        bucket_liters_t goal)
{
    if (goal==buck_1)
        return (bucket_result_t){true,1,0,0};
    else if (goal==buck_2)
        return (bucket_result_t){true,2,1,buck_1};
    int u,v;
    int d = gcdx(buck_1,buck_2,&u, &v);
    if(goal % d !=0)
        return (bucket_result_t){false, 0, 0, goal};
    u *= goal/d;
    v *= goal/d;
    if (u<0) {
        int t = -u*d/buck_2 + 1;
        u += (buck_2/d)*t;
        v -= (buck_1/d)*t;
    }
    if (buck_1>=goal)
        return (bucket_result_t){true, 2*(u-v) -2, 0, buck_2};
    else
        return (bucket_result_t){true, 2*(u-v), 1, 0};
}

bucket_result_t measure(bucket_liters_t bucket_1_size,
                        bucket_liters_t bucket_2_size,
                        bucket_liters_t goal_volume, bucket_id_t start_bucket)
{
    if(!goal_volume)
        return (bucket_result_t){true, 0,0,0};
    else if (goal_volume>bucket_1_size &&
             goal_volume>bucket_2_size)
         return (bucket_result_t){false, 0, 0, goal_volume};
    if(start_bucket == BUCKET_ID_1)
        return measure_one(bucket_1_size, bucket_2_size, goal_volume);
    else {
        bucket_result_t res = measure_one(bucket_2_size, bucket_1_size, goal_volume);
        res.goal_bucket = (res.goal_bucket == BUCKET_ID_1) ? BUCKET_ID_2 : BUCKET_ID_1;
        return res;
    }
}