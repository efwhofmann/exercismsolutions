
module rational_numbers
  implicit none
contains

  integer function gcd(n,m)
    integer :: n, m, t
    if (n<m) then
        t = n; n = m; m=t
    end if
    do while (m /= 0) 
      t = mod(n,m)  
      n = m
      m = t
    end do
    gcd = n
  end function

  function add(r1,r2)
    integer,dimension(2) :: add, r1,r2
    add = reduce([r1(1)*r2(2) + r2(1)*r1(2), r1(2)*r2(2)])
  end function

  function sub(r1,r2)
    integer,dimension(2) :: sub, r1,r2
    sub = add(r1, [-r2(1), r2(2)])
  end function

  function mul(r1,r2)
    integer,dimension(2) :: mul, r1,r2
    mul = reduce( [r1(1)*r2(1), r1(2)*r2(2)])
  end function

  function div(r1,r2)
    integer,dimension(2) :: div, r1,r2
    div = mul( r1, [r2(2), r2(1)])
  end function

  function rational_abs(r1)
    integer,dimension(2) :: rational_abs, r1
    rational_abs = [abs(r1(1)), abs(r1(2))]
  end function

  function rational_to_pow(r1, ex) 
    integer,dimension(2) :: rational_to_pow, r1
    integer :: ex
    rational_to_pow = [r1(1)**ex, r1(2)**ex]
  end function

  function real_to_rational_pow(ex,r1)
    integer,dimension(2) ::  r1
    real :: real_to_rational_pow,ex
    real_to_rational_pow = ex**(r1(1)/real(r1(2)))
  end function

  function reduce(r1)
    integer,dimension(2) :: reduce, r1
    integer :: s,t
    s = r1(1)*r1(2)
    t = gcd(abs(r1(1)), abs(r1(2)))
    reduce = [sign(r1(1),s)/t, abs(r1(2))/t]
  end function

end module
