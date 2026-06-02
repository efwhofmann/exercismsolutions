class Series (private val digitString : String) {

    init {
        require(digitString.all{it.isDigit()})
    }

    private val digits  = digitString.toCharArray().map{it.digitToInt()}
    
    fun getLargestProduct(span: Int): Long {
        require(span>=0 && span<=digits.size)
        return when {
            span == 0 -> 1
            else -> digits.windowed(span, step=1)
            {it.fold(1L){p,n -> n*p}}
            .maxOf{it}
        }
    }
}
