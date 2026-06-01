object Series {

    fun slices(n: Int, s: String): List<List<Int>> {
        if (s=="")
            throw IllegalArgumentException("Empty series is invalid.")
        if (n<=0)
            throw IllegalArgumentException("Slice length must be positive.")
        if (s.length < n)
            throw IllegalArgumentException("Slice length is too large.")
        var result = mutableListOf<List<Int>>()
        for(i in 0..(s.length-n)) {
            result.add(s.substring(i,i+n).map{ch -> ch.digitToInt()})
        }
        return result
    }
}
