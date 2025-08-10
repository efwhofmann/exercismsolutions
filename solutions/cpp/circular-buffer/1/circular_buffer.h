#if !defined(CIRCULAR_BUFFER_H)
#define CIRCULAR_BUFFER_H

#include <vector>
#include <stdexcept>

using namespace std;

namespace circular_buffer {

    template <typename T>
    class circular_buffer{

    private:

        size_t capacity;
        vector<T> buff;
        size_t count;
        size_t newest;
        size_t oldest;

    public:
        circular_buffer(size_t cap){
            capacity = cap;
            buff = vector<T>(capacity);
            count = 0;
            oldest = 0;
            newest = 0;
        }

        void clear(){
            buff.clear();
            count = 0;
            oldest = 0;
            newest = 0;
        }
    
        T read();
        void write(T);
        void overwrite(T);
    
    };

    
    template <typename T>
     T circular_buffer<T>::read(){
         if(count!=0) {
             T ret = buff.at(oldest);
             oldest = (oldest+1) % capacity;
             count--;
             return ret;
         } else {
             throw domain_error("Can't read from empty buffer.");
         }
     }

    template <typename T>
     void circular_buffer<T>::write(T val){
        if(count>=capacity) {
           throw domain_error("Can't write to full buffer.");           
        } else if (buff.size()<capacity){
            buff.push_back(val); } 
         else {  
           buff.at(newest) = val; }
           count++;
           newest = (newest  + 1) % capacity;
        }         
     

    template <typename T>
    void circular_buffer<T>::overwrite(T val){
         if(count < capacity) {
             write(val);
         } else {
             buff.at(oldest) = val;
             oldest = (oldest + 1) % capacity;
         }
     }

}  // namespace circular_buffer

#endif // CIRCULAR_BUFFER_H