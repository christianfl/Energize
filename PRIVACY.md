# Privacy Policy

This app is designed to be privacy-friendly. It stores the processed data on the user's device. It use the network connection in these cases:

## 1. The user has not opted out for Open Food Facts database use and searches for food
## 2. The user has not opted out for Open Food Facts database use and scans an EAN code

In such cases the following data is transmitted to the Open Food Facts service:

- the device's external IP-address (for technical reasons)
- the app name and version (due to terms of Open Food Facts)
- the search string (ean code or the searched product name)

**Further information about Open Food Facts**

- Legal: https://world.openfoodfacts.org/legal
- Terms of use: https://world.openfoodfacts.org/terms-of-use

## 3. The user has not opted out for USDA FoodData Central database use and searches for food

In this case the following data is transmitted to the USDA:

- the device's external IP-address (for technical reasons)
- an API key which itentifies the request came from the Energize app; it is the same key for all app users.
- the search string (searched product name)

**Further information about USDA**

- Privacy policy (not specific about the FoodData Central database but the USDA in total): https://www.usda.gov/privacy-policy

## 4. The user has set a remote WebDAV target for backups and tried to connect to it or uploaded an encrypted backup

In this case the following data is transmitted to the custom server:

- the device's external IP-address (for technical reasons)
- the [encrypted backup](docs/backup-encryption/README.md) file

Please note that there is no default WebDAV-server configured at the moment, which means that you or your configured provider is fully responsible for processing the data.