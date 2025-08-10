#include "lasagna_master.h"
#include <vector>
#include <string>
#include <iostream>

using namespace std;

namespace lasagna_master {
    int preparationTime(vector<string> layers, int prep_time){
        return layers.size()*prep_time;
    }

    amount quantities(vector<string> layers){
        int s_layers = 0;
        int n_layers = 0;
        for(const string& l : layers ){
            if(l=="sauce")
                s_layers++;
            else if(l=="noodles")
                n_layers++;
        }
        return amount{ 50*n_layers, 0.2*s_layers};
    }

    void addSecretIngredient(vector<string> &mine, const vector<string> friends){
        mine.back() = friends.back();
    }

    void addSecretIngredient(vector<string> &mine, const string secret){
        mine.back() = secret;
    }

     vector<double> scaleRecipe(vector<double> amounts, double scale){
         vector<double> scaled;
         double scale_factor = scale/2.0;
         for(const double& x : amounts){
             scaled.push_back(scale_factor*x);
         }
         return scaled;
     }   

}  // namespace lasagna_master
