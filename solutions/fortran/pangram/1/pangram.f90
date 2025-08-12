module pangram
  implicit none
contains

  logical function has_letter(sentence, no)
    character(*) :: sentence
    integer :: no
    character(26) :: lowercase, uppercase
    integer :: i 
    character :: cl, cu
    lowercase = "abcdefghijklmnopqrstuvwxyz"
    uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    has_letter = .false.
    cl = lowercase(no:no) 
    cu = uppercase(no:no)
    do i = 1,len(sentence)
       has_letter = has_letter.or.(sentence(i:i) == cl).or.(sentence(i:i) == cu)
    end do
  end function has_letter

  logical function is_pangram(sentence) 
    character(*) :: sentence
    integer :: lts 
    is_pangram = .true.
    do lts = 1,26
        is_pangram = is_pangram.and.has_letter(trim(sentence), lts)
    end do
   end function is_pangram

end module pangram
