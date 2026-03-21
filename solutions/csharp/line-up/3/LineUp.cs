public static class LineUp
{
    public static string Format(string name, int number)
    {
        int final_digit = number % 10;
        List<int> special = new List<int>{11,12,13};
        bool is_special = special.Contains(number%100);
        string suffix = "th";
        if (!is_special) {
            switch(final_digit)
            {
                case 1: 
                    suffix = "st";
                    break;
                case 2:
                    suffix = "nd";
                    break;
                case 3:
                    suffix = "rd";
                    break;
                default:
                    break;
            }
        }
       return $"{name}, you are the {number.ToString()}{suffix} customer we serve today. Thank you!";
    }
}
