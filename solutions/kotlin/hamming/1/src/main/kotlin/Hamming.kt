object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        require(leftStrand.length ==rightStrand.length) {
           "left and right strands must be of equal length"}
        var l=leftStrand.length
        var hdist = 0
        for(i in 0..(l-1)){
            if(leftStrand[i]!=rightStrand[i]){
                hdist ++; }
        }
        return hdist
    }
}
