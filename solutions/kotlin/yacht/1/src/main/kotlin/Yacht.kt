object Yacht {

    
    fun solve(category: YachtCategory, vararg dices: Int): Int     {
           //val dies = dices.toList().toIntArray()
           return when (category) {
               YachtCategory.YACHT ->  
               {if (dices.count{it==5} == 5) 
                    50 else 0}
               YachtCategory.ONES -> dices.count{it==1}
               YachtCategory.TWOS -> dices.count{it==2}*2
               YachtCategory.THREES -> dices.count{it==3}*3
               YachtCategory.FOURS -> dices.count{it==4}*4
               YachtCategory.FIVES -> dices.count{it==5}*5
               YachtCategory.SIXES -> dices.count{it==6}*6
               YachtCategory.CHOICE -> dices.sum()
               YachtCategory.FULL_HOUSE -> {
                    var dcs = dices.toList().sorted()
                    var a = dcs.count{it==dcs[0]}  
                    var b = dcs.count{it==dcs[4]}
                    if ((a==2 && b==3) || (a==3 && b==2)) 
                        dcs.sum() else 0
               }
               YachtCategory.FOUR_OF_A_KIND -> {
                   var dcs = dices.toList().sorted()
                   if (dcs.count{it==dcs[0]}>=4)
                       4*dcs[0]
                   else if (dcs.count{it==dcs[4]}>=4)
                       4*dcs[4]
                   else 0                       
               }
               YachtCategory.LITTLE_STRAIGHT -> {  
                  if(dices.toList().sorted() == listOf(1,2,3,4,5)) 30  else 0 }
               YachtCategory.BIG_STRAIGHT -> { 
                if(dices.toList().sorted() == listOf(2,3,4,5,6)) 30  else 0 }
                else -> 0                
           }
    }
}
