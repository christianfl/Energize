# Energize

Update from 6. January, 2025:

> ⚠️ Energize transitioned to the AGPLv3 license. The last commit which had its code licensed under GPLv3 is `763dc8f7b5`. You may have a look at [general reasons for switching to AGPL](https://www.gnu.org/licenses/why-affero-gpl.html.en).

[![Translation status](https://hosted.weblate.org/widgets/energize/-/energize/svg-badge.svg)](https://hosted.weblate.org/engage/energize/) [![Delightful Humane Tech](https://codeberg.org/teaserbot-labs/delightful-humane-design/raw/branch/main/humane-tech-badge.svg)](https://codeberg.org/teaserbot-labs/delightful-humane-design) [![F-Droid Version](https://img.shields.io/f-droid/v/com.flasskamp.energize?label=F-Droid&color=b1eb0b)](https://f-droid.org/de/packages/com.flasskamp.energize/) [![Codeberg Release](https://img.shields.io/gitea/v/release/epinez/Energize?gitea_url=https%3A%2F%2Fcodeberg.org&label=Codeberg%20Release%20APK&color=4793cc)](https://codeberg.org/epinez/Energize/releases)

<img src="./fastlane/metadata/android/en-US/images/featureGraphic.png" alt="Energize. Track your nutrition easily and fast.">

  - Energize is respecting the user's privacy. [🔒 Privacy policy](PRIVACY.md)
  - Community-moderated [[Matrix] room](https://matrix.to/#/%23energize:matrix.org)

<p align="center">
  <a href="https://epinez.codeberg.page/projects/energize/index.html"><img src="https://codeberg.org/epinez/pages/raw/branch/main/try_on_codeberg_pages.png" alt="Try it on Codeberg Pages" height="75"></a>
  <a href="https://f-droid.org/packages/com.flasskamp.energize"><img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" alt="Get it on F-Droid" height="75"></a>
  <a href="https://play.google.com/store/apps/details?id=com.flasskamp.energize"><img src="./docs/google-play-badge.png" alt="Get it on Google Play" height="75"></a>
  <a href="http://apps.obtainium.imranr.dev/redirect.html?r=obtainium://add/https://codeberg.org/epinez/Energize"><img src="./docs/badge_obtanium.png" alt="Get it on Obtanium" height="75"></a>
</p>

- Google Play is currently unavailable. I'm working on resolving the issue.

<br>

## Screenshots

<p align="center">
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/1_dark.png" width="24%"/>
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/2_dark.png" width="24%"/>
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/3_dark.png" width="24%"/>
  <img src="./fastlane/metadata/android/en-US/images/phoneScreenshots/4_dark.png" width="24%"/>
</p>

Screenshots are available in all supported languages [here](fastlane/metadata/android).

## Features

- Track your food including calories, macro- and micronutrients
  - (optional) Automatically group tracked food into meals
- Use several databases, including:
  - Open Food Facts
  - Swiss Food Composition Database
  - USDA FoodData Central
- Create custom food
- Search food by product name, barcode, or just scan the barcode
  - the barcode of the first matching custom food will be used or
  - Open Food Facts will be searched if that database is activated and no matching custom food was found
  - EAN, UPC, and custom barcodes for custom food are supported
- Get food suggestions based on your last tracked food
- Set targets for macro- and micronutrients including calculating them based on your personal details
- See your daily nutrition details
- Create an [encrypted backup](docs/backup-encryption/README.md) and restore it
  - Local and WebDAV backup are supported

## Build

This app is built with Flutter. You can get the current used SDK version under [submodules/flutter](submodules/flutter); this is also used to pin the correct Flutter dependency for automated F-Droid builds on new versions (tags).

1. Download and setup flutter: https://flutter.dev/docs/get-started/install
2. Clone repository: `git clone https://codeberg.org/epinez/Energize.git && cd Energize`
3. Install dependencies: `flutter pub get`
4. Run build runner to generate types: `dart run build_runner build --delete-conflicting-outputs`
5. Build and install: `flutter run`

## Test

### Unit and Widget tests

Run those with:

```bash
flutter test
```

### Integration tests

Currently there are only integration tests for automated screenshot creation. The integration tests automatically create different screenshots using all supported locales with dark and light theme.

Run those with:

```bash
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```

This saves the screenshots to: `fastlane/metadata/android/<locale>/images/phoneScreenshots/<number>_<theme>.png`

## Contribute

Energize has already benefited incredibly from many contributors. It would be great if this could continue or even be expanded in the future.

You are very welcome to:

- Help translating via Weblate

<a href="https://hosted.weblate.org/engage/energize/">
<img src="https://hosted.weblate.org/widget/energize/energize/multi-auto.svg" alt="Übersetzungsstatus" />
</a>

- Create issues for
  - things not working as intended
  - feature requests

  Please have a look whether similar issues already exist in advance.

- Develop something
  - There is no written roadmap yet
    - [milestones](https://codeberg.org/epinez/Energize/milestones) are an indicator
    - Open issues could also be used as a reference
  - There are no code style guidelines in place, hopefully the [linter rules](https://codeberg.org/epinez/Energize/src/branch/main/analysis_options.yaml) can assist
  - Using [Conventional Commits](https://www.conventionalcommits.org) for PRs would be wonderful
  - it's easier to reach out in advance if you want something to be merged later 😊

- Write tests
  - [Unit Tests](./test/unit_tests/)
  - [Widget Tests](./test/widget_tests/)
  - [Integration Tests](./integration_test/)

  Writing tests is a very important task to ensure we all get a (mostly) bug-free experience!

- Create art: It's both beautiful and motivational

  <img src="assets/mondstern/mondstern_acryl_energize.jpg" width="20%" alt="acrylic picture of Energize by mondstern">

  [Acrylic picture by mondstern](https://codeberg.org/AcrylicIcons/pictures) (CC BY-SA 4.0)


- If you have other ideas about how you'd like to contribute, just reach out on Matrix or via mail

## Donate

If you want to support the development by a donation, you are very welcome to do so. Creating this app is a lot of fun but also a very time consuming task. Your donation helps to fill my coffee pot and makes sure my protein bars are filled up.

[![Donate using Liberapay](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/epinez/donate)

**BTC: 35DcbAwi66LDyvxfpmvxVrM7nYrrZVC59k**

## Documentation

If there are any further questions, you may have a look at the [docs](docs/README.md).

---

© Christian Flaßkamp – energize@flasskamp.com
