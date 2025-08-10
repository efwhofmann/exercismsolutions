#include "parallel_letter_frequency.h"

#include <map>
#include <vector>
#include <string>
#include <future>


namespace parallel_letter_frequency {
        std::map<char, int> frequency(const std::vector<std::string_view> &input_strings) {
            std::map<char,int> result;
            std::vector<std::future<std::map<char,int>>> futures;
            futures.reserve(input_strings.size());
            for(const auto &single_string: input_strings){
             futures.push_back(std::async(std::launch::async, 
                 [&single_string] {
                    std::map<char,int> f_result;
                    for(const auto &c: single_string){
                        if(std::isalpha(c))
                            f_result[static_cast<char>(std::tolower(c))]++;
                    }    
                     return f_result;
                 })); 
            }            
            for(auto &future: futures){
                for(const auto &[key,value]:future.get()){
                    result[key] += value;
                }
            }
            return result;
        }
}
