def abbreviate(words):
    out = ""
    for i in range(0,len(words)):
        if i==0 or words[i-1].isspace() or words[i-1] in {'_','-'}:
            if words[i].isalpha():
                out += words[i].upper()
    return out