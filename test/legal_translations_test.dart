import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stelinda/ui/screens/legal_document_screen.dart';

/// Yasal metnin çevirileri Türkçenin birebir karşılığı: Türkçeye bölüm ya da
/// madde eklenip çeviri unutulursa bu test düşer.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ({int sections, int bullets}) shape(String text) => (
        sections: RegExp(r'^## ', multiLine: true).allMatches(text).length,
        bullets: RegExp(r'^- ', multiLine: true).allMatches(text).length,
      );

  for (final document in LegalDocument.values) {
    test('${document.name}: çeviriler Türkçeyle aynı yapıda', () async {
      final turkish = shape(await rootBundle.loadString(document.asset));
      for (final language in ['en', 'sq']) {
        final translated =
            shape(await rootBundle.loadString(document.assetFor(language)));
        expect(translated, turkish, reason: language);
      }
    });
  }
}
