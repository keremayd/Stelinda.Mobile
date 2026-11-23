import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:stelinda/dev_tools.dart';
import 'package:stelinda/models/ApiResponse.dart';
import 'package:stelinda/models/Karty.dart';
import 'package:stelinda/models/karty_path.dart';
import 'package:stelinda/models/responses/GetKartyByScoreResponse.dart';
import 'package:stelinda/models/responses/LeagueProgressResponse.dart';
import 'package:stelinda/models/responses/ScoreWithLivesResponse.dart';
import 'package:stelinda/models/responses/UpdateScoreResponse.dart';
import 'package:stelinda/providers/KartyProvider.dart';
import 'package:stelinda/providers/ProfileLearningStatsProvider.dart';
import 'package:stelinda/providers/ScoreWithLivesProvider.dart';
import 'package:stelinda/services/GameFeedbackService.dart';
import 'package:stelinda/services/KartyService.dart';
import 'package:stelinda/services/PronunciationService.dart';
import 'package:stelinda/services/UserService.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:stelinda/ui/screens/karty_path_screen.dart';
import 'package:stelinda/ui/screens/karty_quiz_screen.dart';
import 'package:stelinda/providers/UserProvider.dart';
import 'package:stelinda/services/FileService.dart';
import 'package:stelinda/ui/screens/league_screen.dart';
import 'package:stelinda/ui/screens/premium_screen.dart';
import 'package:stelinda/ui/widgets/karty_question_parts.dart';

import 'helpers/karty_path_preview.dart';
import 'helpers/preview_fonts.dart';
import 'helpers/silent_game_feedback.dart';

/// App Store ekran görüntüleri: uygulamanın kendi ekranları, orta boy iPhone
/// ekranında (1206 × 2622, saydamlıksız PNG). Kart görselleri depoya girmez,
/// klasörden okunur (küçük adlarla: `bett.png`, `haus.png`…).
///
///   STORE_SHOTS_DIR=<çıktı> STORE_CARDS_DIR=<kartlar> flutter test \
///     --dart-define=STELINDA_DEV_TOOLS=false test/store_screenshots_test.dart
///
/// `STELINDA_DEV_TOOLS=false` geliştirici düğmelerini gizler ve oyunu yayındaki
/// yerleşimle çizer. Normal koşuda atlanır.
final _out = Platform.environment['STORE_SHOTS_DIR'];
final _cards = Platform.environment['STORE_CARDS_DIR'];

// App Store Connect iPhone görüntüsünü "orta boy ekran" sınıfında istiyor
// (1206 × 2622 ya da 1179 × 2556); iPhone 17 Pro, nokta.
const _w = 402.0;
const _h = 874.0;

/// Yerleşim 440 noktalık tasarımda kuruldu; başka boyda oranlar korunur.
const _f = _w / 440;
const _navy = Color(0xFF041227);
const _rim = Color(0xFF0B2143);
const _muted = Color(0xFF8FA0B5);

String _card(String word) => '$_cards/$word.png';

/// `FileImage` dosyayı `ImmutableBuffer.fromFilePath` ile okuyor ve bu çağrı
/// test ortamında dönmüyor; sarmalayıcı onu `readAsBytes` yoluna sokar.
class _CardFile implements File {
  _CardFile(this.path, this._bytes);

  @override
  final String path;
  final Uint8List _bytes;

  @override
  Future<int> length() async => _bytes.length;
  @override
  Future<Uint8List> readAsBytes() async => _bytes;
  @override
  Uint8List readAsBytesSync() => _bytes;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

final class _CardFiles extends IOOverrides {
  @override
  File createFile(String path) {
    final file = super.createFile(path);
    return _cards != null && path.startsWith(_cards!)
        ? _CardFile(path, file.readAsBytesSync())
        : file;
  }
}

class _Cards extends KartyProvider {
  _Cards(this.card);
  final Karty card;
  @override
  bool get isLoaded => true;
  @override
  List<Karty> get cards => [card];
  @override
  void reset() {}
  @override
  Future<bool> loadKarty(BuildContext context,
          {bool reviewMode = false}) async =>
      true;
}

class _Audio extends Fake implements PronunciationService {
  @override
  final isMuted = ValueNotifier(false);
  @override
  final isSpeaking = ValueNotifier(false);
  @override
  Future<void> play(String? url) async {}
  @override
  Future<void> stop() async {}
}

class _Scores extends UserService {
  _Scores() : super(Dio());
  final _never = Completer<ApiResponse<UpdateScoreResponse>>();
  @override
  Future<ApiResponse<UpdateScoreResponse>> updateScoreById(int point,
          {int? kartyId, bool boostActive = false}) =>
      _never.future;
}

/// iOS durum çubuğu: saat, Dynamic Island, şebeke, Wi-Fi ve pil.
class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 62,
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              width: 142,
              top: 17,
              child: Text(
                '9:41',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppTypography.family,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
            Positioned(
              left: (_w - 126) / 2,
              top: 11,
              child: Container(
                width: 126,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
            ),
            const Positioned(
              right: 30,
              top: 23,
              child: CustomPaint(size: Size(78, 13), painter: _StatusIcons()),
            ),
          ],
        ),
      );
}

class _StatusIcons extends CustomPainter {
  const _StatusIcons();

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = Colors.white;
    // Şebeke: dört çubuk.
    for (var i = 0; i < 4; i++) {
      final h = 4.0 + i * 2.7;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(i * 4.6, size.height - h, 3.2, h),
            const Radius.circular(1)),
        fill,
      );
    }
    // Wi-Fi: üç yay ve nokta.
    final center = Offset(31.5, size.height + 0.5);
    final arc = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    for (final r in [4.5, 8.5, 12.5]) {
      canvas.drawArc(Rect.fromCircle(center: center, radius: r), -2.36, 1.57,
          false, arc);
    }
    canvas.drawCircle(center.translate(0, -1.6), 1.7, fill);
    // Pil: dolu gövde, ince kontur ve uç.
    const body = Rect.fromLTWH(47, 0.5, 25, 12);
    canvas.drawRRect(
      RRect.fromRectAndRadius(body, const Radius.circular(3.6)),
      Paint()
        ..color = Colors.white.withValues(alpha: .4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(body.deflate(2), const Radius.circular(2)),
      fill,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          const Rect.fromLTWH(73.3, 4.5, 1.7, 4), const Radius.circular(1)),
      Paint()..color = Colors.white.withValues(alpha: .4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Uygulama cihazdaki boyutunda ve güvenli alanıyla kurulur.
Widget _device(Widget screen, {bool statusBar = true}) => SizedBox(
      width: _w,
      height: _h,
      child: MediaQuery(
        data: const MediaQueryData(
          size: Size(_w, _h),
          padding: EdgeInsets.only(top: 62, bottom: 34),
          viewPadding: EdgeInsets.only(top: 62, bottom: 34),
          devicePixelRatio: 3,
          disableAnimations: true,
        ),
        child: Stack(
          children: [
            Positioned.fill(child: screen),
            if (statusBar)
              const Positioned(top: 0, left: 0, right: 0, child: _StatusBar()),
          ],
        ),
      ),
    );

/// Görüntünün zemini ve başlık renkleri. Zeminler paletten; parlak
/// zeminde başlık lacivert, vurgulu kelime lacivert hapta; lacivert zeminde
/// başlık beyaz, hap accent mavi. Hapın alt bandı yüzün koyusu (§2.4).
class _Tone {
  const _Tone(this.background, this.text, this.pillFace, this.pillDepth,
      this.pillText, this.rim);

  final Color background;
  final Color text;
  final Color pillFace;
  final Color pillDepth;
  final Color pillText;
  final Color rim;

  static const navy = _Tone(_navy, Colors.white, Color(0xFF1CB1F5),
      Color(0xFF1B84B5), Colors.white, Color(0xFF163258));
  static const blue = _Tone(Color(0xFF1CB1F5), _navy, _navy,
      Color(0xFF020A18), Colors.white, _rim);
  static const green = _Tone(Color(0xFF93D334), _navy, _navy,
      Color(0xFF020A18), Colors.white, _rim);
  static const orange = _Tone(Color(0xFFFF9300), _navy, _navy,
      Color(0xFF020A18), Colors.white, _rim);
  static const gold = _Tone(Color(0xFFFFC93A), _navy, _navy,
      Color(0xFF020A18), Colors.white, _rim);
}

/// Başlık: iki satır, satırlar elle bölünür; `[kelime]` hapın içine girer.
Widget _caption(String text, _Tone tone, {double size = 40 * _f}) {
  final style = TextStyle(
    color: tone.text,
    fontFamily: AppTypography.displayFamily,
    fontWeight: AppTypography.heading,
    fontSize: size,
    height: 1.18,
  );
  final spans = <InlineSpan>[];
  final parts = RegExp(r'\[([^\]]+)\]|[^\[]+');
  for (final match in parts.allMatches(text)) {
    final pill = match.group(1);
    if (pill == null) {
      spans.add(TextSpan(text: match.group(0)));
      continue;
    }
    spans.add(WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: tone.pillDepth,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 1),
          decoration: BoxDecoration(
            color: tone.pillFace,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(pill,
              style: style.copyWith(color: tone.pillText, height: 1.2)),
        ),
      ),
    ));
  }
  return Text.rich(TextSpan(children: spans, style: style),
      textAlign: TextAlign.center);
}

/// Rakip incelemesinden: başlık üstte ve büyük, ekran genişliğin %88'i ve
/// alttan taşar (arayüz küçük görüntüde okunsun), durum çubuğu yok.
Widget _slide(String caption, _Tone tone, Widget screen,
    {double crop = 44}) {
  const k = .88;
  const rim = 5.0;
  return ColoredBox(
    color: tone.background,
    child: Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          top: 54 * _f,
          left: 24 * _f,
          right: 24 * _f,
          child: _caption(caption, tone),
        ),
        Positioned(
          top: 196 * _f,
          left: (_w - _w * k) / 2 - rim,
          child: Container(
            padding: const EdgeInsets.fromLTRB(rim, rim, rim, 0),
            decoration: BoxDecoration(
              color: tone.rim,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(46 * _f + rim)),
            ),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(46 * _f)),
              child: SizedBox(
                width: _w * k,
                height: (_h - crop) * k,
                child: OverflowBox(
                  alignment: Alignment.topCenter,
                  maxHeight: double.infinity,
                  child: Transform.translate(
                    offset: Offset(0, -crop * k),
                    child: SizedBox(
                      width: _w * k,
                      height: _h * k,
                      child: FittedBox(
                          child: _device(screen, statusBar: false)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

/// İlk görüntü: vaat ve maskot (hoş geldin ekranının sahnesi). Uygulamanın
/// adı mağazada simgenin yanında zaten yazıyor; görüntüye konmaz (kullanıcı).
Widget _heroSlide() => ColoredBox(
      color: _navy,
      child: Stack(
        children: [
          // Sahne en çok bu kadar büyür: maskot solda, "Hallo" kartı sağda
          // bütün kalır.
          Positioned(
            left: -44 * _f,
            right: -46 * _f,
            bottom: -10 * _f,
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF)],
                stops: [0.0, 0.22],
              ).createShader(rect),
              child: Image.asset('assets/scenes/welcome_hero.png',
                  fit: BoxFit.fitWidth),
            ),
          ),
          Positioned(
            top: 112 * _f,
            left: 24 * _f,
            right: 24 * _f,
            child: Column(
              children: [
                _caption('Almancayı\n[oyunlarla] öğren', _Tone.navy,
                    size: 44 * _f),
                const SizedBox(height: 14 * _f),
                const Text(
                  'Kelime ve artikel, günde birkaç dakika',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _muted,
                    fontFamily: AppTypography.family,
                    fontWeight: AppTypography.label,
                    fontSize: 19 * _f,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

ImageProvider _image(String word) =>
    MemoryImage(File(_card(word)).readAsBytesSync());

KartyPathData _path() => KartyPathData(
      units: [
        KartyUnit(
          number: 1,
          title: 'Evde',
          state: KartyUnitState.current,
          wordCount: 24,
          consolidatedCount: 6,
          emblem: _image('haus'),
          steps: const [
            KartyStep(state: KartyStepState.done, deck: 1, label: 'Deste 1'),
            KartyStep(
              state: KartyStepState.current,
              deck: 2,
              label: 'Deste 2',
              newCount: 5,
              learnedCount: 5,
              reviewCount: 4,
            ),
            KartyStep(
                state: KartyStepState.upcoming, deck: 3, label: 'Deste 3'),
          ],
        ),
        KartyUnit(
          number: 2,
          title: 'Sofrada',
          state: KartyUnitState.locked,
          wordCount: 24,
          emblem: _image('brot'),
          unlockHint: "Evde'nin %80'i pekişince açılır",
          steps: [
            for (var i = 1; i <= 3; i++)
              KartyStep(state: KartyStepState.locked, deck: i),
          ],
        ),
      ],
    );

Widget _pathScreen() => Scaffold(
      backgroundColor: _navy,
      body: SafeArea(
        bottom: false,
        child: KartyPathScreen(
          data: _path(),
          onContinue: () {},
          stations: previewStations(),
          header: (scale) => previewPathHeader(scale, streak: 6, tickets: 12),
        ),
      ),
    );

final _score = ScoreWithLivesProvider()
  ..setScoreWithLives(ScoreWithLivesResponse(
    score: 0,
    experience: 0,
    lives: 12,
    maxLives: 15,
    league: LeagueProgressResponse(
      leagueKey: 'yildiz',
      leagueName: 'Yıldız',
      rank: 3,
      points: 24,
      minPoints: 20,
      maxPoints: 30,
      pointsToNextLeague: 6,
      progressRatio: .4,
      seasonKey: 1,
      seasonStartsAtUtc: DateTime.utc(2026, 11, 1),
      seasonEndsAtUtc: DateTime.utc(2026, 12, 1),
      leaderboardRank: 5,
      leagueUserCount: 30,
    ),
  ));

Karty _question(
  int id,
  KartyCardMode mode,
  String image,
  String word,
  String article, {
  List<String> options = const [],
}) =>
    Karty(
      kartyId: id,
      kartyUrl: _card(image),
      correctText: word,
      article: article,
      audioUrl: 'ses',
      mode: mode,
      options: [
        for (final (i, option) in options.indexed)
          KartyOption(
            kartyId: option == image ? id : id * 10 + i,
            imagePath: _card(option),
          ),
      ],
    );

Widget _quizScreen(Karty card) => MultiProvider(
      providers: [
        ChangeNotifierProvider<KartyProvider>(create: (_) => _Cards(card)),
        ChangeNotifierProvider<ScoreWithLivesProvider>.value(value: _score),
        ChangeNotifierProvider(create: (_) => ProfileLearningStatsProvider()),
        Provider(create: (_) => KartyService(Dio())),
        Provider<UserService>(create: (_) => _Scores()),
        Provider<PronunciationService>(create: (_) => _Audio()),
        Provider<GameFeedbackService>.value(value: SilentGameFeedback()),
      ],
      child: const KartyQuizScreen(),
    );

/// PNG'yi saydamlık kanalı olmadan yazar (App Store saydam görüntü almıyor).
Uint8List _rgbPng(int width, int height, Uint8List rgba) {
  final rowLength = 1 + width * 3;
  final raw = Uint8List(rowLength * height);
  for (var y = 0; y < height; y++) {
    var o = y * rowLength + 1;
    var i = y * width * 4;
    for (var x = 0; x < width; x++, i += 4, o += 3) {
      raw[o] = rgba[i];
      raw[o + 1] = rgba[i + 1];
      raw[o + 2] = rgba[i + 2];
    }
  }
  final crcTable = List<int>.generate(256, (n) {
    var c = n;
    for (var k = 0; k < 8; k++) {
      c = (c & 1) != 0 ? 0xEDB88320 ^ (c >> 1) : c >> 1;
    }
    return c;
  });
  int crc(List<int> bytes) {
    var c = 0xFFFFFFFF;
    for (final b in bytes) {
      c = crcTable[(c ^ b) & 0xFF] ^ (c >> 8);
    }
    return c ^ 0xFFFFFFFF;
  }

  final out = BytesBuilder();
  void chunk(String type, List<int> data) {
    final body = [...type.codeUnits, ...data];
    out
      ..add((ByteData(4)..setUint32(0, data.length)).buffer.asUint8List())
      ..add(body)
      ..add((ByteData(4)..setUint32(0, crc(body))).buffer.asUint8List());
  }

  out.add([137, 80, 78, 71, 13, 10, 26, 10]);
  chunk(
    'IHDR',
    (ByteData(13)
          ..setUint32(0, width)
          ..setUint32(4, height)
          ..setUint8(8, 8) // bit derinliği
          ..setUint8(9, 2)) // RGB
        .buffer
        .asUint8List(),
  );
  chunk('IDAT', ZLibEncoder(level: 6).convert(raw));
  chunk('IEND', const []);
  return out.toBytes();
}


final _theme = ThemeData(
  platform: TargetPlatform.iOS,
  scaffoldBackgroundColor: _navy,
  fontFamily: AppTypography.family,
  textTheme: AppTypography.textTheme,
);


class _LeagueUsers extends UserService {
  _LeagueUsers() : super(Dio());

  @override
  Future<ApiResponse<ScoreWithLivesResponse>> scoreWithLivesById(
      BuildContext context) async {
    LeagueLeaderboardEntry entry(int rank, String id, String name, int points,
            {bool me = false}) =>
        LeagueLeaderboardEntry(
            rank: rank,
            userId: id,
            displayName: name,
            points: points,
            isCurrentUser: me);
    final data = ScoreWithLivesResponse(
      score: 0,
      experience: 412,
      lives: 12,
      maxLives: 15,
      league: LeagueProgressResponse(
        leagueKey: 'nebula',
        leagueName: 'Nebula',
        rank: 8,
        points: 76,
        minPoints: 70,
        maxPoints: 80,
        pointsToNextLeague: 4,
        progressRatio: .6,
        seasonKey: 202611,
        seasonStartsAtUtc: DateTime.utc(2026, 11, 1),
        seasonEndsAtUtc: DateTime.utc(2026, 12, 1),
        leaderboardRank: 3,
        leagueUserCount: 6,
        leaderboard: [
          entry(1, 'u1', 'Elif Yılmaz', 79),
          entry(2, 'u2', 'Arben Krasniqi', 78),
          entry(3, 'me', 'Deniz Kaya', 76, me: true),
          entry(4, 'u4', 'Mert Demir', 74),
          entry(5, 'u5', 'Zeynep Arslan', 72),
          entry(6, 'u6', 'Ardit Hoxha', 70),
        ],
      ),
    );
    Provider.of<ScoreWithLivesProvider>(context, listen: false)
        .setScoreWithLives(data);
    return ApiResponse(data: data);
  }
}

Widget _leagueScreen() => MultiProvider(
      providers: [
        Provider<UserService>(create: (_) => _LeagueUsers()),
        Provider<LocalFileService>(create: (_) => LocalFileService()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ScoreWithLivesProvider>(
            create: (_) => ScoreWithLivesProvider()),
      ],
      child: Scaffold(
        backgroundColor: _navy,
        body: const SafeArea(bottom: false, child: LeagueScreen()),
      ),
    );

const _offer = PremiumOffer(
  yearlyPrice: '899,99 TL',
  yearlyPerMonth: '75 TL',
  monthlyPrice: '149,99 TL',
  yearlySavingPercent: 50,
);

Widget _premiumScreen() => PremiumScreen(
      offer: _offer,
      onPurchase: (_) {},
      onRestore: () {},
      onTerms: () {},
      onPrivacy: () {},
      onClose: () {},
    );

void main() {
  setUpAll(() async {
    await loadPreviewFonts();
    IOOverrides.global = _CardFiles();
  });
  tearDownAll(() => IOOverrides.global = null);

  Future<void> shoot(
    WidgetTester tester,
    String name,
    Widget frame, {
    Duration settle = const Duration(milliseconds: 600),
    Future<void> Function()? act,
  }) async {
    final boundary = GlobalKey();
    await tester.binding.setSurfaceSize(const Size(_w, _h));
    tester.view.physicalSize = const Size(_w * 3, _h * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: Material(
        type: MaterialType.transparency,
        child: RepaintBoundary(key: boundary, child: frame),
      ),
    ));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 120));
    final context = tester.element(find.byKey(boundary));
    await tester.runAsync(() async {
      for (final file in Directory(_cards!).listSync().whereType<File>()) {
        // ignore: use_build_context_synchronously
        await precacheImage(FileImage(File(file.path)), context);
      }
    });
    await precachePreviewImages(tester);
    await tester.pump(settle);
    if (act != null) await act();
    await precachePreviewImages(tester);
    expect(tester.takeException(), isNull);

    final render =
        boundary.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final png = await tester.runAsync(() async {
      final image = await render.toImage(pixelRatio: 3);
      final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      return _rgbPng(image.width, image.height, data!.buffer.asUint8List());
    });
    File('$_out/$name.png').writeAsBytesSync(png!);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> tapLetters(WidgetTester tester, Karty card, String word) async {
    final tiles = kartyShuffledLetters(card.correctText, card.kartyId);
    final used = <int>{};
    for (final letter in word.split('')) {
      final index = List.generate(tiles.length, (i) => i)
          .firstWhere((i) => tiles[i] == letter && !used.contains(i));
      used.add(index);
      await tester.tap(find.byKey(ValueKey('karty-letter-$index')));
      await tester.pump();
    }
    await tester.pump(const Duration(milliseconds: 250));
  }

  final bett = _question(
    1,
    KartyCardMode.pickImage,
    'bett',
    'Bett',
    'das',
    options: const ['sofa', 'bett', 'lampe', 'stuhl'],
  );
  final lampe =
      _question(2, KartyCardMode.pickArticle, 'lampe', 'Lampe', 'die');
  final schluessel = _question(
      3, KartyCardMode.arrangeLetters, 'schluessel', 'Schlüssel', 'der');

  const quizSettle = Duration(milliseconds: 2600);
  final ready = _out != null && _cards != null;

  // Oyunun yerleşimi debug'da (geliştirici düğmesine yer ayrılmış) ve yayında
  // farklı; iki koşuyla yan yana konur.
  testWidgets('oyun yerleşimi', (tester) async {
    Directory(_out!).createSync(recursive: true);
    await shoot(tester, kDevTools ? 'yerlesim-debug' : 'yerlesim-yayin',
        _device(_quizScreen(bett)),
        settle: quizSettle);
  }, skip: !ready);

  testWidgets('mağaza görüntüleri', (tester) async {
    Directory(_out!).createSync(recursive: true);
    await shoot(tester, '1-tanitim', _heroSlide());
    await shoot(
      tester,
      '2-gorseli-bul',
      _slide('Kelimeleri\n[görselleriyle] öğren', _Tone.blue,
          _quizScreen(bett)),
      settle: quizSettle,
      act: () async {
        await tester.tap(find.byKey(const ValueKey('karty-option-1')));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 450));
      },
    );
    await shoot(
      tester,
      '3-artikel',
      _slide('Artikelleri\n[renkleriyle] öğren', _Tone.navy,
          _quizScreen(lampe)),
      settle: quizSettle,
    );
    await shoot(
      tester,
      '4-harfleri-diz',
      _slide('Kelime pekiştikçe\n[soru zorlaşır]', _Tone.orange,
          _quizScreen(schluessel)),
      settle: quizSettle,
      act: () => tapLetters(tester, schluessel, 'Schl'),
    );
    await shoot(
      tester,
      '5-patika',
      _slide('Kısa oyunlarla\n[adım adım] ilerle', _Tone.green, _pathScreen()),
    );
    await shoot(
      tester,
      '6-lig',
      _slide('Her gün oyna,\nligde [yüksel]', _Tone.gold, _leagueScreen()),
      settle: const Duration(milliseconds: 1500),
    );
    // Abonelik incelemesi için: planların seçildiği adım, başlıksız.
    await shoot(
      tester,
      'abonelik-inceleme',
      _device(_premiumScreen()),
      act: () async {
        await tester.tap(find.text('DEVAM ET'));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));
      },
    );
  }, skip: !ready || kDevTools);

  // Önizleme panoları: üretilen görüntüleri yan yana koyar.
  testWidgets('panolar', (tester) async {
    Future<void> board(String name, List<(String, String)> items) async {
      final images = [
        for (final (file, _) in items)
          MemoryImage(File('$_out/$file.png').readAsBytesSync()),
      ];
      const cell = 330.0;
      const gap = 36.0;
      final width = items.length * cell + (items.length + 1) * gap;
      const height = cell * _h / _w + 100;
      final boundary = GlobalKey();
      await tester.binding.setSurfaceSize(Size(width, height));
      tester.view.physicalSize = Size(width, height) * 2;
      tester.view.devicePixelRatio = 2;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          color: const Color(0xFF020A18),
          child: RepaintBoundary(
            key: boundary,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(gap, 26, gap, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final (i, (_, label)) in items.indexed) ...[
                    if (i > 0) const SizedBox(width: gap),
                    Column(children: [
                      Text(label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: AppTypography.displayFamily,
                            fontWeight: AppTypography.heading,
                            fontSize: 24,
                          )),
                      const SizedBox(height: 14),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image(
                            image: images[i],
                            width: cell,
                            height: cell * _h / _w),
                      ),
                    ]),
                  ],
                ],
              ),
            ),
          ),
        ),
      ));
      await tester.runAsync(() async {
        final context = tester.element(find.byKey(boundary));
        for (final image in images) {
          // ignore: use_build_context_synchronously
          await precacheImage(image, context);
        }
      });
      await tester.pump();
      final render = boundary.currentContext!.findRenderObject()!
          as RenderRepaintBoundary;
      final png = await tester.runAsync(() async {
        final image = await render.toImage(pixelRatio: 2);
        final data =
            await image.toByteData(format: ui.ImageByteFormat.rawRgba);
        return _rgbPng(image.width, image.height, data!.buffer.asUint8List());
      });
      File('$_out/$name.png').writeAsBytesSync(png!);
    }

    await board('pano-1', [
      ('1-tanitim', '1'),
      ('2-gorseli-bul', '2'),
      ('3-artikel', '3'),
    ]);
    await board('pano-2', [
      ('4-harfleri-diz', '4'),
      ('5-patika', '5'),
      ('6-lig', '6'),
    ]);
    if (File('$_out/yerlesim-debug.png').existsSync()) {
      await board('pano-yerlesim', [
        ('yerlesim-debug', 'Şimdiye kadarki (debug)'),
        ('yerlesim-yayin', 'Yayındaki'),
      ]);
    }
  }, skip: !ready || kDevTools);
}
