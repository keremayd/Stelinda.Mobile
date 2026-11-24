import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stelinda/l10n/l10n.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:stelinda/ui/widgets/Buttons/depth_pressable_button.dart';
import 'package:stelinda/ui/widgets/clock_mark.dart';
import 'package:stelinda/ui/widgets/karty_unit_marks.dart';
import 'package:stelinda/ui/widgets/practice_station_marks.dart';
import 'package:stelinda/ui/widgets/quest_icons.dart';

/// Patikadaki adım türleri: her birinin ilk oyunundan önce bir kez ne işe
/// yaradığını söyleyen kart çıkar (24 Kas 2026, kullanıcı: "uygulamaya
/// katılan biri ne rövanştan anlayacak ne desteden ne de artikel adımının
/// ne işe yaradığından"). Tanıtım turu yok: NN/g ölçümünde tanıtım ekranları
/// görevi kolaylaştırmıyor; açıklama, kullanıcı o özelliğe vardığı an gelir.
enum StepIntroKind { deck, article, reinforce, review }

/// Testler için: null değilse depolama okunmaz; true kart gösterilmez,
/// false her seferinde gösterilir. `test/flutter_test_config.dart` true
/// yapar (testlerde depolama cevap vermiyor), kartı sınayan test false.
@visibleForTesting
bool? debugStepIntroSeenOverride;

/// Bu türün kartı daha önce gösterilmediyse gösterir. BAŞLA'ya basılırsa
/// (ya da kart zaten görülmüşse) true döner ve oyun açılır; kart kapatılırsa
/// false, oyun açılmaz ve kart bir dahaki sefer yine çıkar.
///
/// Görülme bilgisi cihazda. Okunamazsa kart gösterilmez: oyunun önüne
/// hiçbir şey geçmesin.
Future<bool> showStepIntroIfFirst(
  BuildContext context,
  StepIntroKind kind, {
  required double scale,
  int deckSize = 8,
  int unlockPercent = 80,
  FlutterSecureStorage storage = const FlutterSecureStorage(),
}) async {
  final key = 'stepIntroSeen.${kind.name}';
  final override = debugStepIntroSeenOverride;
  if (override == true) return true;
  try {
    if (override == null &&
        await storage.read(key: key).timeout(const Duration(seconds: 2)) !=
            null) {
      return true;
    }
  } catch (error) {
    if (kDebugMode) debugPrint('Adım kartı bilgisi okunamadı: $error');
    return true;
  }
  if (!context.mounted) return false;

  final started = await showModalBottomSheet<bool>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    isScrollControlled: true,
    builder: (sheetContext) => StepIntroCard(
      kind: kind,
      scale: scale,
      deckSize: deckSize,
      unlockPercent: unlockPercent,
      onStart: () => Navigator.of(sheetContext).pop(true),
    ),
  );
  if (started != true) return false;
  if (override != null) return true;
  try {
    await storage.write(key: key, value: '1');
  } catch (error) {
    if (kDebugMode) debugPrint('Adım kartı bilgisi yazılamadı: $error');
  }
  return true;
}

/// Adım penceresinin (`KartyStepSheet`) kalıbında açıklama kartı: tutamak,
/// karo + başlık + işini söyleyen kısa satır, en çok beş kelimelik iki madde
/// (kullanıcı: "yazılar fazla, okumak yorucu"), BAŞLA. Maddelerin simgesi
/// karodaki simgeyi tekrarlamaz (kullanıcı).
class StepIntroCard extends StatelessWidget {
  const StepIntroCard({
    super.key,
    required this.kind,
    required this.scale,
    required this.onStart,
    this.deckSize = 8,
    this.unlockPercent = 80,
  });

  final StepIntroKind kind;
  final double scale;
  final VoidCallback onStart;
  final int deckSize;
  final int unlockPercent;

  static const _bg = Color(0xFF041227);
  static const _panel = Color(0xFF0B2143);
  static const _raised = Color(0xFF163258);
  static const _accent = Color(0xFF1CB1F5);
  static const _accentDepth = Color(0xFF1B84B5);
  static const _value = Color(0xFFE9EEF5);

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final l10n = context.l10n;
    final radius = Radius.circular(56 * s);
    final (title, tagline, rows) = switch (kind) {
      StepIntroKind.deck => (
          l10n.introDeckTitle,
          l10n.introDeckTagline(deckSize),
          [
            (_Mark.book, l10n.introDeckRow1),
            (_Mark.check, l10n.introDeckRow2),
          ],
        ),
      StepIntroKind.article => (
          l10n.pathArticle,
          l10n.pathArticleDetail,
          [
            (_Mark.genders, l10n.introArticleRow1),
            (_Mark.clock, l10n.introArticleRow2),
          ],
        ),
      StepIntroKind.reinforce => (
          l10n.pathReinforce,
          l10n.introReinforceTagline,
          [
            (_Mark.check, l10n.introReinforceRow1),
            (_Mark.lock, l10n.introReinforceRow2(unlockPercent)),
          ],
        ),
      StepIntroKind.review => (
          l10n.introReviewTitle,
          l10n.introReviewTagline,
          [
            (_Mark.wrong, l10n.introReviewRow1),
            (_Mark.check, l10n.introReviewRow2),
          ],
        ),
    };

    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          color: _panel,
          borderRadius: BorderRadius.vertical(top: radius),
        ),
        padding: EdgeInsets.only(top: 10 * s),
        child: Container(
          decoration: BoxDecoration(
            color: _bg,
            borderRadius: BorderRadius.vertical(top: radius),
          ),
          padding: EdgeInsets.fromLTRB(36 * s, 22 * s, 36 * s, 64 * s),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 96 * s,
                  height: 10 * s,
                  decoration: BoxDecoration(
                    color: _raised,
                    borderRadius: BorderRadius.circular(5 * s),
                  ),
                ),
              ),
              SizedBox(height: 34 * s),
              Row(
                children: [
                  _StepTile(kind: kind, width: 124 * s),
                  SizedBox(width: 26 * s),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 52 * s,
                            fontWeight: AppTypography.heading,
                            fontFamily: AppTypography.displayFamily,
                            height: 1.05,
                          ),
                        ),
                        SizedBox(height: 6 * s),
                        Text(
                          tagline,
                          style: TextStyle(
                            color: _accent,
                            fontSize: 27 * s,
                            fontWeight: AppTypography.label,
                            fontFamily: AppTypography.family,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36 * s),
              for (final (mark, text) in rows) ...[
                Row(
                  children: [
                    SizedBox(
                      width: 66 * s,
                      height: 66 * s,
                      child: Center(child: _markOf(mark, s)),
                    ),
                    SizedBox(width: 22 * s),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: _value,
                          fontSize: 30 * s,
                          fontWeight: AppTypography.body,
                          fontFamily: AppTypography.family,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26 * s),
              ],
              SizedBox(height: 22 * s),
              Semantics(
                button: true,
                label: l10n.stepIntroStart,
                excludeSemantics: true,
                child: DepthPressableButton(
                  width: 678 * s,
                  height: 112 * s,
                  radius: 26 * s,
                  shadowOffset: 12 * s,
                  backgroundColor: _accent,
                  shadowColor: _accentDepth,
                  fontSize: 30 * s,
                  onPressed: onStart,
                  child: Center(
                    child: Text(
                      l10n.stepIntroStart,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32 * s,
                        fontWeight: AppTypography.action,
                        fontFamily: AppTypography.family,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _markOf(_Mark mark, double s) => switch (mark) {
        _Mark.book => QuestIcon(questKey: 'learn_three', size: 50 * s),
        _Mark.check => QuestCheckMark(size: 44 * s),
        _Mark.clock => ClockMark(size: 48 * s),
        _Mark.genders => _GenderChips(size: 56 * s),
        _Mark.lock => KartyLockMark(size: 42 * s),
        _Mark.wrong => _WrongMark(size: 44 * s),
      };
}

enum _Mark { book, check, clock, genders, lock, wrong }

/// Kartın başındaki karo: patikadaki düğümün küçüğü, basılmaz. Deste,
/// Artikel ve Pekiştirme şu anki düğüm gibi accent mavi; Rövanş yan durak
/// gibi lacivert. Karo büyük: simge küçükte anlaşılmıyordu (kullanıcı).
class _StepTile extends StatelessWidget {
  const _StepTile({required this.kind, required this.width});

  final StepIntroKind kind;
  final double width;

  @override
  Widget build(BuildContext context) {
    final station = kind == StepIntroKind.review;
    final face = station ? StepIntroCard._raised : StepIntroCard._accent;
    final depth = station ? StepIntroCard._panel : StepIntroCard._accentDepth;
    final total = width * 0.92 + width * 0.14;
    final radius = BorderRadius.circular(width * 0.29);
    final icon = switch (kind) {
      StepIntroKind.deck =>
        QuestIcon(questKey: 'correct_five', size: width * 0.56),
      StepIntroKind.article => ArticleDragMark(size: width * 0.86),
      StepIntroKind.reinforce =>
        QuestIcon(questKey: 'review_two', size: width * 0.6),
      StepIntroKind.review => RevengeCardMark(size: width * 0.76),
    };
    return SizedBox(
      width: width,
      height: total,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: width * 0.92,
            child: DecoratedBox(
              decoration: BoxDecoration(color: depth, borderRadius: radius),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: width * 0.92,
            child: DecoratedBox(
              decoration: BoxDecoration(color: face, borderRadius: radius),
              child: Center(child: icon),
            ),
          ),
        ],
      ),
    );
  }
}

/// der, die, das: üç artikel renginde tombul kapsül (§2.5 reçetesi:
/// kalınlık bandı, yüz, sol üstte parlama).
class _GenderChips extends StatelessWidget {
  const _GenderChips({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size.square(size), painter: _GenderChipsPainter());
}

class _GenderChipsPainter extends CustomPainter {
  static const _chips = [
    (Color(0xFF1CB1F5), Color(0xFF0E6A98)),
    (Color(0xFFF52A2A), Color(0xFF9A1414)),
    (Color(0xFFFFB000), Color(0xFFC97800)),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final u = size.width / 100;
    for (final (i, (face, depth)) in _chips.indexed) {
      final chip = RRect.fromRectAndRadius(
        Rect.fromLTWH(6 * u, (8 + i * 30) * u, 88 * u, 22 * u),
        Radius.circular(11 * u),
      );
      canvas.drawRRect(chip.shift(Offset(0, 5 * u)), Paint()..color = depth);
      canvas.drawRRect(chip, Paint()..color = face);
      canvas.drawLine(
        Offset(16 * u, (13 + i * 30) * u),
        Offset(30 * u, (13 + i * 30) * u),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.5)
          ..strokeWidth = 4 * u
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Yanlış: Görevler'deki onay diskinin kırmızısı, içinde beyaz çarpı.
class _WrongMark extends StatelessWidget {
  const _WrongMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size.square(size), painter: _WrongPainter());
}

class _WrongPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final u = size.width / 100;
    final disc = Path()
      ..addOval(
        Rect.fromCircle(center: Offset(50 * u, 48 * u), radius: 44 * u),
      );
    canvas.drawPath(
      disc.shift(Offset(0, 7 * u)),
      Paint()..color = const Color(0xFF9A1414),
    );
    canvas.drawPath(disc, Paint()..color = const Color(0xFFF52A2A));
    final cross = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15 * u
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(34 * u, 32 * u), Offset(66 * u, 64 * u), cross);
    canvas.drawLine(Offset(66 * u, 32 * u), Offset(34 * u, 64 * u), cross);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Kartın ölçeği ekranın ölçeğiyle: genişliğin 750'de biri.
double stepIntroScale(BuildContext context) =>
    math.min(MediaQuery.sizeOf(context).width, 600) / 750;
