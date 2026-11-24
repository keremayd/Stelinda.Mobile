import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stelinda/models/karty_path.dart';
import 'package:stelinda/ui/screens/karty_path_screen.dart';

import 'helpers/karty_path_preview.dart';

/// Ünitenin desteleri bitince ayrı bir "Tekrar" düğmesi çizilmez; ünitenin
/// pekiştirme kapısı şu anki düğüm olur ve dokununca pekiştirme turu açılır
/// (kullanıcı, 24 Kas 2026: "tekrar diye bir buton oluşturmayıp pekiştirme
/// butonunu evrilterek kullan").
void main() {
  ImageProvider img(String name) => MemoryImage(
        File('test/fixtures/karty_words/$name.png').readAsBytesSync(),
      );

  KartyStep deck(KartyStepState state, int number) =>
      KartyStep(state: state, deck: number, label: 'Deste $number');

  KartyPathData path() => KartyPathData(
        units: [
          KartyUnit(
            number: 1,
            title: 'Evde',
            state: KartyUnitState.current,
            wordCount: 24,
            consolidatedCount: 6,
            emblem: img('haus'),
            steps: [
              deck(KartyStepState.done, 1),
              deck(KartyStepState.done, 2),
              deck(KartyStepState.done, 3),
              const KartyStep(
                state: KartyStepState.current,
                label: 'Pekiştirme',
                title: 'Pekiştirme',
                newGoal: 0,
                reinforce: true,
              ),
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
              deck(KartyStepState.locked, 2),
            ],
          ),
        ],
      );

  testWidgets('desteler bitince pekiştirme kapısı şu anki düğüm',
      (tester) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    var opened = 0;
    await tester.pumpWidget(MaterialApp(
      home: KartyPathScreen(
        data: path(),
        header: previewPathHeader,
        stations: previewStations(),
        onContinue: () => opened += 1,
      ),
    ));
    await tester.pump();
    await tester.pump();

    // Pekiştirme adımı düğüm olarak çizilmez: yalnız beş deste düğümü.
    final steps = find
        .byWidgetPredicate((w) => w.runtimeType.toString() == '_PathNode')
        .evaluate()
        .map((e) => (e.widget as dynamic).step as KartyStep)
        .toList();
    expect(steps.where((step) => step.reinforce), isEmpty);
    expect(find.text('Tekrar'), findsNothing);

    // Kapı şu anki düğüm: etiketi altında, yan duraklar yanında.
    final gate = find.bySemanticsLabel('Pekiştirme, oyna');
    expect(gate, findsOneWidget);
    expect(find.text('Pekiştirme'), findsOneWidget);
    expect(find.text('6/24 kelime'), findsOneWidget);
    expect(find.text('Rövanş'), findsOneWidget);

    await tester.tap(gate);
    await tester.pump(const Duration(milliseconds: 200));
    expect(opened, 1);
  });
}
