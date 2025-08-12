module pangram
  implicit none
contains

  logical function has_letter(sentence, no)
    character(*) :: sentence
    integer :: no
    character(26) :: lowercase, uppercase
    character :: cl, cu
    
    lowercase = "abcdefghijklmnopqrstuvwxyz"
    uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    cl = lowercase(no:no) 
    cu = uppercase(no:no)
    has_letter = (index(sentence, cl) /=0).or.(index(sentence, cu) /=0)
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
