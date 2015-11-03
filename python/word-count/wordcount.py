
def word_count(sentence):
    result = {}
    for word in sentence.lower().split():
        result[word] = result.get(word, 0) + 1
    return result
