function isarmstrong(num)
   num >= 0 && num==sum(digits(num).^(length(digits(num))))
end 