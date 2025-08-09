#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H
#include <stddef.h>
#include <stdint.h>


typedef  uint16_t buffer_value_t;
typedef struct _circular_buffer_t {
    uint16_t capacity;
    uint16_t no_elements;
    uint16_t start;
    uint16_t end;
    buffer_value_t data[]; 
} circular_buffer_t;



circular_buffer_t* new_circular_buffer(int capacity);
int write(circular_buffer_t *buffer, buffer_value_t value);
int overwrite(circular_buffer_t *buffer, buffer_value_t value);
int read(circular_buffer_t *buffer, buffer_value_t *read_value);
void clear_buffer(circular_buffer_t *const buffer);
void delete_buffer(circular_buffer_t *buffer);

#endif
