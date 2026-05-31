object Luhn {

    fun isValid(candidate: String): Boolean {
       val cand = candidate.replace(" ","")
       if (cand.length <= 1)
           return false
       var sum = 0
       for(i in cand.length-1 downTo 0){
           val char = cand[i]
           if (char.isDigit()){
               var d = char.digitToInt()
               if(((cand.length-i) % 2 ==0) && d!=9) 
                       d = 2*d % 9
               sum += d    
           } else return false
       }
       return sum % 10 == 0
    }
}
