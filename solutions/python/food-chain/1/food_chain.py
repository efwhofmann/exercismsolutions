line_one = "I know an old lady who swallowed a "
spider = " that wriggled and jiggled and tickled inside her."
line_end = "I don't know why she swallowed the fly. Perhaps she'll die."

animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
phrases =  ["",
        "It wriggled and jiggled and tickled inside her.", 
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"]

def verse(number):
    first_line = line_one + animals[number-1] + "."
    res = [first_line]
    if number==1:
        res += [line_end]
    else:
        res += [phrases[number-1]]
    if 1<number and number<8:
        for n in range(number-1,0,-1):
            line = "She swallowed the " + animals[n] + " to catch the " + animals[n-1]
            if n==2:
                line += spider
            else:
                line +="."            
            res +=  [line]
            if n==1:
                res += [line_end]
    return res      


def recite(start_verse, end_verse):
    result = []
    for k in range(start_verse, end_verse+1):
        result += verse(k)
        if k<end_verse:
            result += [""]
    return result 