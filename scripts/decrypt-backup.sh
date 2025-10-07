#!/bin/bash

# Ask for filename
read -p "Enter backup filename [backup.json.aes]: " filename_input

# Set default filename of "backup.json.aes"
filename_input=${filename_input:-backup.json.aes}

# Read backup file
crypted_backup=$(<$filename_input)

# Ask for passphrase
read -p "Enter decryption passphrase: " key_input

# IV
iv_base64=${crypted_backup:0:24}
iv=$(echo -n "$iv_base64" | base64 --decode | tr '\0' '\n')
iv_hex=$(hexdump -ve '1/1 "%.2x"' <<< $iv)

# Ciphertext
ciphertext_base64=${crypted_backup:24}

# Save to file because bash can't handle binary
echo -n "$ciphertext_base64" > "${filename_input}_ciphertext_base64"
cat ${filename_input}_ciphertext_base64 | base64 --decode > ${filename_input}_ciphertext_binary

# Key transformation
key=$(openssl enc -aes-256-ctr -k $key_input -P -md sha256 -nosalt | grep key | sed 's/.*=//')

# Decrypt
decrypted=$(openssl enc -aes-256-ctr -nosalt -d -in ${filename_input}_ciphertext_binary -K $key -iv $iv_hex)

# Prepare output filename
output_file=${filename_input}_decrypted.txt

# Show decrypted backup
echo "################"
echo "#### OUTPUT ####"
echo "################"
echo ""
echo "It gets also saved to $output_file"
echo ""

echo "$decrypted"

# Save decrypted backup to <filename_input>_decrypted.txt
echo "$decrypted" > $output_file
