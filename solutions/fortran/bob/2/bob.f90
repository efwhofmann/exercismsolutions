module bob
  implicit none
   character(len=32), dimension(5), parameter :: answers = &
    [character(len=32) :: 'Sure.', 'Whoa, chill out!', &
     "Calm down, I know what I'm doing!", 'Fine. Be that way!', 'Whatever.'] 
contains


  logical function is_question(statement)
      character(len=*), intent(in) :: statement
      character(len=len(trim(statement))) :: trimmed
      integer :: idx
      trimmed = trim(statement)
      idx = len(trimmed)
      is_question = (trimmed(idx:idx) == '?')
  end function

  logical function has_uppercase(statement) result(res)
      character(len=*), intent(in) :: statement
      character(len=100) :: trimmed  
      integer :: ii 
    
      res = .false.
      trimmed = trim(statement)
      do ii = 1, len(trimmed)
          res =  (res.or.('A' <= trimmed(ii:ii)).and.(trimmed(ii:ii) <= 'Z'))
      end do
   end function 
  

  logical function has_lowercase(statement) result(res)
      character(len=*), intent(in) :: statement
      character(len=100) :: trimmed  
      integer :: ii 

      res = .false.
      trimmed = trim(statement)
      do ii = 1, len(trimmed)
          res = (res.or.('a' <= trimmed(ii:ii)).and.(trimmed(ii:ii) <= 'z'))
      end do
   end function 

  logical function is_yelling(statement) 
      character(len=*), intent(in) :: statement
      is_yelling = ((has_uppercase(statement)).and.(.not.(has_lowercase(statement))))
  end function


  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    hey = answers(5) 
    if (trim(statement) == "") then
        hey = answers(4)
    else if (is_question(statement)) then
        if (is_yelling(statement))  then
         hey = "Calm down, I know what I'm doing!"
        else
          hey = answers(1)
        end if
    else if (is_yelling(statement)) then
        hey = answers(2)
    end if
  end function hey

end module bob
