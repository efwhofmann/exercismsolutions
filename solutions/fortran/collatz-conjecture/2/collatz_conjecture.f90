
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

  integer function steps(i) result(count)
    integer, intent(in) :: i
    integer ::  j
    count = 0
    if (i>0) then
        j = i
       do while (j /= 1) 
          j = collatz_map(j)
          count = count + 1
       end do
    else
      count = -1
    end if
  end function steps

end module collatz_conjecture
