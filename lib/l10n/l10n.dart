import 'package:flutter/widgets.dart';

import 'app_language.dart';
import 'app_localizations.dart';

export 'app_localizations.dart';

/// Arayüz metinlerine kısa yol: `context.l10n.pathReview`.
///
/// Metinler `lib/l10n/*.arb` dosyalarında; kaynak Türkçe (`app_tr.arb`),
/// her anahtar önce oraya yazılır. Dil seçimi `AppLanguage`.
extension AppLocalizationsContext on BuildContext {
  /// Ekranın dilindeki metinler. Yerelleştirme kurulmamış bir ağaçta
  /// (önizleme testleri `MaterialApp`'i delegesiz kuruyor) Türkçe döner;
  /// böylece testler ve golden'lar değişmeden çalışır.
  AppLocalizations get l10n =>
      Localizations.of<AppLocalizations>(this, AppLocalizations) ??
      turkishLocalizations;
}

/// Bağlamı olmayan yerler için seçili dilin metinleri (bildirimler, ağ
/// hataları): dil widget ağacının dışında [AppLanguage.current]'ta.
AppLocalizations get currentL10n =>
    lookupAppLocalizations(Locale(AppLanguage.current));

/// Bağlamı olmayan yerler ve testler için kaynak dil.
final AppLocalizations turkishLocalizations =
    lookupAppLocalizations(const Locale('tr'));

/// Çevrilmiş cümlenin içindeki bir parçayı ayrı biçimle yazmak için:
/// cümle [part]'ın etrafından bölünür, parçanın yerine [partSpan] konur.
/// Diller kelime sırasında ayrışıyor ("Kosmoz Ligi'ne 4 puan kaldı" ·
/// "4 points to Cosmos League"); cümleyi kodda parçalara bölmek bir dilde
/// yanlış sıra verirdi. Parça cümlede yoksa cümle olduğu gibi döner.
List<InlineSpan> spansAround(
  String sentence,
  String part,
  InlineSpan partSpan,
) {
  final at = sentence.indexOf(part);
  if (at < 0) return [TextSpan(text: sentence)];
  return [
    if (at > 0) TextSpan(text: sentence.substring(0, at)),
    partSpan,
    if (at + part.length < sentence.length)
      TextSpan(text: sentence.substring(at + part.length)),
  ];
}
