object ETL {
    fun transform(source: Map<Int, Collection<Char>>): Map<Char, Int> {
       val result = mutableMapOf<Char,Int>()
       for((k,v) in source){ 
           for( ch in v)
               result.put(ch.toLowerCase(), k)}
        return result
    }
}
