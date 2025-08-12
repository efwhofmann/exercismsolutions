module sieve
  implicit none

contains

 function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    integer :: k 
    integer, allocatable:: numbers(:)
    integer :: sqrt_limit
    integer :: n 
    if (limit > 1) then
        allocate(numbers, source=[(k,k=1,limit)])
        n = 2
        sqrt_limit = int(sqrt(real(limit)))
      do while (n<= sqrt_limit)
        do k=n*n,limit,n
          numbers(k) = 0
        end do
        n = n+1
        do while (n==0) 
          n= n+1
        end do
      end do
      array = pack(numbers, numbers>1)
    else
      allocate(array(0))
    end if
  end function primes


end module sieve
