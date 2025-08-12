
module armstrong_numbers
  implicit none
contains

  logical function isArmstrongNumber(i)
    integer, intent(in) :: i
    integer:: j, k, mysum, ten_power
    integer, dimension(1:9) :: digits

    if (i==0) then
      isArmstrongNumber = .true.
    else
      digits = (/ 0,0,0,0,0,0,0,0,0 /)
      j = i
      k = 1
      do while (j>0)
        digits(k) = mod(j,10)
        j = (j - mod(j,10))/10
        k = k+1
      end do
      mysum = sum(digits**(k-1))
      isArmstrongNumber = (mysum == i)
    end if
  end function

end module
