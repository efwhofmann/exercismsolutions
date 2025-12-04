day_numbers = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

gifts = ["a Partridge in a Pear Tree.", "two Turtle Doves, ", "three French Hens, ", "four Calling Birds, ", "five Gold Rings, ", "six Geese-a-Laying, ", "seven Swans-a-Swimming, ", "eight Maids-a-Milking, ", "nine Ladies Dancing, ", "ten Lords-a-Leaping, ", "eleven Pipers Piping, ", "twelve Drummers Drumming, "]

def stanza(number):
    result = "On the " + day_numbers[number-1] + " day of Christmas my true love gave to me: "
    if number==1:
        result += gifts[0]
    else:
        for k in range(number-1,0,-1):
            result += gifts[k]
        result += "and " + gifts[0]
    return result
    
def recite(start_verse, end_verse):
    output = []
    for no in range(start_verse, end_verse+1):
        output.append(stanza(no))
    return output