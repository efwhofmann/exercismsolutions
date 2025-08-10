#include "raindrops.h"
#include <string>

namespace raindrops {

    std::string maybe_pling(int nr){
       return  (!(nr%3)) ? "Pling" : "";     
    }

    std::string maybe_plang(int nr){
      return  (!(nr%5)) ? "Plang" : "";    
    }

    std::string maybe_plong(int nr){
       return (!(nr%7)) ? "Plong" : "";   
    }

    std::string convert(int nr){
            if (!(nr%3) || !(nr%5) || !(nr% 7))
                return maybe_pling(nr)+maybe_plang(nr)+maybe_plong(nr);
            else
                return std::to_string(nr);
        }
}  // namespace raindrops
