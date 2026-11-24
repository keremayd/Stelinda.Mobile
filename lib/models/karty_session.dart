import 'package:stelinda/models/karty_path.dart';

/// Oyunun Karty Yolu'nda hangi adımdan açıldığı (`/kartyquiz` rota
/// argümanı). Yoksa oyun eski sonsuz akışta açılır (ör. Artikel'in kilitli
/// ekranından) ve özet gösterilmez.
class KartySessionArgs {
  const KartySessionArgs({
    required this.unit,
    this.deck,
    this.reviewCount = 0,
    this.reinforce = false,
  });

  /// Adımın ünitesi, oyun başındaki hâliyle: özetteki ünite çubuğu buradan
  /// başlar.
  final KartyUnit unit;

  /// Oynanacak deste; yalnız tekrar adımında null.
  final int? deck;

  /// Oyun başında vadesi gelmiş tekrar. Deste yokken bu da sıfırsa oyun
  /// baştan pratiktir: bitişi sunucu değil tur uzunluğu belirler.
  final int reviewCount;

  /// Ünitenin pekiştirme oyunu: kartlar ünitenin pekişmemiş kelimelerinden
  /// gelir, tur [reinforceRound] cevapla biter, doğru bilinen kelime pekişir.
  final bool reinforce;

  /// Pekiştirme turunun uzunluğu: bir bilet sekiz soru; ünitenin bütün
  /// pekiştirmesi tek girişte bitmez (kullanıcı, 24 Kas 2026).
  static const reinforceRound = 8;

  /// Bitişi sorulacak bir işi var mı.
  bool get hasWork => deck != null || reviewCount > 0 || reinforce;
}
