import 'package:flutter/widgets.dart';
import 'package:stelinda/ui/screens/karty_path_screen.dart';
import 'package:stelinda/ui/widgets/home_top_bar.dart';
import 'package:stelinda/ui/widgets/practice_station_marks.dart';

/// Patika önizlemelerinin ortak üst şeridi ve yan durakları.
Widget previewPathHeader(
  double scale, {
  int streak = 4,
  bool playedToday = true,
  int tickets = 4,
}) =>
    HomeTopBar(
      scale: scale,
      streakDays: streak,
      playedToday: playedToday,
      tickets: tickets,
      maxTickets: 5,
    );

KartyPathStation previewReviewStation({
  required String detail,
  VoidCallback? onTap,
}) =>
    KartyPathStation(
      title: 'Rövanş',
      spokenName: 'Karty Rövanş',
      icon: (tile) => RevengeCardMark(size: tile * 0.76),
      detail: detail,
      onTap: onTap,
    );

/// Açık Rövanş durağı (Artikel 24 Kas 2026'dan beri patikada kendi adımı):
/// patikanın kendisine bakan önizlemeler için.
KartyPathStations previewStations() => KartyPathStations(
      review: previewReviewStation(detail: '2 hatanı düzelt', onTap: () {}),
    );
