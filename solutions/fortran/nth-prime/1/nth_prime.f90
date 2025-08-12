module nth_prime
  implicit none
contains
! get nth prime
  integer function prime(n)
    integer, intent(in) :: n
    integer :: p_no, cand, i
    logical :: is_prime
    prime = -1 
    if (n>0) then
      if (n==1) then
        prime = 2
      else
        p_no = 2
        cand = 3
        is_prime = .false.
        do while (p_no /= n) 
          cand = cand + 2
          is_prime = .true.
          do i = 3, floor(sqrt(real(cand+1))), 2
            if (mod (cand,i) == 0) then
              is_prime = .false.
              exit
            end if
          end do
          if (is_prime) then 
            p_no  = p_no + 1
          end if
        end do
        prime = cand
      end if
    end if
  end function


end module