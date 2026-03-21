public static class LineUp
{
    public static string Format(string name, int number)
    {
        int final_digit = number % 10;
        string suffix;
        switch(final_digit)
        {
            case 1: 
                suffix = number%100==11 ? "th" : "st";
                break;
            case 2:
                suffix = number%100==12 ? "th" : "nd";
                break;
            case 3:
                suffix = number%100==13 ? "th" : "rd";
                break;
            default:
                suffix = "th";
                break;
        }
       return name + ", you are the " + number.ToString() + suffix+" customer we serve today. Thank you!";
    }
}
