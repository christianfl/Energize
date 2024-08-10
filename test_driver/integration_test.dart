import 'dart:io';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (
        String screenshotName,
        List<int> screenshotBytes, [
        args,
      ]) async {
        final File image =
            await File('fastlane/metadata/android/$screenshotName.png')
                .create(recursive: true);
        image.writeAsBytesSync(screenshotBytes);
        return true;
      },
    );
  } catch (e) {
    // Error occured
  }
}
