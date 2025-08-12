module roman_numerals
  implicit none

character(len=2), dimension(13), parameter :: numerals = &
[character(len=2) :: 'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', &
'XL', 'X', 'IX', 'V', 'IV', 'I']
integer, dimension(13), parameter :: steps = &
[1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

contains

  function roman(num) result(s)
    integer, value :: num
    character(15) :: s
    integer :: i
    integer :: n

    s = ''
    n = num
    do i=1,13
        do while (n>=steps(i)) 
            n = n - steps(i)
            s = trim(s) // trim(numerals(i))
        end do
    end do

  end function roman

end module roman_numerals
