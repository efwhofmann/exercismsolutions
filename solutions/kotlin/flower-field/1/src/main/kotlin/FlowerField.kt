data class FlowerFieldBoard(val garden: List<String>) {


    fun withNumbers(): List<String> {        
        if(garden.size == 0) 
            return listOf<String>()
        var output = mutableListOf<String>()
        val rows = garden.size
        val cols = garden[0].length
        for(y in 0..rows-1){
            var cur_row = ""
            for(x in 0..cols-1){
                if (garden[y][x]=='*')
                    cur_row += '*'
                else {
                    var count=0
                    for(dx in -1..1){
                        for(dy in -1..1){
                            var new_x = x + dx
                            var new_y = y + dy 
                            if(new_y >= 0 && new_y < rows 
                            && new_x >= 0 && new_x < cols
                            && '*' == garden[new_y][new_x])
                                count++;
                        }}
                    if(count>0)
                        cur_row += count.toString()
                    else    
                        cur_row += ' '
                }
            }
            output.add(cur_row)
        }
        return output
    }
}
