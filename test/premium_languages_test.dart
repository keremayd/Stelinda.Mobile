import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stelinda/l10n/l10n.dart';
import 'package:stelinda/ui/screens/premium_screen.dart';

import 'helpers/preview_fonts.dart';

/// Premium tablosu her dilde kaydırmadan sığar: başlık, alt yazı ve üç satır
/// düğmenin üstünde kalır. Arnavutçada uzun metinler son satırı düğmenin
/// altına itiyordu (25 Kas 2026, kullanıcı). `PREMIUM_CAPTURE=true` her dil
/// için görüntü üretir.
final _capture = Platform.environment['PREMIUM_CAPTURE'] == 'true';

const _offer = PremiumOffer(
  yearlyPrice: '899,99 TL',
  yearlyPerMonth: '75 TL',
  monthlyPrice: '149,99 TL',
  yearlySavingPercent: 50,
);

void main() {
  setUpAll(loadPreviewFonts);

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('${locale.languageCode}: tablo kaydırmadan sığar',
        (tester) async {
      // iPhone 17 (402 × 874 pt) ve küçük iPhone (375 × 667) dışında kalan
      // en yaygın boy; tasarım bu boyda tek ekran.
      tester.view.physicalSize = const Size(402, 874);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final l10n = lookupAppLocalizations(locale);
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: ThemeData(platform: TargetPlatform.iOS),
        home: PremiumScreen(
          offer: _offer,
          onPurchase: (_) {},
          onRestore: () {},
          onTerms: () {},
          onPrivacy: () {},
          onClose: () {},
        ),
      ));
      await tester.pump(const Duration(milliseconds: 100));

      final button = tester.getRect(find.text(l10n.actionContinue));
      for (final label in [
        l10n.premiumAllContent,
        l10n.premiumUnlimitedTickets,
        l10n.premiumWeeklyFreezes,
      ]) {
        final row = tester.getRect(find.text(label));
        expect(row.bottom, lessThan(button.top), reason: label);
        // Etiket tek satır: iki satıra kayan etiket tabloyu uzatıyordu.
        expect(row.height, lessThan(30 * 402 / 750 * 1.25 * 1.5),
            reason: label);
      }
      expect(tester.takeException(), isNull);

      if (_capture) {
        await expectLater(
          find.byType(PremiumScreen),
          matchesGoldenFile('goldens/premium_tablo_${locale.languageCode}.png'),
        );
      }
    });
  }
}
