#ifndef BEER_SONG_H
#define BEER_SONG_H

#include <stdint.h>

void recite(uint8_t start_bottles, uint8_t take_down, char **song);

void one_verse(uint8_t n_bottles, char **song, uint16_t *line);

#endif
