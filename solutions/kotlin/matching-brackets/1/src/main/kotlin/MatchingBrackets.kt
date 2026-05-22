object MatchingBrackets {

    private fun isLeftDelim(ch : Char): Boolean =
        ch=='(' || ch=='[' || ch=='{'

    private fun isRightDelim(ch : Char): Boolean =
        ch==')' || ch==']' || ch=='}'

    private fun closes(l: Char, r : Char) : Boolean = 
        (l == '(' && r == ')') ||
        (l == '[' && r == ']') ||
        (l == '{' && r == '}')     

    
    fun isValid(input: String): Boolean {
        var lifo = ArrayList<Char>()
        input.forEach { ch ->
            if (isLeftDelim(ch)) {
                lifo.add(ch)                
            } 
            if (isRightDelim(ch)) {
                if (lifo.isEmpty())
                    return false
                if (closes(lifo.last(),ch)) 
                    lifo.removeLast()
                else return false
            }
        }
        return lifo.isEmpty()
    }
}
