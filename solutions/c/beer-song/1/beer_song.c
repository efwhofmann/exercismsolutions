#include "beer_song.h"
#include <stdio.h>

// Note: The number of lines in the for the complete song
// exceeds UINT8_MAX hence uint16_t
void one_verse(uint8_t n_bottles, char **song, uint16_t *line){
    if(n_bottles>2){
        sprintf(song[*line], "%u bottles of beer on the wall, %u bottles of beer.", n_bottles, n_bottles);
        (*line)++;
        sprintf(song[*line], "Take one down and pass it around, %u bottles of beer on the wall.", n_bottles-1);
        (*line)++;
    }
    else if(n_bottles==2){
        sprintf(song[*line], "%u bottles of beer on the wall, %u bottles of beer.", n_bottles, n_bottles);
        (*line)++;
        sprintf(song[*line], "Take one down and pass it around, %u bottle of beer on the wall.", n_bottles-1);
        (*line)++;
    }
    else if(n_bottles==1){
        sprintf(song[*line], "1 bottle of beer on the wall, 1 bottle of beer.");
        (*line)++;
        sprintf(song[*line], "Take it down and pass it around, no more bottles of beer on the wall.");
        (*line)++;
    }
    else // 0 bottles 
    {
        sprintf(song[*line], "No more bottles of beer on the wall, no more bottles of beer.");
        (*line)++;
      sprintf(song[*line],"Go to the store and buy some more, 99 bottles of beer on the wall.");
        (*line)++;
    }
}

void recite(uint8_t start_bottles, uint8_t take_down, char **song){
    if(!song)
        return;
  //  if(!take_down){
  //      if(start_bottles>1)
  //          sprintf(*song, "%u bottles of beer on the wall, %u bottles of beer.", start_bottles, start_bottles);
  //      else if (start_bottles==1)
  //          sprintf(*song, "1 bottle of beer on the wall, 1 bottle of beer.");
  //      else
  //           sprintf(*song, "No more bottles of beer on the wall, no more bottles of beer.");
  //  }
    uint16_t line_no=0; 
    for(;take_down>0; take_down--){
        one_verse(start_bottles, song, &line_no);
        if(take_down>1){
            const char nothing = '\0';
            sprintf(song[line_no], &nothing);
            line_no++;
        }
        if(start_bottles==0)
            break;
        start_bottles--;
    }    
}