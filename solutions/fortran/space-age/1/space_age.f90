
module space_age
  implicit none

  type :: t_planet
    character(len=7) :: name
    double precision :: relative_year
    contains
      procedure :: year_in_seconds
  end type

contains

  double precision function year_in_seconds(self)  result(secs)
      class(t_planet), intent(in) :: self
      secs = self%relative_year * 31557600.d0 
  end function

  double precision function age_in_years(planet, seconds)
    character(len=*), intent(in) :: planet
    double precision, intent(in) :: seconds
    
    type(t_planet), dimension(8) :: planets_of_sol = [ &
      t_planet("Mercury", 0.2408467d0), t_planet("Venus", 0.61519726d0), &
      t_planet("Earth", 1.0d0), t_planet("Mars",  1.8808158d0), &
      t_planet("Jupiter", 11.862615d0), t_planet("Saturn", 29.447498d0), &
      t_planet("Uranus", 84.016846d0), t_planet("Neptune", 164.79132d0)] 
    integer :: p
    
    age_in_years = 0.d0
    do p=1,size(planets_of_sol)
      if (trim(planets_of_sol(p)%name) == planet) then
        age_in_years = seconds/planets_of_sol(p)%year_in_seconds()
        exit
      end if
    end do 
       
  end function

end module
