# Energize

[![Translation status](https://hosted.weblate.org/widgets/energize/-/energize/svg-badge.svg)](https://hosted.weblate.org/engage/energize/) [![Delightful Humane Tech](https://codeberg.org/teaserbot-labs/delightful-humane-design/raw/branch/main/humane-tech-badge.svg)](https://codeberg.org/teaserbot-labs/delightful-humane-design)

Track your food and nutrition easily and fast. Still in early development.

  - 🔒 [Privacy Policy](PRIVACY.md)
  - Community-moderated [[Matrix] room](https://matrix.to/#/%23energize:matrix.org)

<p align="center">
  <a href="https://epinez.codeberg.page/projects/energize/index.html"><img src="https://codeberg.org/epinez/pages/raw/branch/main/try_on_codeberg_pages.png" alt="Try it on Codeberg Pages" height="75"></a>
  <a href="https://f-droid.org/packages/com.flasskamp.energize"><img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" alt="Get it on F-Droid" height="75"></a>
  <a href="https://play.google.com/store/apps/details?id=com.flasskamp.energize"><img src="./docs/google-play-badge.png" alt="Get it on Google Play" height="75"></a>
</p>

<small>
Google Play is in closed beta at the moment. Feel free to drop me a message and include your Gmail address to participate. Google Play and Codeberg Pages may have outdated versions as there is no automation in place yet.
</small>

<br>

## Screenshots

<p align="center">
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/1.png" width="24%"/>
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/2.png" width="24%"/>
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/3.png" width="24%"/>
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/4.png" width="24%"/>
</p>

## Features

- Track your meals including calories, macro- and micronutrients
- Use several databases, including:
  - Open Food Facts
  - Swiss Food Composition Database
  - USDA FoodData Central
- Create custom meals
- Search meals by product name, EAN, or just scan the EAN code
  - the EAN code of the first matching custom food will be used or
  - Open Food Facts will be searched if that database is activated and no matching custom food was found
- Get meal suggestions based on your last tracked meals
- Set targets for macro- and micronutrients including calculating them based on your personal details
- See your daily nutrition details
- Create an [encrypted backup](docs/backup-encryption/README.md) with WebDAV and restore it

## Build

This app is built with Flutter. You can get the current used SDK version under [submodules/flutter](submodules/flutter); this is also used to pin the correct Flutter dependency for automated F-Droid builds on new versions (tags).

1. Download and setup flutter: https://flutter.dev/docs/get-started/install
2. Clone repository: `git clone https://codeberg.org/epinez/Energize.git && cd Energize`
3. Install dependencies: `flutter pub get`
4. Run build runner to generate types: `dart run build_runner build --delete-conflicting-outputs`
5. Build and install: `flutter run`

## Test

Testing is at an initial stage right now. The goal is to create integration tests which automatically create different screenshots using all supported locales.

Run integration tests:

```
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```

This currently only saves one screenshot to:

```
fastlane/metadata/android/en-US/images/phoneScreenshots/test.png
```

## Contribute

As this app is still in an early stage, a few things have still to be developed. The app is usable but sometimes has rough edges.

You are very welcome to:

- Help translating via Weblate: [![Translation status](https://hosted.weblate.org/widgets/energize/-/energize/svg-badge.svg)](https://hosted.weblate.org/engage/energize/)
- Create issues for
  - things not working as intended
  - feature requests

  Please have a look whether similar issues already exist in advance.
- Develop something
    - There is no written roadmap or code style guidelines yet
    - it's easier to reach out in advance if you want something to be merged later. :-)

## Donate

If you want to support the development by a donation, you are very welcome to do so! Creating this app is a lot of fun but also a very time consuming task and sometimes leads to little frustration...

[![Donate using Liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/epinez/donate)

**BTC: 35DcbAwi66LDyvxfpmvxVrM7nYrrZVC59k**

## Release preparations

1. Change the version number in: `pubspec.yaml`
2. Compile with `flutter build apk`
3. Don't forget changelogs!

---

© Christian Flaßkamp – energize@flasskamp.com
