#if !defined(PERFECT_NUMBERS_H)
#define PERFECT_NUMBERS_H

namespace perfect_numbers {

enum classification {abundant, perfect, deficient};
    
classification classify(int);

}  // namespace perfect_numbers

#endif  // PERFECT_NUMBERS_H