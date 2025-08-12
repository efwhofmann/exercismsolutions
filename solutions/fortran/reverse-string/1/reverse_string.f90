module reverse_string
  implicit none
contains

  function reverse(input) result(reversed)
    character(*), intent(in) :: input
    character(len=len(input)) :: reversed
    integer :: i, t

    do i = 1, len(input)
      t = len(input) - i + 1
      reversed(i:i) = input(t:t)  
    end do
  
  end function

end module
