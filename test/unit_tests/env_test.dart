import 'package:energize/config/env_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await dotenv.load(fileName: '.env');
  });

  test('Ensure the current .env file has all required fields', () {
    expect(
      dotenv.isEveryDefined(requiredEnvVars),
      true,
      reason: 'Not all required env vars are set. Required: $requiredEnvVars',
    );
  });
}
