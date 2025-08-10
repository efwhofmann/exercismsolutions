#include "largest_series_product.h"

#include <string>
#include <vector>
#include <stdexcept>
#include <numeric>
#include <algorithm>
#include <iostream>

namespace largest_series_product {

    bool contains_non_digits(const std::string& str) {
        return !std::all_of(str.begin(), str.end(), [](char c){return std::isdigit(c);});
    }

    std::vector<std::string> generate_sliding_windows(const std::string& digits, const size_t window_size) {
        std::vector<std::string> results;
        for (size_t i = 0; i <= digits.length() - window_size; i++) {
            std::string window = digits.substr(i, window_size); 
            results.push_back(window);
        }
        return results;
    }

    int largest_product(const std::string& digits, const size_t window_size) {
        int max_product = 0;

        if (window_size > digits.length()) {
            throw std::domain_error("window size is too large");
        }

        if (contains_non_digits(digits)) {
            throw std::domain_error("input data contains non-digits");
        }

        auto windows = generate_sliding_windows(digits, window_size);

        for (auto& substring : windows) {
            int product = std::accumulate(substring.begin(), substring.end(), 1, [](const int acc, const char c) { return acc * (c - '0'); });
            max_product = product > max_product ? product : max_product;
        }

        return max_product;
    }



} // largest_series_product