
module perfect_numbers
  implicit none

contains

  character(len=9) function classify(num)
    integer, intent(in) :: num
    integer :: sum, m
    if (num>0) then
      sum = 0
      do m = 1, (num-1)
        if (mod(num, m)==0) then
          sum = sum + m
        end if
      end do
      if (sum == num) then
          classify = "perfect"
      else if (sum > num) then
          classify = "abundant"
      else
          classify = "deficient"
      end if
    else
      classify = "ERROR"
    end if
  end function

end module
