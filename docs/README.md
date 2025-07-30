# Docs

Some documentation for Energize.

## Encryption

- The data on the device is stored:
    - within an unencrypted SQlite database
    - partly with unencrypted SharedPreferences
- Backups (local or WebDAV) are always [encrypted](backup-encryption/README.md)

## Update offline data

Some data in Energize is stored on the device. These can partly be updated using scripts.

- The Swiss Food Composition Database can be updated via [`update_sfcd_data.py`](../scripts/update_sfcd_data/update_sfcd_data.py)
- No automation is in place for [`dge_data.dart`](../lib/services/micronutrients_recommendations/dge_data.dart), yet

## Release preparations

Some things to keep in mind when creating releases.

1. Create changelog: `./scripts/create_changelog/create_changelog.py` and modify it
2. Update per-app locales: `./scripts/update_locales_config/update_locales_config.py`
3. Copy current privacy policy in the corresponding assets folder: `cp PRIVACY.md lib/pages/tab_settings/about_sub_page/assets/`
4. Change version number in: `pubspec.yaml`
5. Run build runner to generate types: `dart run build_runner build --delete-conflicting-outputs`
6. Ensure all tests pass: `flutter test`
7. Compile with `flutter build apk --split-per-abi`
8. Generate screenshots: `flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart`
9. Short manual test and release