object Luhn {

    fun isValid(candidate: String): Boolean {
       val cand = candidate.replace(" ","")
       val regex = "[^0-9]".toRegex()
       if (regex.find(cand)!=null)
           return false
       val len = cand.length
       if (len <= 1)
           return false    
       return cand.map{ch -> ch.digitToInt()}
           .mapIndexed{idx, d -> if ((len-idx) % 2==0 && d!=9 ){ 2*d % 9} else {d}}
           .sum() % 10 == 0
    }
}
