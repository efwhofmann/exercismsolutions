module leap
  implicit none

contains

  logical function is_leap_year(year)
    integer :: year
    
    is_leap_year = (iand(year, 3) == 0) .and. ((mod(year,25) /= 0 ) .or.  (iand(year, 15) == 0))
  end function

end module

