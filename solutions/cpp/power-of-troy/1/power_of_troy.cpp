#include "power_of_troy.h"

namespace troy {

void give_new_artifact(human &person, std::string artifact_name){
    person.possession = std::make_unique<artifact>(artifact_name);
}

void exchange_artifacts(std::unique_ptr<artifact> &p1, std::unique_ptr<artifact> &p2){
   std::swap(p1, p2);
}

void manifest_power(human &person, std::string effect_name){
    person.own_power = std::make_shared<power>(effect_name);
}

void use_power(human &influencer, human &influenced){
    influenced.influenced_by = influencer.own_power;
}

int power_intensity(human& person){
    return nullptr==person.own_power ? 0 : person.own_power.use_count();
}

}  // namespace troy
