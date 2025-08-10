struct arabic_to_roman 
    arabic::Int
    roman::String
end

a_to_r_map = [ arabic_to_roman(1000,"M"),  arabic_to_roman(900,"CM"), 
arabic_to_roman(500,"D"), arabic_to_roman(400,"CD"),    arabic_to_roman(100,"C"), arabic_to_roman(90,"XC"),
    arabic_to_roman(50,"L"), arabic_to_roman(40,"XL"),
    arabic_to_roman(10, "X"),   arabic_to_roman(9, "IX"),
      arabic_to_roman(5, "V"),   arabic_to_roman(4, "IV"),
      arabic_to_roman(1, "I")
]

function to_roman(number)
if number<=0 
    throw(ErrorException("Invalid argument: Positive only!"))
end
 result = ""
 for i = 1:length(a_to_r_map)
      while  number >= a_to_r_map[i].arabic
          result *= a_to_r_map[i].roman
          number -= a_to_r_map[i].arabic
      end
  end
  result  
end
