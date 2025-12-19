import java.util.Map;

class ResistorColorDuo {

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
    
    int value(String[] colors) {
        return 10*ccodeMap.get(colors[0])+ccodeMap.get(colors[1]);
    }
}
