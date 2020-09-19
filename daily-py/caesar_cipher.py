def get_cipher(s, key):
    temp_array = []
    str_array = []

    if s != None:
        for char in s:
            str_array.append(char)
        for i in str_array:
            if i.islower() and (ord(i) + key > ord('z')):
                temp_array.append(chr((ord(i) + key - ord('z')) % 26 + ord('a') - 1))
            elif i.isupper() and (ord(i) + key > ord('Z')):
                temp_array.append(chr((ord(i) + key - ord('Z')) % 26 + ord('A') - 1))
            elif i.isalpha():
                temp_array.append(chr(ord(i) + key))
            else:
                temp_array.append(i)
    ciphertext = ''.join(temp_array)
    print(f"ciphertext: {ciphertext}")

s = "Hello, My Name Is..."
get_cipher(s, 13)
