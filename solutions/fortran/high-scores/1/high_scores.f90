
module high_scores
  implicit none
contains

function scores(score_list) result(scs)
  integer, dimension(:) :: score_list
  integer, dimension(size(score_list)) :: scs
  scs = score_list
end function

function latest(score_list) result(last)
  integer, dimension(:) :: score_list
  integer :: last
  last = score_list(size(score_list))
end function

function personalBest(score_list) result(best)
  integer, dimension(:) :: score_list
  integer :: best
  integer :: l, i
  l = size(score_list)
  best = 0 
  do i = 1,l  
    if (score_list(i) > best) then
      best = score_list(i)
    end if
  end do
end function

function personalTopThree(score_list) result(top3)
  integer, dimension(:) :: score_list
  integer, dimension(3) :: top3
  integer :: i
  top3 = (/0,0,0/)
  do i = 1,size(score_list)
    if (score_list(i) > top3(1)) then
      top3(3) = top3(2)
      top3(2) = top3(1)
      top3(1) = score_list(i)
    else if (score_list(i) > top3(2)) then
      top3(3) = top3(2) 
      top3(2) = score_list(i)
    else if (score_list(i) > top3(3)) then
      top3(3) = score_list(i)
    end if
  end do
  
end function

end module
