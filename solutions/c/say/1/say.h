#ifndef SAY_H
#define SAY_H

#include <stdint.h>

int say(int64_t input, char **ans);
int parse_ones(int64_t number, char** ans);
int parse_tens(int64_t number, char** ans);
 int parse_hundreds(int64_t number, char** ans);

#endif
