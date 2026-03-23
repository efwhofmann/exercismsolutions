public static class ResistorColorDuo
{
    public static int Value(string[] colors)
    {
        var color_to_val = new Dictionary<string, int>{
            ["black"] = 0,
            ["brown"] = 1,
            ["red"] = 2,
            ["orange"] = 3,
            ["yellow"] = 4,
            ["green"] = 5,
            ["blue"] = 6,
            ["violet"] = 7,
            ["grey"] = 8,
            ["white"] = 9
        };
        return 10*color_to_val[colors[0]] +                     color_to_val[colors[1]];
    }
}
