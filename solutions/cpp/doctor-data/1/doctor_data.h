#include<string>

namespace star_map{
    enum class System {
        Sol,
        AlphaCentauri,
        BetaHydri,
        EpsilonEridani,
        DeltaEridani,
        Omicron2Eridani
};
    
}

namespace heaven {
    class Vessel {
    public: 
        std::string name;
        int generation;
        star_map::System current_system;
        int busters;
    
        Vessel (std::string name="", int generation=1, star_map::System system=star_map::System::Sol);
        Vessel replicate(std::string new_name="");
        void make_buster();
        bool shoot_buster();
    };

    std::string get_older_bob(Vessel, Vessel);
    bool in_the_same_system(Vessel, Vessel);
}
