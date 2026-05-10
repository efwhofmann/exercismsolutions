#include "largest_series_product.h"

#include <string>
#include <stdexcept>
#include <numeric>
#include <algorithm>

using namespace std;

namespace largest_series_product {

    bool contains_non_digits(const string& str) {
        return !all_of(str.begin(), str.end(), [](char c){return isdigit(c);});
    }

    int largest_product(const string& digits, const size_t window_size) {
        int max_product = 0;

        if (window_size > digits.length()) {
            throw domain_error("window size is too large");
        }

        if (contains_non_digits(digits)) {
            throw domain_error("input data contains non-digits");
        }
        for (auto it = digits.begin(); it != digits.end() - window_size + 1; ++it) {
            int product = accumulate(it, it+window_size, 1, [](const int acc, const char c) { return acc * (c - '0'); });
            max_product = product > max_product ? product : max_product;
        }

        return max_product;
    }



} // largest_series_product