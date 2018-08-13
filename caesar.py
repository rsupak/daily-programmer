import sys

def main():
    if len(sys.argv) != 2:
        print("missing command-line argument")
        sys.exit(1)

    key = int(sys.argv[1])

    if key < 0:
        print("command-line argument must be a positive integer")
        sys.exit(-1)

    else:
        s = input("plaintext: ")
        get_cipher(s, key)
        sys.exit(0)


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


main()