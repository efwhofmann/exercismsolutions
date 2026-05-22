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
    
   
    private fun IntArray.toValue(fromBase: Int)
    = this.fold(0){acc, it->acc*fromBase + it}

    private fun Int.toNewBase(newBase : Int)
        = generateSequence(this.to(0)){(curr, _) -> (curr/newBase) to (curr % newBase)}
            .drop(1)
            .takeWhile{it.first + it.second>0}
            .map{it.second}
            .toList()
            .asReversed()
            .toIntArray()
    
    fun convertToBase(newBase: Int): IntArray {
        require(newBase >=2){"Bases must be at least 2."}
        var n = digits.toValue(base)
        if (n==0) return IntArray(1){0}
        return n.toNewBase(newBase)
    }
}
