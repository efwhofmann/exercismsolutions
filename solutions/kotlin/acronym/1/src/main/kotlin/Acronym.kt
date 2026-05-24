object Acronym {
    
    fun generate(phrase: String) : String {
        var  acro = "" 
        for(i in 0..phrase.length){
            if (i==0 || phrase[i-1].isWhitespace() || 
                    setOf('-','_').contains(phrase[i-1])) {
            if (phrase[i].isLetter())
                acro += phrase[i].toUpperCase()
            }
        }
        return acro
    }
}
