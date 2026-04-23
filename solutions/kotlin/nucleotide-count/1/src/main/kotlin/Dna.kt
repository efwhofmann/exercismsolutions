class Dna (private val strand: String){

    init {
        require( strand.toCharArray().all{ it in "ACGT"})
    }

    val startMap = mapOf('A' to 0, 'C' to 0, 'G' to 0, 'T' to 0)
    
    val nucleotideCounts: Map<Char, Int>
        get() {
            return startMap + 
                this.strand.toCharArray().groupBy{it}
                .map{(k,v) -> k to v.size}.toMap();
        }
}
