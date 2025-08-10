#if !defined(PERFECT_NUMBERS_H)
#define PERFECT_NUMBERS_H

namespace perfect_numbers {

enum aliquot_type{abundant, perfect, deficient};
    
aliquot_type classify(int);

}  // namespace perfect_numbers

#endif  // PERFECT_NUMBERS_H