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

```bash
flutter build linux [--debug]
```

#### Known limitations

The Linux build currently has the following known limitations:

- No barcode scanning
- No local file backup/restore

#### Flatpak

The linux build depends on sqlite. Furthermore, a few arch specific settings have to be set. Flatpak helps with providing everything which is needed to just install and run Energize on Linux. The manifest references prebuild binaries which will be downloaded during build.

Build (AARCH64):

```bash
flatpak-builder --arch=aarch64 --repo=repo-aarch64 --force-clean build-aarch64 flatpak/com.flasskamp.Energize.json
```

Create bundle (AARCH64):

```bash
flatpak build-bundle repo-aarch64 energize-aarch64.flatpak com.flasskamp.Energize --arch=aarch64
```

Install on host (AARCH64):

```bash
flatpak install energize-aarch64.flatpak
```

#### AARCH64 build

Flutter does not provide any possibilities to cross-compile. Hence an AARCH64 build has to be created on an AARCH64 machine. To compile on an x86-64 computer, a virtual machine can be used.

Install necessary dependencies:

```bash
sudo dnf install libvirt virt-install qemu-system-aarch64 # Fedora
sudo apt install virtinst qemu-system-aarch64 # Debian
```

Create virtual disk (20 GB):

```bash
sudo fallocate -l 20G /var/lib/libvirt/images/debian-12-arm64-vm.img
```

Download and install the VM:

```bash
sudo virt-install \
  --name debian-12-arm64-vm \
  --arch aarch64 \
  --machine virt \
  --os-variant debian12 \
  --ram 4096 \
  --vcpus 4 \
  --import \
  --disk /var/lib/libvirt/images/debian-12-arm64-vm.img,bus=virtio \
  --graphics none \
  --network user,model=virtio \
  --features acpi=off \
  --boot uefi \
  --location https://deb.debian.org/debian/dists/bookworm/main/installer-arm64/
```

Just go through the setup process. You don’t have to make special configurations.

After installation, forward the guest's SSH port to the host to access the VM via SSH:

```bash
sudo virsh qemu-monitor-command --hmp debian-12-arm64-vm 'hostfwd_add ::2222-:22'
```

Connect via SSH:

```bash
ssh -p 2222 <username>@localhost
```

You can then proceed as usual to build the Linux AARCH64 variant.