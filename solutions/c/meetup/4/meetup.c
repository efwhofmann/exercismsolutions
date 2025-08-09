#include "meetup.h"

#include <string.h>
#include <time.h>

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
    const char* sched[] = {"first", "second", "third", "fourth", "teenth"};
    for(int i = 0; i<5; i++) {
        if(0 == strcmp(sc, sched[i]))
           return i;
    }
    return LAST;
}

int weekday_from_string(const char *wd)
{
    const char* days[] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
    for(int i=0; i<6; i++) {
        if(0 == strcmp(wd, days[i]))
            return i;
    }
    return 6;
}
 
unsigned int feb_length(unsigned int year){
    return (year % 4 != 0) ?  28 : (year != 1900 ? 29 : 28);
}



int meetup_day_of_month(unsigned int year, unsigned int month, const char *week,
                        const char *day_of_week)
{
    const unsigned int days_per_month[] = {31,28,31,30,31,30,31,31,30,31,30,31}; 
     
    int schedule = schedule_from_string(week);
    int wday = weekday_from_string(day_of_week);
    int maxday =  (month != 2) ? days_per_month[month-1] :  feb_length(year);
    int current_last = 1;
    int count = FIRST;
    for(int day = 1; day <= maxday; day++) {
        struct tm candidate = {.tm_year = year - 1900, .tm_mon = month -1, .tm_mday = day};
        mktime(&candidate);
        int wd = candidate.tm_wday;
        if(wd == wday) {            
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
     }
   return current_last;
}