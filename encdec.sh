#!/bin/bash

# Display menu options
echo "1) Encrypt a file"
echo "2) Decrypt a file"

# Prompt user for their choice
echo
read -p "Please select an option (1/2): " choice

# Process the user's choice
if [ $choice -eq 1 ]; then
    read -p "Enter the file name to encrypt: " input_file
    read -p "Enter the output file name: " encrypted_file
    read -p "Enter the public key file: " public_key
    echo
    openssl pkeyutl -encrypt -in $input_file -out $encrypted_file -inkey $public_key -pubin

elif [ $choice -eq 2 ]; then
    read -p "Enter the file name to decrypt: " encrypted_file
    read -p "Enter the output file name: " decrypted_file
    read -p "Enter the private key file: " private_key
    read -s -p "Enter the passphrase for $private_key: " passphrase
    echo
    openssl pkeyutl -decrypt -in $encrypted_file -out $decrypted_file -inkey $private_key -passin "pass:$passphrase"

else
    echo "Invalid selection"
fi
