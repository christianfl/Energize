#!/bin/bash

set -euo pipefail

# Ask for filename
IFS= read -r -p "Enter backup filename [backup.json.aes]: " filename_input

# Set default filename of "backup.json.aes"
filename_input=${filename_input:-backup.json.aes}

# Read backup file
crypted_backup=$(<"$filename_input")

# Ask for passphrase
IFS= read -r -p "Enter decryption passphrase: " key_input

# IV
iv_base64=${crypted_backup:0:24}
iv_hex=$(printf '%s' "$iv_base64" | openssl base64 -d -A | hexdump -ve '1/1 "%.2x"')
if [[ ${#iv_hex} -ne 32 ]]; then
    echo "Invalid backup IV" >&2
    exit 1
fi

# Ciphertext
ciphertext_base64=${crypted_backup:24}

# Save to file because bash can't handle binary
echo -n "$ciphertext_base64" > "${filename_input}_ciphertext_base64"
openssl base64 -d -A -in "${filename_input}_ciphertext_base64" -out "${filename_input}_ciphertext_binary"

# Key transformation
key=$(printf '%s' "$key_input" | openssl dgst -sha256 -r | sed 's/ .*//')

# Decrypt
decrypted=$(mktemp)
trap 'rm -f -- "$decrypted"' EXIT
openssl enc -aes-256-ctr -nosalt -d -in "${filename_input}_ciphertext_binary" -K "$key" -iv "$iv_hex" -out "$decrypted"

# Prepare output filename
output_file=${filename_input}_decrypted.txt

# Validate and remove Energize's PKCS#7 padding (OpenSSL CTR leaves it intact)
plaintext_size=$(wc -c < "$decrypted")
if (( plaintext_size == 0 || plaintext_size % 16 != 0 )); then
    echo "Invalid backup length" >&2
    exit 1
fi
last_block=$(tail -c 16 "$decrypted" | hexdump -ve '1/1 "%.2x"')
padding_size=$((16#${last_block:30:2}))
if (( padding_size < 1 || padding_size > 16 )); then
    echo "Invalid padding: incorrect passphrase or damaged backup" >&2
    exit 1
fi
for (( i = 32 - padding_size * 2; i < 32; i += 2 )); do
    if [[ "${last_block:i:2}" != "${last_block:30:2}" ]]; then
        echo "Invalid padding: incorrect passphrase or damaged backup" >&2
        exit 1
    fi
done
plaintext_size=$((plaintext_size - padding_size))

# Show decrypted backup
echo "################"
echo "#### OUTPUT ####"
echo "################"
echo ""
echo "It gets also saved to $output_file"
echo ""

head -c "$plaintext_size" "$decrypted"

# Save decrypted backup to <filename_input>_decrypted.txt
head -c "$plaintext_size" "$decrypted" > "$output_file"
