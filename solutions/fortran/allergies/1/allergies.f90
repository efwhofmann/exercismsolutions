
module allergies
  implicit none
character(len=12), dimension(8), parameter :: allergens = & 
[character(len=12) :: 'eggs', 'peanuts', 'shellfish', &
'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']

contains

  logical function allergicTo(allergy_str, allergy_key) result(res)
    character(len=*), intent(in) :: allergy_str
    integer, intent(in) :: allergy_key
    res = (index(allergicList(allergy_key), allergy_str) /= 0) 
  end function



  function allergicList(allergy_key)
    integer, intent(in) :: allergy_key
    character(len=100) :: allergicList
    integer :: i
    allergicList = ' '

    do i = 1,8
      if (iand(ishft(allergy_key, -i+1),1).eq.1) then
        if (len(trim(allergicList)).eq.0) then
          allergicList =  trim(allergens(i))
        else
          allergicList =  trim(allergicList) //" "// trim(allergens(i))
        end if
      end if
    end do
  end function



end module