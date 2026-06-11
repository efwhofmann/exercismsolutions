object HandshakeCalculator {

    val actions = arrayOf(Signal.WINK, Signal.DOUBLE_BLINK, Signal.CLOSE_YOUR_EYES, Signal.JUMP)
    
    fun calculateHandshake(number: Int): List<Signal> {
        var result = mutableListOf<Signal>()      
        for(i in 0..3) {
            if ((number and (1 shl i)) !=0) 
                result.add(actions[i])
        }
        if ((number and 16)!=0)
            return result.reversed()
        return result
    }
}
