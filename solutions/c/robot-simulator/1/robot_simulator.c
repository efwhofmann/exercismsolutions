#include "robot_simulator.h"
#include <string.h>

robot_status_t robot_create(robot_direction_t direction, int x, int y){
    robot_position_t position = {x,y};
    robot_status_t status = {direction, position};
    return status;
}

void robot_rotate_right(robot_status_t *robot){
    switch(robot->direction){
        case DIRECTION_NORTH: robot->direction = DIRECTION_EAST;
                                break;
        case DIRECTION_EAST: robot->direction = DIRECTION_SOUTH;
                                break;
        case DIRECTION_SOUTH: robot->direction = DIRECTION_WEST;
                                break;
        case DIRECTION_WEST: robot->direction = DIRECTION_NORTH;
                                break;
        default: robot->direction = DIRECTION_EAST; 
                                break;       
    }
}

void robot_rotate_left(robot_status_t *robot){
    switch(robot->direction){
        case DIRECTION_NORTH: robot->direction = DIRECTION_WEST;
                                break;
        case DIRECTION_WEST: robot->direction = DIRECTION_SOUTH;
                                break;
        case DIRECTION_SOUTH: robot->direction = DIRECTION_EAST;
                                break;
        case DIRECTION_EAST: robot->direction = DIRECTION_NORTH;
                                break;
        default: robot->direction = DIRECTION_WEST; 
                                break;   
    
    }
}

void robot_advance(robot_status_t *robot){
    switch(robot->direction){
        case DIRECTION_NORTH: robot->position.y++;
                                break;
        case DIRECTION_EAST: robot->position.x++;
                                break;
        case DIRECTION_SOUTH: robot->position.y--;
                                break;
        case DIRECTION_WEST: robot->position.x--;
                                break;
        default: robot->position.y++; 
                                break;   
    }
}

void robot_move(robot_status_t *robot, const char *commands){
    for(size_t idx=0; idx<strlen(commands); idx++){
        switch(commands[idx]){
            case 'A':  robot_advance(robot);
                        break;
            case 'R': robot_rotate_right(robot);
                        break;
            case 'L': robot_rotate_left(robot);
                        break;
            default: 
                break;     
        }
    }
    
}
 