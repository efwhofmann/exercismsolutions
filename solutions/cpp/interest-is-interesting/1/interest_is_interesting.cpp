#include <array>
// interest_rate returns the interest rate for the provided balance.
double interest_rate(double balance) {
    std::array<double, 4> rates = {3.213, 0.5, 1.621, 2.475 };
    double res= 0.0;
    if (balance < 0) 
        {res = rates[0];} 
    else if (balance < 1000) 
        {res = rates[1];} 
    else if (balance  <5000) 
        {res = rates[2];}
    else {res = rates[3];}
    return res;
}

// yearly_interest calculates the yearly interest for the provided balance.
double yearly_interest(double balance) {
     return balance * interest_rate(balance)/100.0; 
 }

// annual_balance_update calculates the annual balance update, taking into
// account the interest rate.
double annual_balance_update(double balance) {
    if (balance) {
      return balance + yearly_interest(balance);}
    else {return balance - yearly_interest(balance);}
    
}

// years_until_desired_balance calculates the minimum number of years required
// to reach the desired balance.
int years_until_desired_balance(double balance, double target_balance) {
    int yy=0;
    while (balance < target_balance){
        yy++;
        balance = annual_balance_update(balance);
    }
    return yy;
}