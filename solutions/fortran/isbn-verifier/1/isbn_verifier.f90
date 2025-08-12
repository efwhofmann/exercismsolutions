module isbn_verifier
  implicit none

contains

  function isValid(isbn) result(valid)
    character(*), intent(in) :: isbn
    logical :: valid, valid_input
    integer :: i, k, sum
    integer,dimension(10) :: digits
    k = 1
    valid_input = .true.
    sum = 0
    do i=1,len(isbn)
      if (k>10) then
        ! invalid
        valid_input = .false.
        exit
      end if
      if (('0'<=isbn(i:i)).and.('9'>=isbn(i:i))) then
        read(isbn(i:i),*) digits(k)
        k = k+1
      else if ((k==10).and.(isbn(i:i) == 'X')) then
        digits(10) = 10
        k = k+1
      else if (isbn(i:i) /= '-') then
        !invalid
        valid_input = .false.
        exit
      end if
    end do
    if (valid_input) then
      sum = 0 
      do i = 1,10
        sum = sum + (11-i)*digits(i)
        valid = (mod(sum,11) == 0)  
      end do
    else
      valid = .false.
    end if
  end function isValid

end module isbn_verifier
