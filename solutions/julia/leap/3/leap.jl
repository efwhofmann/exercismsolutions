"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
    year & 3 == 0 &&  year % 25 != 0 || year & 15 ==0

end

