#if !defined(ROBOT_SIMULATOR_H)
#define ROBOT_SIMULATOR_H

#include <string>
#include <tuple>


namespace robot_simulator {

    using position_t = std::pair<int,int>;

    enum class Bearing {
        NORTH,
        EAST,
        SOUTH,
        WEST
    };    

    class Robot {

        public:
           
            Robot(position_t initial_position = {0,0}, Bearing initial_bearing=Bearing::NORTH);

            position_t get_position() const {return position_t{my_x,my_y};};
            Bearing get_bearing() const {return my_bearing;};
            void execute_sequence(const std::string& sequence);
    
    
            void turn_left();
            void turn_right();
            void advance();
    
        private:
            int my_x;
            int my_y;
            Bearing my_bearing;
           
        
    
    };

}  // namespace robot_simulator

#endif // ROBOT_SIMULATOR_H