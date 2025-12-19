import java.util.Map;

class ResistorColorTrio {
    static private Map<String, Integer> ccodeMap = Map.ofEntries(
        Map.entry("black", 0),
        Map.entry("brown", 1),
        Map.entry("red", 2),
        Map.entry("orange",3),
        Map.entry("yellow",4),
        Map.entry("green", 5),
        Map.entry("blue",6),
        Map.entry("violet",7),
        Map.entry("grey",8),
        Map.entry("white",9)
   );
    
    String label(String[] colors) {
        int n1 = ccodeMap.get(colors[0]);
        int n2 = ccodeMap.get(colors[1]);
        int n3 = ccodeMap.get(colors[2]);
        int ohms = 10*n1 + n2;
        String color_label = "";
        if ((n3<=1) || (n1 ==0 && n3==2)){
            ohms *= n3 == 2 ? 100 : n3 == 1 ? 10 : 1;
            color_label = Integer.toString(ohms)+" ohms";
        }
        else if (n1!=0 && n2==0 && n3==2){
            color_label = Integer.toString(n1)+" kiloohms";
        }
        else if (n1!=0 && n2==0 && n3==2){
            color_label = Integer.toString(n1)+" kiloohms";
        }
        else if (n1!=0 && n2!=0 && n3==2){
            ohms /= 10;
            color_label = Integer.toString(ohms)+" kiloohms";
        }
        else if (n3<=4 || (n1 == 0 && n3 == 5)){
            ohms *= n3==5 ? 100 : n3==4 ? 10 : 1; 
            color_label = Integer.toString(ohms)+" kiloohms";
        }
        else if (n1 !=0 && n2 ==0 && n3==5){
            color_label = Integer.toString(n1)+" megaohms";
        }
        else if (n3<=7 || (n1 == 0 && n3 == 8)){
            ohms *= n3==8 ? 100 : n3==7 ? 10 : 1; 
            color_label = Integer.toString(ohms)+" megaohms";
        }
        else if (n1!=0 && n2 !=0 && n3== 8){
            ohms /= 10;
            color_label = Integer.toString(ohms)+" gigaohms";
        }
        else {
            color_label = Integer.toString(ohms)+" gigaohms";
        }
        return color_label;
    }
}
