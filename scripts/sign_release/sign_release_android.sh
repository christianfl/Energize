#!/usr/bin/env bash

set -euo pipefail

if (( $# != 1 )); then
  echo "Usage: $0 /path/to/key.properties"
  exit 1
fi

KEY_PROPERTIES="$(realpath "$1")"
KEY_PROPERTIES_DIR="$(dirname "$KEY_PROPERTIES")"

if [[ ! -f "$KEY_PROPERTIES" ]]; then
  echo "ERROR: key.properties not found: $KEY_PROPERTIES"
  exit 1
fi

read_property() {
  local key="$1"
  local value

  value="$(sed -n -e "s/^[[:space:]]*${key}[[:space:]]*=[[:space:]]*//p" "$KEY_PROPERTIES" | tail -n 1)"

  if [[ -z "$value" ]]; then
    echo "ERROR: Missing property '$key' in $KEY_PROPERTIES" >&2
    exit 1
  fi

  printf '%s' "$value"
}

KEY_ALIAS="$(read_property keyAlias)"
KEY_PASSWORD="$(read_property keyPassword)"
STORE_FILE="$(read_property storeFile)"
STORE_PASSWORD="$(read_property storePassword)"

if [[ "$STORE_FILE" != /* ]]; then
  STORE_FILE="$KEY_PROPERTIES_DIR/$STORE_FILE"
fi

STORE_FILE="$(realpath "$STORE_FILE")"

if [[ ! -f "$STORE_FILE" ]]; then
  echo "ERROR: Keystore not found: $STORE_FILE"
  exit 1
fi

if [[ -z "${ANDROID_HOME:-}" ]]; then
  echo "ERROR: ANDROID_HOME is not set."
  exit 1
fi

BUILD_TOOLS="$(find "$ANDROID_HOME/build-tools" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort -V | tail -n 1)"

if [[ -z "$BUILD_TOOLS" ]]; then
  echo "ERROR: No Android SDK Build Tools found."
  exit 1
fi

ZIPALIGN="$ANDROID_HOME/build-tools/$BUILD_TOOLS/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/$BUILD_TOOLS/apksigner"

if [[ ! -x "$ZIPALIGN" || ! -x "$APKSIGNER" ]]; then
  echo "ERROR: zipalign or apksigner is unavailable."
  exit 1
fi

mkdir -p signed

shopt -s nullglob
apks=(app-*-release.apk)

if (( ${#apks[@]} == 0 )); then
  echo "ERROR: No app-*-release.apk files found."
  exit 1
fi

for apk in "${apks[@]}"; do
  filename="$(basename "$apk")"
  signed_apk="signed/$filename"

  echo "Checking alignment: $apk"
  "$ZIPALIGN" -c -P 16 -v 4 "$apk"

  echo "Signing: $apk"
  "$APKSIGNER" sign --ks "$STORE_FILE" --ks-key-alias "$KEY_ALIAS" --ks-pass "pass:$STORE_PASSWORD" --key-pass "pass:$KEY_PASSWORD" --out "$signed_apk" "$apk"

  echo "Verifying signature: $signed_apk"
  "$APKSIGNER" verify --verbose --print-certs "$signed_apk"

  sha1sum "$signed_apk" | awk '{print $1}' > "$signed_apk.sha1"
done

echo "Signed APKs and SHA-1 files are available in signed/"