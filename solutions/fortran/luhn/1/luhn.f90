module luhn
  implicit none

contains

  function validate(number) result(valid)
    character(*), intent(in) :: number
    logical :: valid
    integer :: i, no_spaces, d, sum
    
    valid = .false.
    if (len(trim(adjustl(number))) <= 1) then 
      return 
    end if
    sum = 0
    no_spaces = 0  
    do i = len(number),1,-1
        select case (number(i:i))
        case('0':'9')
          d = iachar(number(i:i)) - iachar('0')
          if (mod(len(number) - (i+ no_spaces), 2) == 1) then
            if (d/=9) then 
                d = mod(2*d,9)
            end if
          end if
          sum = sum + d
        case(' ')
          no_spaces = no_spaces + 1
        case default
          return
        end select
    end do
    valid = (mod(sum,10) == 0) 
  end function validate

end module luhn
