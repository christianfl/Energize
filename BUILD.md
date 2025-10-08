# Build Energize

This will guide you how to build Energize on the supported platforms.

## Base instructions

This app is built with Flutter. You can get the current used SDK version under [submodules/flutter](submodules/flutter); this is also used to pin the correct Flutter dependency for automated F-Droid and Codeberg Pages builds on new versions (tags).

1. Download and setup flutter: https://flutter.dev/docs/get-started/install
2. Clone repository: `git clone https://codeberg.org/epinez/Energize.git && cd Energize`
3. Create environment file: `cp .env.example .env` and adapt name, URLs, API-Key
4. Install dependencies: `flutter pub get`
5. Run build runner to generate types: `dart run build_runner build --delete-conflicting-outputs`
6. Build and install: `flutter run`

## Platforms

Supported platforms:

- Android
- Web
- Linux

### Android

Prerequisites: See [Set up Android development](https://docs.flutter.dev/platform-integration/android/setup)

Build:

```bash
flutter build apk --split-per-abi [--debug]
```

This results in three APK files:

- ./build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk
- ./build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
- ./build/app/outputs/flutter-apk/app-x86_64-release.apk

### Web

```bash
flutter build web [--debug]
```

#### Known limitations

The Web build currently has the following known limitations:

- No barcode scanning
- OpenFoodFacts won't work
- No local file backup/restore

### Linux

Prerequisites: See [Set up Linux development](https://docs.flutter.dev/platform-integration/linux/setup)

Build:

```bash
flutter build linux [--debug]
```

#### Known limitations

The Linux build currently has the following known limitations:

- No barcode scanning (see [Flutter#41710](https://github.com/flutter/flutter/issues/41710))

#### Flatpak

The linux build depends on sqlite. Furthermore, a few arch specific settings have to be set. Flatpak helps with providing everything which is needed to just install and run Energize on Linux. The manifest references prebuild binaries which will be downloaded during build.

Build (aarch64):

```bash
flatpak-builder --arch=aarch64 --repo=repo-aarch64 --force-clean build-aarch64 flatpak/com.flasskamp.Energize.json
```

Create bundle (aarch64):

```bash
flatpak build-bundle repo-aarch64 energize-aarch64.flatpak com.flasskamp.Energize --arch=aarch64
```

Install on host (aarch64):

```bash
flatpak install energize-aarch64.flatpak
```

See [here](https://codeberg.org/epinez/Energize/wiki/Build) for more information about how to build for different target architectures.