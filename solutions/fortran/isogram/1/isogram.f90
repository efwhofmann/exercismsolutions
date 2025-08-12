module isogram
  implicit none
contains

  function isIsogram(phrase) result(no_repeats)
    character(len=*), intent(in) :: phrase
    logical :: no_repeats
    logical, dimension(26) :: has_occured 
    character :: c 
    integer ::  lt_no
    integer :: i
    no_repeats = .true.
    has_occured = (/(.false., I=1,26 )/)
    do i=1,len(phrase)
      c = phrase(i:i)
      if ((c>='a').and.(c<='z')) then
        lt_no = ichar(c) - ichar('a') + 1
        no_repeats = (no_repeats.and.(.not.(has_occured(lt_no))))
        has_occured(lt_no) = .true.
      else if ((c>='A').and.(c<='Z')) then
        lt_no = ichar(c) - ichar('A') + 1
        no_repeats = (no_repeats.and.(.not.(has_occured(lt_no))))
        has_occured(lt_no) = .true.
      end if
    end do
   end function isIsogram

end module isogram
