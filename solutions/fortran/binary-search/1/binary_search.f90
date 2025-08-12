module binary_search
  implicit none
contains

  function find(array, val) result(idx)
    integer, dimension(:), intent(in) :: array
    integer, intent(in) :: val
    integer :: idx
    integer :: left 
    integer :: right 
    integer :: mid 

    left = 1
    right = size(array)
    idx = -1
    if (right>0) then
     do while (left<=right)
          mid = (right+left)/2
          if (array(mid) == val) then
            idx = mid  
            right = 0
          else if (array(mid)<val) then
            left = (mid + 1)
          else
            right = (mid - 1) 
          end if
      end do
    end if
    
     
  end function

end module
