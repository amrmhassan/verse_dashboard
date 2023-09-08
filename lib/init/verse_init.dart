import 'package:frontend/package/features/core/verse_setup.dart';

class VerseInit {
  static Future<void> init() async {
    return VerseSetup(
      baseUrl: 'http://localhost:3001',
      checkServer: true,
    ).initialize();
  }
}
