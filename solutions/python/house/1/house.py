objects = ["the house that Jack built.", "the malt", "the rat", "the cat", "the dog", "the cow with the crumpled horn", "the maiden all forlorn", "the man all tattered and torn", "the priest all shaven and shorn", "the rooster that crowed in the morn", "the farmer sowing his corn","the horse and the hound and the horn"]

verbs = ["that lay in", "that ate", "that killed", "that worried", "that tossed", "that milked", "that kissed", "that married", "that woke", "that kept", "that belonged to"]

intro = "This is"

def build_verse(no):
    verse = intro
    for idx in range(no-1,-1,-1):
        verse += " " + objects[idx]
        if idx!=0:
            verse += " " + verbs[idx-1]
    return verse
        

def recite(start_verse, end_verse):
    output = []
    for no in range(start_verse,end_verse+1):
        output.append(build_verse(no))
    return output  
