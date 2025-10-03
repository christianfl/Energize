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

### Reproducible build notes

At the moment, the app releases are built locally and no CI is present. Reproducible builds are in the works; these hints may help:

- See the [F-Droid Build Metadata](https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/com.flasskamp.energize.yml#L501-506) to exactly recreate the necessary `.env` file as in the Codeberg release
- The repository path should match `/var/home/christian/Development/Codeberg/Energize` on the build machine

### Steps

1. Create changelog: `./scripts/create_changelog/create_changelog.py` and modify it
2. Update per-app locales: `./scripts/update_locales_config/update_locales_config.py`
3. Copy current privacy policy in the corresponding assets folder: `cp PRIVACY.md lib/pages/tab_settings/about_sub_page/assets/`
4. Change version number in: `pubspec.yaml`
5. Run build runner to generate types: `dart run build_runner build --delete-conflicting-outputs`
6. Ensure all tests pass: `flutter test`
7. Run `flutter clean` and `flutter pub get`
8. Compile with `flutter build apk --split-per-abi`
9. Short manual test
10. Generate screenshots: `flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart`
11. Commit changes as `Update version to vX.X.X`, tag and push release: `git tag vX.X.X` and `git push origin vX.X.X`
12. Compile again with `flutter build apk --split-per-abi`