import 'package:flutter/foundation.dart';

/// Geliştirici araçları: girişte TEST GİRİŞİ, ana ekranda SERİ / AÇILIŞ /
/// PREMİUM, Görevler'de KUTLAMA, Ligler'de TERFİ, oyunda TEST · DOĞRU ve
/// köşedeki DEBUG şeridi. Yalnız debug derlemesinde açık; yayın derlemesinde
/// `kDebugMode` sabit `false` olduğu için kodlarıyla birlikte derlemeden düşer.
///
/// Uygulamayı debug'da yayındaki gibi görmek (mağaza görüntüsü, yerleşim
/// denetimi) için kapatılır:
///   flutter run --dart-define=STELINDA_DEV_TOOLS=false
const bool kDevTools = kDebugMode &&
    bool.fromEnvironment('STELINDA_DEV_TOOLS', defaultValue: true);
