# Backup Encryption

## General

- The backup file is encrypted with AES-256 in CTR mode.
- On each backup, a new random IV is used
- Standard file is named `backup.json.aes`

## Code

Energize uses the https://pub.dev/packages/encrypt library for implementing encryption.

## Output file format

`<base64-iv><base64-ciphertext>`

## Decryption

Have a look at [decrypt.sh](decrypt.sh). It's a bash script using standard OpenSSL to decrypt a backup made with Energize. You will get plain JSON!

## Contact

In case of any security-related issues, please contact me via energize@flasskamp.com. Thanks!