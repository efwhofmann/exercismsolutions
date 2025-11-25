import re

def count_words(sentence):
    tokens = re.sub(r"\s|[^a-z0-9']|'\B|\B'", r" ",sentence.lower()).split()
    word_counts = {}
    for word in tokens:
        known_words = word_counts.keys()
        if word not in known_words:
            word_counts[word] = 1
        else:
            word_counts[word] += 1
    return word_counts      