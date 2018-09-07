vowels = ['a', 'e', 'i', 'o', 'u']

def vowel_count(word):
    count = 0
    for letter in word:
        if letter.lower() in vowels:
            count += 1
    return count

print(vowel_count('abcd')) # 1
print(vowel_count('color')) # 2
print(vowel_count('colour')) # 3
print(vowel_count('cecilia')) # 4