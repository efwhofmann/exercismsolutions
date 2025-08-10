#if !defined(LARGEST_SERIES_PRODUCT_H)
#define LARGEST_SERIES_PRODUCT_H
#include <string>
#include <vector>

namespace largest_series_product {
    int largest_product(const std::string& digits, size_t window_size);
    bool contains_non_digits(const std::string& str);
    std::vector<std::string> generate_sliding_windows(const std::string& digits, size_t window_size);
}

#endif // LARGEST_SERIES_PRODUCT_H
