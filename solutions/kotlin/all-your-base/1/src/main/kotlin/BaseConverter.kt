class BaseConverter(val base: Int, val digits: IntArray) {

    init{
        require(base >=2){"Bases must be at least 2."}
        require(digits.isNotEmpty()){"You must supply at least one digit."}
        if (digits.size>1){
            require(digits[0]!=0){"Digits may not contain leading zeros."}
        }
        require(digits.all{ it>=0}){"Digits may not be negative."}
        require(digits.all{it<base}){"All digits must be strictly less than the base."}
    }
    
   
    
    
    fun convertToBase(newBase: Int): IntArray {
        require(newBase >=2){"Bases must be at least 2."}
        var n = 0;
        for (d in digits){
            n = base*n + d
        }
        if (n==0) return IntArray(1){0}
        
        var output = mutableListOf<Int>()
        while (n>0) {
            output.add(n % newBase)
            n /= newBase
        }
        return output.asReversed().toIntArray()
    }
}
