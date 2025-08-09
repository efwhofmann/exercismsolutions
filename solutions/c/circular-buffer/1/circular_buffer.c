#include "circular_buffer.h"

#include <stdlib.h>
#include <errno.h>




circular_buffer_t* new_circular_buffer(int capacity) {
   circular_buffer_t* result = (circular_buffer_t*) calloc(1, sizeof(circular_buffer_t) + (sizeof(buffer_value_t)*capacity));     
   if (NULL == result) return NULL;
    result->capacity = capacity;
    result->no_elements = 0;
    result->start = 0;
    result->end = 0;
    return result;
}

int write(circular_buffer_t *buffer, buffer_value_t value) {
    if (buffer->no_elements == buffer->capacity){
            errno = ENOBUFS;
            return 1;
    }
    buffer->data[buffer->end] = value;
    buffer->end = (buffer->end + 1) % buffer->capacity;
    buffer->no_elements++;   
    return 0;
}

int overwrite(circular_buffer_t *buffer, buffer_value_t value) {
    if (buffer->no_elements < buffer->capacity)
        write(buffer, value);
    else {
        buffer->data[buffer->start] = value;
        buffer->start = (buffer->start + 1) % buffer->capacity;
    }
    return 0;
}

int read(circular_buffer_t *buffer, buffer_value_t *read_value) {
    if (buffer->no_elements>0) {
        *read_value = buffer->data[buffer->start];
        buffer->data[buffer->start] = 0;
        buffer->no_elements--;
        buffer->start = (buffer->start + 1) % buffer->capacity;
        return 0;        
    } else {
        errno = ENODATA;
        return 1; 
    }
}

void clear_buffer(circular_buffer_t *const buffer) {
    buffer->start = 0;
    buffer->no_elements = 0;
    buffer->end = 0;   
}

void delete_buffer(circular_buffer_t *buffer) {
    free(buffer);
    buffer = NULL;
}



