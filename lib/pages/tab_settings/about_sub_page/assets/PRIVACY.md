# Privacy Policy

_Last update: December 23, 2024_
_Reason: Corrected spelling mistakes._

> Currently only available in English.

This app is designed to be privacy-friendly. It stores the processed data on the user's device. It uses the network connection in these cases:

## 1. The user has not opted out for Open Food Facts database use and searches for food
## 2. The user has not opted out for Open Food Facts database use and scans a barcode

In case 1 and 2, the following data is transmitted to the Open Food Facts service:

- the device's external IP-address (for technical reasons)
- the app name and version (due to terms of Open Food Facts)
- the search string (barcode or product name)

**Further information about Open Food Facts**

- Legal: https://world.openfoodfacts.org/legal
- Terms of use: https://world.openfoodfacts.org/terms-of-use

## 3. The user has not opted out for USDA FoodData Central database use and searches for food

In this case the following data is transmitted to the USDA:

- the device's external IP-address (for technical reasons)
- an API key which identifies the request came from the Energize app; it is the same key for all app users.
- the search string (searched product name)

### Further information

The privacy policy (not specific to the FoodData Central database but the USDA in total) is available at: https://www.usda.gov/privacy-policy

## 4. The user has set a remote WebDAV target for backups and tried to connect to it or uploaded an encrypted backup

In this case the following data is transmitted to the custom server:

- the device's external IP-address (for technical reasons)
- the authentication data for the custom server (username and password)
- the [encrypted backup](https://codeberg.org/epinez/Energize/src/branch/main/docs/backup-encryption/README.md) file

Please note that there is no default WebDAV-server configured at the moment, which means that you or your configured provider is fully responsible for processing the data.