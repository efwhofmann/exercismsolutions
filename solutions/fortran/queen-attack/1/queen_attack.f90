
module queen_attack
  implicit none
contains

  logical function isValid(pos)
    integer, dimension(2) :: pos
    isValid = (0 < pos(1)).and.(0 < pos(2)).and.(pos(1)<=8).and.(pos(2)<=8)
   
  end function

  logical function on_different_squares(w_pos, b_pos) 
    integer, dimension(2) :: w_pos, b_pos
    on_different_squares = ((w_pos(1) /= b_pos(1)).or.(w_pos(2)/= b_pos(2)))
  end function

  logical function canAttack(white_pos, black_pos)
    integer, dimension(2) :: white_pos, black_pos
    integer :: d_x, d_y
    
    if (isValid(white_pos).and.isValid(black_pos).and.on_different_squares(white_pos, black_pos)) then
      d_x = abs( white_pos(1) - black_pos(1))
      d_y = abs( white_pos(2) - black_pos(2))
      canAttack = ((d_x == 0).or.(d_y == 0).or.(d_x == d_y))
    else
      canAttack = .false.
    end if
  end function

end module
