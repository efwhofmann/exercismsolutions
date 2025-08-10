#pragma once

#include <vector>
#include <string>

namespace lasagna_master {

struct amount {
    int noodles;
    double sauce;
};

int preparationTime(std::vector<std::string> layers, int prep_time=2);
    
amount quantities(std::vector<std::string> layers);
    
void addSecretIngredient(std::vector<std::string> &mine, const std::vector<std::string> friends);

void addSecretIngredient(std::vector<std::string> &mine, const std::string secret);

std::vector<double> scaleRecipe(std::vector<double>, double);

}  // namespace lasagna_master
