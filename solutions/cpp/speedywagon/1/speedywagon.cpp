#include "speedywagon.h"

namespace speedywagon {

// Enter your code below:

// Please don't change the interface of the uv_light_heuristic function
int uv_light_heuristic(std::vector<int>* data_array) {
    double avg{};
    for (auto element : *data_array) {
        avg += element;
    }
    avg /= data_array->size();
    int uv_index{};
    for (auto element : *data_array) {
        if (element > avg) ++uv_index;
    }
    return uv_index;
}

bool connection_check(pillar_men_sensor* sensor){
    return (nullptr != sensor) ? true : false;
}

int activity_counter(pillar_men_sensor* sensor_array, int capacity){
    int result=0;
    for(int i=0; i<capacity; i++){
        result += connection_check(&sensor_array[i]) ? sensor_array[i].activity : 0;
    }
    return result;
}

bool alarm_control(pillar_men_sensor* sensor){
    if(!sensor || sensor->activity==0)
        return false;
    else return true;
}

bool uv_alarm(pillar_men_sensor* sensor){
    if (!sensor)
        return false;
    else return uv_light_heuristic(&sensor->data)>(sensor->activity);
}


}  // namespace speedywagon
