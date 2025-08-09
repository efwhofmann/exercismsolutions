#include "meetup.h"

#include <string.h>
#include <stdlib.h>

#define FIRST 0
#define SECOND 1
#define THIRD 2
#define FOURTH 3
#define TEENTH 4
#define LAST 5


int schedule_from_string(const char*);
int weekday_from_string(const char*);
int doomsday(unsigned int, unsigned int, unsigned int);
unsigned int feb_length(unsigned int);

int schedule_from_string(const char *sc){
    if(0==strcmp(sc, "first"))
        return FIRST;
    else if (0==strcmp(sc, "second"))
        return SECOND;
    else if (0==strcmp(sc, "third"))
        return THIRD;
    else if (0==strcmp(sc, "fourth"))
        return FOURTH;
    else if (0==strcmp(sc, "teenth"))
        return TEENTH;
    else  // (0==strcmp(sc, "last"))
        return LAST;
}

int weekday_from_string(const char *wd)
{
    if (0==strcmp(wd, "Sunday"))
        return 0;
    else if (0==strcmp(wd, "Monday"))
        return 1;
     else if (0==strcmp(wd, "Tuesday"))
        return 2;
     else if (0==strcmp(wd, "Wednesday"))
        return 3;
     else if (0==strcmp(wd, "Thursday"))
        return 4;
     else if (0==strcmp(wd, "Friday"))
        return 5;
     else //if (0==strcmp(wd, "saturday"))
        return 6;
}
 
unsigned int feb_length(unsigned int year){
    return (year % 4 != 0) ?  28 : (year != 1900 ? 29 : 28);
}

int doomsday(unsigned int year, unsigned int month, unsigned int day)
{
     const unsigned int odd_month_dd[] = {3,7,9,11,5,7}; 
     int anchor = year > 1999 ? 2 : 3;
     int yy = year%100;
     int dy =  (anchor + yy/12 + (yy%12) + (yy % 12)/4) % 7;
     unsigned int dm = (0 == month % 2) ? ((month !=2) ? month : feb_length(year)) 
         : odd_month_dd[(month-1)/2];
     if (month ==1 && feb_length(year) == 29) 
         dm++;
     int r  = (dy - dm + day);
     return r>=0 ? (r % 7) : (r % 7) + 7;
} 


int meetup_day_of_month(unsigned int year, unsigned int month, const char *week,
                        const char *day_of_week)
{
    const unsigned int days_per_month[] = {31,28,31,30,31,30,31,31,30,31,30,31}; 
    int schedule = schedule_from_string(week);
    int wday = weekday_from_string(day_of_week);
    int maxday =  (month != 2) ? days_per_month[month-1] :  feb_length(year);
    int day = 1;
    int current_last = 1;
    int count = FIRST;
    while(day <= maxday) {
        if(doomsday(year, month, day) == wday) {            
            current_last = day;
            if(schedule == FIRST)
                break;
            else if(schedule == SECOND && count == SECOND)
                break;
            else if(schedule == THIRD && count == THIRD)
                break;
            else if (schedule == FOURTH && count == FOURTH)
                break;
            else if (schedule == TEENTH && ((day >=13) && (day<=19)))
                break;
            count++;                
        }
        day++;    
    }
   return current_last;
}