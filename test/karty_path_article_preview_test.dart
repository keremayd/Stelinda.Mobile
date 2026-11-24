import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stelinda/models/karty_path.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:stelinda/ui/screens/karty_path_screen.dart';
import 'package:stelinda/ui/widgets/home_top_bar.dart';
import 'package:stelinda/ui/widgets/step_intro_sheet.dart';

import 'helpers/karty_path_preview.dart';
import 'helpers/preview_fonts.dart';

/// Artikel adımı patikada (24 Kas 2026, kullanıcı onayı; gerekçe
/// `docs/ARTIKEL_ARASTIRMA.md`) ve her adım türünün ilk oyunundan önce çıkan
/// açıklama kartı (`StepIntroCard`).
///
///   flutter test --update-goldens test/karty_path_article_preview_test.dart
void main() {
  setUpAll(loadPreviewFonts);

  ImageProvider img(String name) => MemoryImage(
        File('test/fixtures/karty_words/$name.png').readAsBytesSync(),
      );

  KartyWord w(String word, String article, String image) => KartyWord(
        word: word,
        article: article,
        image: img(image),
        box: 1,
      );

  KartyStep deck(KartyStepState state, int number, {List<KartyWord>? words}) =>
      KartyStep(
        state: state,
        deck: number,
        label: 'Deste $number',
        title: 'Deste $number',
        words: words ?? const [],
        upcoming: state == KartyStepState.upcoming
            ? [
                for (final n in ['apfel', 'banane', 'brot', 'wolke']) img(n)
              ]
            : const [],
      );

  // Artikel turu 10 doğru cevapla biter; yarıda bırakılırsa kaldığı yerden
  // sürer ve deste gibi halkası dolar.
  KartyStep article(KartyStepState state, {int learned = 0}) => KartyStep(
        state: state,
        label: 'Artikel',
        title: 'Artikel',
        newGoal: 10,
        learnedCount: learned,
        article: true,
      );

  final deck1 = [
    w('Buch', 'das', 'buch'),
    w('Tasche', 'die', 'tasche'),
    w('Schlüssel', 'der', 'schluessel'),
    w('Katze', 'die', 'katze'),
  ];
  final deck2 = [
    w('Haus', 'das', 'haus'),
    w('Stuhl', 'der', 'stuhl'),
    w('Lampe', 'die', 'lampe'),
    w('Koffer', 'der', 'koffer'),
  ];

  KartyPathData path({required bool articleDone, int learned = 0}) =>
      KartyPathData(
        units: [
          KartyUnit(
            number: 1,
            title: 'Evde',
            state: KartyUnitState.current,
            wordCount: 24,
            consolidatedCount: 9,
            emblem: img('haus'),
            steps: [
              deck(KartyStepState.done, 1, words: deck1),
              deck(KartyStepState.done, 2, words: deck2),
              article(
                articleDone ? KartyStepState.done : KartyStepState.current,
                learned: learned,
              ),
              articleDone
                  ? const KartyStep(
                      state: KartyStepState.current,
                      deck: 3,
                      label: 'Deste 3',
                      title: 'Deste 3',
                      newCount: 3,
                      learnedCount: 2,
                      reviewCount: 2,
                    )
                  : deck(KartyStepState.upcoming, 3),
            ],
          ),
          KartyUnit(
            number: 2,
            title: 'Sofrada',
            state: KartyUnitState.locked,
            wordCount: 16,
            emblem: img('brot'),
            steps: [
              deck(KartyStepState.locked, 1),
              article(KartyStepState.locked),
              deck(KartyStepState.locked, 2),
            ],
          ),
        ],
      );

  // Artikel durağı kalktı: yanda yalnız Rövanş, ikinci satırı işini söyler.
  final stations = KartyPathStations(
    review: previewReviewStation(detail: '2 hatanı düzelt', onTap: () {}),
  );

  Widget header(double scale) => HomeTopBar(
        scale: scale,
        streakDays: 4,
        playedToday: true,
        tickets: 4,
        maxTickets: 5,
      );

  Widget phone(Widget child, {double height = 932}) => ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: SizedBox(
          width: 430,
          height: height,
          child: MediaQuery(
            data: MediaQueryData(
              disableAnimations: true,
              size: Size(430, height),
              padding: const EdgeInsets.only(top: 47),
              devicePixelRatio: 2,
            ),
            child: child,
          ),
        ),
      );

  Widget pathScreen({
    required bool articleDone,
    double offset = 0,
    int learned = 0,
  }) =>
      KartyPathScreen(
        data: path(articleDone: articleDone, learned: learned),
        header: header,
        stations: stations,
        onContinue: () {},
        controller: ScrollController(initialScrollOffset: offset),
        scrollToCurrent: false,
      );

  Widget board(List<(String, String, Widget)> frames) => Material(
        color: const Color(0xFF020A18),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 34, 40, 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (i, (title, subtitle, frame)) in frames.indexed) ...[
                if (i > 0) const SizedBox(width: 40),
                SizedBox(
                  width: 430,
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: AppTypography.heading,
                          fontFamily: AppTypography.displayFamily,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF8FA0B5),
                          fontSize: 16,
                          fontWeight: AppTypography.body,
                          fontFamily: AppTypography.family,
                        ),
                      ),
                      const SizedBox(height: 22),
                      frame,
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      );

  Future<void> render(
    WidgetTester tester,
    int frames,
    Widget child,
    String golden,
  ) async {
    final size = Size(40.0 + frames * 470, 932 + 180);
    await tester.binding.setSurfaceSize(size);
    tester.view.physicalSize = size * 2;
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(debugShowCheckedModeBanner: false, home: child),
    );
    await tester.pump();
    await precachePreviewImages(tester);
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
    await expectLater(find.byType(MaterialApp), matchesGoldenFile(golden));
  }

  testWidgets('artikel düğümü patikada', (tester) async {
    await render(
      tester,
      3,
      board([
        (
          'Artikel sırası geldi',
          'Deste 2 bitti; yanda yalnız Rövanş',
          phone(pathScreen(articleDone: false, offset: 140)),
        ),
        (
          'Yarıda bırakıldı',
          '4 doğru kayıtlı, kalan 6 ile sürer',
          phone(pathScreen(articleDone: false, offset: 140, learned: 4)),
        ),
        (
          'Artikel bitti',
          'Sıradaki deste şu anki düğüm',
          phone(pathScreen(articleDone: true, offset: 220)),
        ),
      ]),
      'goldens/karty_path_article_node.png',
    );
  });

  testWidgets('ilk dokunuşta açıklama kartı', (tester) async {
    Widget withCard(StepIntroKind kind) => phone(
          Stack(
            children: [
              pathScreen(articleDone: false, offset: 330),
              const Positioned.fill(
                child: ColoredBox(color: Color(0x8C000000)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: StepIntroCard(
                  kind: kind,
                  scale: 430 / 750,
                  onStart: () {},
                ),
              ),
            ],
          ),
        );

    await render(
      tester,
      4,
      board([
        ('Deste', 'İlk oyundan önce, bir kez', withCard(StepIntroKind.deck)),
        ('Artikel', 'Düğüme ilk dokunuşta', withCard(StepIntroKind.article)),
        ('Pekiştirme', 'Kapıya ilk varışta', withCard(StepIntroKind.reinforce)),
        ('Rövanş', 'İlk hata birikince', withCard(StepIntroKind.review)),
      ]),
      'goldens/karty_path_step_intro_cards.png',
    );
  });
}
