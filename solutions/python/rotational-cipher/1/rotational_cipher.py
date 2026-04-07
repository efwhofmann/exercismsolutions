def rotate(text, key):
    result =""
    for ch in text:
        if not ch.isalpha():
            result += ch
        else:
            new_ord = ord(ch) + (key%26)
            if (ch.isupper() and new_ord > ord('Z')) or (ch.islower() and new_ord > ord('z')):
                new_ord -= 26
            result += chr(new_ord)
    return result
            
