#include "robot_simulator.h"
#include <string>
#include <tuple>

namespace robot_simulator {

      
    Robot::Robot(position_t initial_position, Bearing initial_bearing) : my_position(initial_position), my_bearing(initial_bearing) {} 

        
    void Robot::execute_sequence(const std::string& sequence){
        for (auto it = sequence.begin(); it != sequence.end(); it++) {
            switch(*it) {
                case 'A':
                    advance(); 
                    break;
                case 'R':
                    turn_right();
                    break;
                case 'L':
                    turn_left();
                    break;
                default:
                    break;
            }    
        }
    }

    void Robot::turn_left(){
        switch(my_bearing) {
            case Bearing::NORTH:
                my_bearing = Bearing::WEST;
                break;
            case Bearing::WEST:
                my_bearing = Bearing::SOUTH;
                break;
            case Bearing::SOUTH:
                my_bearing = Bearing::EAST;
                break;
            default:
                my_bearing = Bearing::NORTH;
        }
    }

    void Robot::turn_right(){
        switch(my_bearing) {
            case Bearing::NORTH:
                my_bearing = Bearing::EAST;
                break;
            case Bearing::EAST:
                my_bearing = Bearing::SOUTH;
                break;
            case Bearing::SOUTH:
                my_bearing = Bearing::WEST;
                break;
            default:
                my_bearing = Bearing::NORTH;
        }
    }

    void Robot::advance(){
        switch(my_bearing) {
            case Bearing::NORTH:
                my_position.second += 1;
                break;
            case Bearing::EAST:
                my_position.first +=1;
                break;
            case Bearing::SOUTH:
                my_position.second -=1;
                break;
            default:
                my_position.first -=1;
        }
    }


}  // namespace robot_simulator
