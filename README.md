# Energize

Track your food and nutrition easily and fast. Still in early development.

See the [Privacy Policy](PRIVACY.md)

<p>

  [![Awesome Humane Tech](https://raw.githubusercontent.com/humanetech-community/awesome-humane-tech/main/humane-tech-badge.svg?sanitize=true)](https://github.com/humanetech-community/awesome-humane-tech)
  <a href="https://hosted.weblate.org/engage/energize/">
    <img src="https://hosted.weblate.org/widgets/energize/-/energize/svg-badge.svg" alt="Übersetzungsstatus" />
  </a>

</p>

<p align="center">
  <a href="https://epinez.codeberg.page/projects/energize/index.html"><img src="https://codeberg.org/epinez/pages/raw/branch/main/try_on_codeberg_pages.png" alt="Try it on Codeberg Pages" height="75"></a>
  <a href="https://f-droid.org/packages/com.flasskamp.energize"><img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" alt="Get it on F-Droid" height="75"></a>
  <a href="https://play.google.com/store/apps/details?id=com.flasskamp.energize"><img src="./docs/google-play-badge.png" alt="Get it on Google Play" height="75"></a>
</p>

<small>
Google Play is still in testing phase at the moment. Drop me a message and include your Gmail address to participate!
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
- Use several databases or create custom meals
  - Currently Open Food Facts, the Swiss Food Composition Database and USDA FoodData Central are supported
- Search meals by product name or just scan the EAN code
  - the EAN code of the first matching custom food will be used or
  - Open Food Facts will be searched if that database is activated and no matching custom food was found
- Get meal suggestions based on your last tracked meals
- Set targets for macro- and micronutrients including calculating them based on your personal details
- See your daily nutrition details
- Create an [encrypted backup](docs/backup-encryption/README.md) with WebDAV and restore it

## Build

This app is built with Flutter.

1. Download and setup flutter: https://flutter.dev/docs/get-started/install
2. Clone repository: `git clone https://codeberg.org/epinez/Energize.git && cd Energize`
3. Install dependencies: `flutter pub get`
4. Run build runner to generate types: `dart run build_runner build --delete-conflicting-outputs`
5. Build and install: `flutter run`

## Contribute

As this app is still in an early stage, a few things have still to be developed. The app is usable but sometimes has rough edges. If you want to be a tester on Google Play, feel free to write me a message and include your Gmail-address.

At this development stage you are very welcome to:

- Create issues for things not working as intended
- Help translating via Weblate: &nbsp; <a href="https://hosted.weblate.org/engage/energize/">
  <img src="https://hosted.weblate.org/widgets/energize/-/energize/svg-badge.svg" alt="Übersetzungsstatus" />
</a>
- Make feature requests (However, they are probably low priority right now)

## Donate 

If you want to support the development by a donation, you are very welcome to do so! Creating this app is a lot of fun but also a very time consuming task and sometimes leads to little frustration :-).


<a href="https://liberapay.com/epinez/donate">
  <img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg">
</a>
  
<b>BTC: 35DcbAwi66LDyvxfpmvxVrM7nYrrZVC59k</b>

## Release preparations

1. Make sure to match the version number in:

- `pubspec.yaml`
- `lib/pages/tab_settings/about_sub_page.dart`
- `lib/services/food_database_bindings/open_food_facts/open_food_facts_binding.dart`

2. Compile with `flutter build apk`
3. Don't forget changelogs!

---

© 2023 Christian Flaßkamp – energize@flasskamp.com