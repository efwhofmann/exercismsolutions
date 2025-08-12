
module triangle
  implicit none

  interface equilateral
    module procedure equilateral_real
    module procedure equilateral_int
  end interface

  interface scalene
    module procedure scalene_real
    module procedure scalene_int
  end interface

  interface isosceles
    module procedure isosceles_real
    module procedure isosceles_int
  end interface

 contains

 logical function triangle_ineq_real(edges)
    real,dimension(3) :: edges
    logical :: eq1, eq2, eq3
    eq1 = (edges(1)<=(edges(2)+edges(3)))
    eq2 = (edges(2)<=(edges(1)+edges(3)))
    eq3 = (edges(3)<=(edges(2)+edges(1)))
    triangle_ineq_real = (eq1.and.eq2.and.eq3)
  end function

  logical function triangle_ineq_int(edges)
    integer,dimension(3) :: edges
    logical :: eq1, eq2, eq3
    eq1 = (edges(1)<=(edges(2)+edges(3)))
    eq2 = (edges(2)<=(edges(1)+edges(3)))
    eq3 = (edges(3)<=(edges(2)+edges(1)))
    triangle_ineq_int = (eq1.and.eq2.and.eq3)
  end function

  logical function equilateral_real(edges)
    real,dimension(3) :: edges
    if ((edges(1) /= 0).and.(edges(2) /=0).and.(edges(3) /=0).and.triangle_ineq_real(edges)) then
      equilateral_real = (edges(1) == edges(2)).and.(edges(2) == edges(3))
    else
      equilateral_real = .false.
    end if
  end function

  logical function equilateral_int(edges)
    integer,dimension(3) :: edges
    if ((edges(1) /= 0).and.(edges(2) /=0).and.(edges(3) /=0).and.triangle_ineq_int(edges)) then
      equilateral_int = (edges(1) == edges(2)).and.(edges(2) == edges(3))
    else
      equilateral_int = .false.
    end if
  end function

  logical function isosceles_real(edges)
    real,dimension(3) :: edges
    if ((edges(1) /= 0).and.(edges(2) /=0).and.(edges(3) /=0).and.triangle_ineq_real(edges)) then
      isosceles_real = (edges(1) == edges(2)).or.(edges(2) == edges(3)).or.(edges(1)==edges(3))
    else
     isosceles_real = .false.
    end if
   end function

  logical function isosceles_int(edges)
    integer,dimension(3) :: edges
    if ((edges(1) /= 0).and.(edges(2) /=0).and.(edges(3) /=0).and.triangle_ineq_int(edges)) then
      isosceles_int = (edges(1) == edges(2)).or.(edges(2) == edges(3)).or.(edges(1)==edges(3))
    else
     isosceles_int = .false.
    end if
  end function


  logical function scalene_real(edges)
    real,dimension(3) :: edges
    if ((edges(1) /= 0).and.(edges(2) /=0).and.(edges(3) /=0).and.triangle_ineq_real(edges)) then
      scalene_real = (edges(1) /= edges(2)).and.(edges(2) /= edges(3)).and.(edges(1)/=edges(3))
    else
     scalene_real = .false.
    end if
  end function

  logical function scalene_int(edges)
    integer,dimension(3) :: edges

     if ((edges(1) /= 0).and.(edges(2) /=0).and.(edges(3) /=0).and.triangle_ineq_int(edges)) then
      scalene_int = (edges(1) /= edges(2)).and.(edges(2) /= edges(3)).and.(edges(1)/=edges(3))
    else
     scalene_int = .false.
    end if
  end function

end module
