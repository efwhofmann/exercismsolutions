object Sieve {

    fun primesUpTo(upperBound: Int): List<Int> {
        var numbers = Array<Int>(upperBound){0}
        var n=2
        while(n<=upperBound) {
            for (k in n*n..upperBound step n){
                numbers[k-1] = 1
            }
            n++
        }
        return numbers
            .mapIndexed{idx,v ->
                if(idx>0 && v==0) idx+1 else 0}
            .filter{it>0}.toList()
    }
}
