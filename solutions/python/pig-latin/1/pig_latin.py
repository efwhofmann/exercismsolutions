import re

def piggy_word(word):
    vowel_pattern = re.compile('^([aeiou]|yt|xr)(\w*)')
    consonant_patterns = [ re.compile('^([^aeiou]*qu)(\w*)'),
                           re.compile('^([^aeiou]+)(y\w*)'), 
                           re.compile('^([^aeiou]+)(\w*)') ]
    if vowel_pattern.match(word):
        return word+'ay'
    for pat in consonant_patterns:
        m = pat.match(word)
        if m:
            return m.groups()[-1] + m.groups()[0] + 'ay'
    

def translate(text):
    return " ".join([piggy_word(word) for word in text.split()]) 