// Package leap provides an IsLeapYear function, which does exectly what its name says
package leap

// IsLeapYear answers if a given year is aleap year in Gregorian calender  
func IsLeapYear(year int) bool {
	return year%4==0 && (year%25 !=0 || year%16==0)
}
