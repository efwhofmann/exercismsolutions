numbers = ["ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "one", "no"]

def recite(start, take=1):
    song = []
    for idx in range(10-start, 10-start+take):
        btl_ps = "bottle"
        if idx!=9:
            btl_ps +="s"
        btl_ps_next = "bottle"
        if idx!=8:
            btl_ps_next += "s"
        number1 = numbers[idx].capitalize()
        number2 = numbers[idx+1]
        song.extend(
            ["{0} green {1} hanging on the wall,".format(number1, btl_ps), "{0} green {1} hanging on the wall,".format(number1, btl_ps),
            "And if one green bottle should accidentally fall,",
            "There'll be {} green {} hanging on the wall.".format(number2, btl_ps_next)])
        if take!=1 and idx!=9-start+take:
            song.append("")
    return song
           
