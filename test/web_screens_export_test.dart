import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stelinda/models/karty_path.dart';
import 'package:stelinda/ui/screens/karty_path_screen.dart';
import 'package:stelinda/ui/widgets/app_bottom_nav_bar.dart';
import 'package:stelinda/ui/widgets/home_top_bar.dart';

import 'helpers/karty_path_preview.dart';
import 'helpers/preview_fonts.dart';

/// stelinda.com'daki uygulama ekranını (patika) uygulamanın çizim kodundan
/// PNG olarak üretir; ekran görüntüsü elle alınmaz.
///
///   WEB_EXPORT_DIR=<klasör> WEB_CARDS_DIR=~/Desktop/Stelinda-Kartlar \
///     flutter test test/web_screens_export_test.dart
///
/// Sitede telefon en çok 320 px genişlikte; 3 kat (1080 px) çizilir ki
/// iPhone'un 3 kat ekranında da net dursun. JPEG değil PNG: düz renkli
/// arayüzde JPEG yazı kenarlarını ve doymuş renkleri bulanıklaştırıyordu
/// (24 Kas 2026, kullanıcı: "bulanık geldi"). Normal koşuda atlanır.
final _dir = Platform.environment['WEB_EXPORT_DIR'];

/// Ünite amblemlerinin güncel görselleri: kartların kaynak klasörü
/// (`~/Desktop/Stelinda-Kartlar`, S3'e olduğu gibi yüklenen dosyalar).
/// Verilmezse depodaki eski örnek görseller kullanılır.
final _cards = Platform.environment['WEB_CARDS_DIR'];

void main() {
  setUpAll(loadPreviewFonts);

  ImageProvider img(String name) => MemoryImage(
        File('test/fixtures/karty_words/$name.png').readAsBytesSync(),
      );

  ImageProvider emblem(String card, String fallback) {
    final file = File('$_cards/$card.png');
    return _cards != null && file.existsSync()
        ? MemoryImage(file.readAsBytesSync())
        : img(fallback);
  }

  KartyStep deck(KartyStepState state, int number) => KartyStep(
        state: state,
        deck: number,
        label: 'Deste $number',
        title: 'Deste $number',
      );

  KartyPathData path() => KartyPathData(
        units: [
          KartyUnit(
            number: 1,
            title: 'Evde',
            state: KartyUnitState.current,
            wordCount: 24,
            consolidatedCount: 9,
            emblem: emblem('U01-D1-4-Haus', 'haus'),
            steps: [
              deck(KartyStepState.done, 1),
              deck(KartyStepState.done, 2),
              const KartyStep(
                state: KartyStepState.current,
                label: 'Artikel',
                title: 'Artikel',
                newGoal: 10,
                learnedCount: 4,
                article: true,
              ),
              deck(KartyStepState.upcoming, 3),
            ],
          ),
          KartyUnit(
            number: 2,
            title: 'Sofrada',
            state: KartyUnitState.locked,
            wordCount: 16,
            emblem: emblem('U02-D1-3-Brot', 'brot'),
            steps: [
              deck(KartyStepState.locked, 1),
              deck(KartyStepState.locked, 2),
            ],
          ),
        ],
      );

  testWidgets('site ekranı dışa aktarılır', (tester) async {
    const size = Size(360, 780);
    final out = Directory(_dir!)..createSync(recursive: true);
    await tester.binding.setSurfaceSize(size);
    tester.view.physicalSize = size * 3;
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final boundary = GlobalKey();
    await tester.pumpWidget(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepaintBoundary(
        key: boundary,
        child: MediaQuery(
          data: const MediaQueryData(
            size: size,
            padding: EdgeInsets.only(top: 34, bottom: 30),
            devicePixelRatio: 3,
            disableAnimations: true,
          ),
          child: Scaffold(
            backgroundColor: const Color(0xFF041227),
            body: SafeArea(
              bottom: false,
              child: KartyPathScreen(
                data: path(),
                header: (scale) => HomeTopBar(
                  scale: scale,
                  streakDays: 4,
                  playedToday: true,
                  tickets: 4,
                  maxTickets: 5,
                ),
                stations: KartyPathStations(
                  review: previewReviewStation(
                    detail: '2 hatanı düzelt',
                    onTap: () {},
                  ),
                ),
                onContinue: () {},
                controller: ScrollController(initialScrollOffset: 118),
                scrollToCurrent: false,
              ),
            ),
            bottomNavigationBar:
                AppBottomNavBar(selectedIndex: 0, onTap: (_) {}),
          ),
        ),
      ),
    ));
    await tester.pump();
    await precachePreviewImages(tester);
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);

    final render =
        boundary.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final bytes = await tester.runAsync(() async {
      final image = await render.toImage(pixelRatio: 3);
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      return data!.buffer.asUint8List();
    });
    File('${out.path}/patika.png').writeAsBytesSync(bytes!);
  }, skip: _dir == null);
}
