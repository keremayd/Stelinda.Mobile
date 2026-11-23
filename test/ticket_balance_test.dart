import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stelinda/ui/widgets/premium_ticket_mark.dart';
import 'package:stelinda/ui/widgets/ticket_balance.dart';

void main() {
  Widget host(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('premium üyede premium bilet, sayı ve tavan yazılmaz',
      (tester) async {
    final key = GlobalKey();
    await tester.pumpWidget(host(TicketBalance(
      scale: 1,
      count: 15,
      max: 15,
      ticketWidth: 80,
      numberSize: 38,
      unlimited: true,
      iconKey: key,
    )));
    expect(find.byType(PremiumTicketMark), findsOneWidget);
    expect(find.text('15'), findsNothing);
    expect(find.text('/15'), findsNothing);
    expect(find.text('∞'), findsNothing);
    // Görev ödülünde uçan biletler premium bilete iner.
    expect(key.currentContext, isNotNull);
    expect(find.bySemanticsLabel('Sınırsız bilet'), findsOneWidget);
  });

  testWidgets('ücretsiz üyede altın bilet, sayı ve tavan', (tester) async {
    await tester.pumpWidget(host(const TicketBalance(
      scale: 1,
      count: 8,
      max: 15,
      ticketWidth: 80,
      numberSize: 38,
    )));
    expect(find.byType(PremiumTicketMark), findsNothing);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('/15'), findsOneWidget);
  });
}
