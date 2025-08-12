
module perfect_numbers
  implicit none

contains

integer function aliquot_sum(n) result(aliquot)
  integer, intent(in) :: n
  integer :: i
  integer, dimension(n / 2)  :: seq

  seq = [(i, i=1, n / 2)]
  aliquot = sum(seq, mask = mod(n,seq) == 0)
end function aliquot_sum

character(len=9) function classify(num)
    integer, intent(in) :: num
    if (num>0) then
       select case(aliquot_sum(num) - num)
        case (0) 
            classify = "perfect"
       case (1:) 
            classify = "abundant"
       case default
            classify = "deficient"
      end select
    else
      classify = "ERROR"
    end if
 end function classify

end module
