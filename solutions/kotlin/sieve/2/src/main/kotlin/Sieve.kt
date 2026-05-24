object Sieve {

    fun primesUpTo(N: Int): List<Int> {
        var numbers = (2..N).toMutableList()
        var n=2
        while(n<=N) {
            ((n*n) .. N step n).forEach(){
                numbers.remove(it)}            
            n++
        }
        return numbers
     }
}
