#!/bin/bash

set -euo pipefail

# Ask for filename
IFS= read -r -p "Enter backup filename [backup.json]: " filename_input

# Set default filename of "backup.json"
filename_input=${filename_input:-backup.json}

# Read backup file (keep plaintext bytes out of Bash variables)
plaintext=$(mktemp)
iv=$(mktemp)
trap 'rm -f -- "$plaintext" "$iv"' EXIT
cat -- "$filename_input" > "$plaintext"

# Ask for passphrase
IFS= read -r -p "Enter encryption passphrase: " key_input

# IV
openssl rand -out "$iv" 16
iv_base64=$(openssl base64 -A -in "$iv")
iv_hex=$(hexdump -ve '1/1 "%.2x"' "$iv")

# Add Energize's PKCS#7 padding (OpenSSL CTR does not add it)
plaintext_size=$(wc -c < "$plaintext")
padding_size=$((16 - plaintext_size % 16))
printf -v padding_byte '\\%03o' "$padding_size"
for (( i = 0; i < padding_size; i++ )); do
    printf '%b' "$padding_byte"
done >> "$plaintext"

# Key transformation
key=$(printf '%s' "$key_input" | openssl dgst -sha256 -r | sed 's/ .*//')

# Encrypt
ciphertext_base64=$(openssl enc -aes-256-ctr -nosalt -e -in "$plaintext" -K "$key" -iv "$iv_hex" -a -A)
encrypted="${iv_base64}${ciphertext_base64}"

# Prepare output filename
output_file=${filename_input}.aes

# Show encrypted backup
echo "################"
echo "#### OUTPUT ####"
echo "################"
echo ""
echo "It gets also saved to $output_file"
echo ""

echo "$encrypted"

# Save encrypted backup to <filename_input>.aes
printf '%s' "$encrypted" > "$output_file"
