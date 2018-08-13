import os
import sys


def get_cipher(string, distance):
    temp_array = []
    str_array = []

    if string != None:
        for char in string:
            str_array.append(char)
        for letter in str_array:
            if letter.islower() and (ord(letter) + distance > ord('z')):
                temp_array.append(chr((ord(letter) + distance - ord('z')) % 26 + ord('a') - 1))
            elif letter.isupper() and (ord(letter) + distance > ord('Z')):
                temp_array.append(chr((ord(letter) + distance - ord('Z')) % 26 + ord('A') - 1))
            elif letter.isalpha():
                temp_array.append(chr(ord(letter) + distance))
            else:
                temp_array.append(letter)
    ciphertext = ''.join(temp_array)
    return ciphertext


def create_encrypted_file():
    path = '.'
    dir = os.listdir(path)
    file = input("Please enter the name of the text file: (Ex. 'text.txt')>> ")
    if file not in dir:
        print("{} is not in the current directory.".format(file))
        print("Terminating connection.")
        sys.exit(-1)
    else:
        read_file = open(file, "r")
        write_file = open(file[:-4]+ "-encrypted.txt", "w")
        plain_text = read_file.read()
        distance = int(input("distance: >> "))

        cipher = get_cipher(plain_text, distance)
        write_file.write(cipher)

        write_file.close()
        read_file.close()


def main():
    create_encrypted_file()
    

if __name__ == '__main__':
    main()