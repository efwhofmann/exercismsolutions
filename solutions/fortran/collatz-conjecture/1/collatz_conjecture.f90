
module collatz_conjecture
  implicit none
contains

  integer function collatz_map(n)
    integer :: n
    if (mod(n,2) == 0) then
      n = n/2
    else 
      n = 3*n + 1
   end if
    collatz_map = n
  end function collatz_map

  integer function steps(i)
    integer, intent(in) :: i
    integer ::  j, stp_count
    stp_count = -1
     j = i
    if (j>0) then
       stp_count = 0
       do while (j /= 1) 
          j = collatz_map(j)
          stp_count = stp_count + 1
       end do
    end if
    steps = stp_count
  end function steps

end module collatz_conjecture
