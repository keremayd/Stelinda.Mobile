import 'dart:io' show Platform;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stelinda/l10n/app_language.dart';
import 'package:stelinda/l10n/l10n.dart';
import 'package:timezone/timezone.dart' as tz;

class DailyReminder {
  const DailyReminder({
    required this.at,
    required this.title,
    required this.body,
  });

  final DateTime at;
  final String title;
  final String body;
}

const _reminderHour = 20;

/// Oyuncu dönmezse kaç gün üst üste hatırlatılacağı. Sonrasında susulur:
/// karşılık bulmayan bildirim kanalı kapattırır.
const _reminderDays = 3;

/// Önümüzdeki hatırlatmalar: günde en çok bir tane, o gün oynandıysa ertesi
/// günden başlar. Metinler [l10n]'un dilinde; verilmezse seçili dil
/// ([AppLanguage.current]), çünkü plan widget ağacının dışında kuruluyor.
List<DailyReminder> planDailyReminders({
  required DateTime now,
  required bool playedToday,
  required int streak,
  AppLocalizations? l10n,
}) {
  final text = l10n ?? _localizations();
  final remindToday =
      !playedToday && now.isBefore(DateTime(now.year, now.month, now.day, _reminderHour));
  final firstDay = remindToday ? 0 : 1;
  // Seri ilk hatırlatmaya kadar ancak bugün oynandıysa ya da hatırlatma bugünse
  // ayakta kalır; sonrakiler kaçırılmış günlerin ardından gelir.
  final streakAlive = streak > 0 && (remindToday || playedToday);

  return [
    for (var day = 0; day < _reminderDays; day++)
      _reminder(
        DateTime(now.year, now.month, now.day + firstDay + day, _reminderHour),
        day: day,
        streak: streak,
        streakAlive: streakAlive,
        l10n: text,
      ),
  ];
}

AppLocalizations _localizations() => currentL10n;

DailyReminder _reminder(
  DateTime at, {
  required int day,
  required int streak,
  required bool streakAlive,
  required AppLocalizations l10n,
}) {
  if (day == 0 && streakAlive) {
    return DailyReminder(
      at: at,
      title: l10n.reminderStreakTitle(streak),
      body: l10n.reminderStreakBody,
    );
  }
  if (day == 1 || (day == 0 && streak > 0)) {
    return DailyReminder(
      at: at,
      title: l10n.reminderMissedTitle,
      body: l10n.reminderMissedBody,
    );
  }
  return DailyReminder(
    at: at,
    title: l10n.reminderInviteTitle,
    body: l10n.reminderInviteBody,
  );
}

/// Sunucusuz günlük hatırlatma. Plan her oyun durumu değiştiğinde baştan
/// kurulur, böylece oynanan günün bildirimi çalmaz. Bildirim hatası oyunu
/// asla etkilemez.
abstract final class DailyReminders {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static const _storage = FlutterSecureStorage();
  static const _askedKey = 'dailyReminderPermissionAsked';
  static const _firstId = 7100;

  static NotificationDetails _details(AppLocalizations l10n) =>
      NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          l10n.reminderChannelName,
          channelDescription: l10n.reminderChannelDescription,
        ),
        iOS: const DarwinNotificationDetails(),
      );

  /// Dil de planın parçası: dil değişince bekleyen bildirimler yeni dilde
  /// yeniden kurulur.
  static ({
    DateTime day,
    bool playedToday,
    int streak,
    String language
  })? _planned;

  static Future<void> init() async {
    try {
      await _plugin.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        // İzin açılışta değil, ilk oyundan sonra sorulur.
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ));
    } catch (_) {}
  }

  /// İzni bir kez, ilk oyunu bitiren kullanıcıya sorar: uygulamayı açar açmaz
  /// sorulan izin çoğunlukla reddedilir.
  static Future<void> askPermissionOnce() async {
    try {
      if (await _storage.read(key: _askedKey) != null) return;
      await _storage.write(key: _askedKey, value: 'true');

      if (Platform.isIOS) {
        await _plugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(alert: true, sound: true);
      } else {
        await _plugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission();
      }

      final planned = _planned;
      if (planned == null) return;
      _planned = null;
      await sync(playedToday: planned.playedToday, streak: planned.streak);
    } catch (_) {}
  }

  /// Oyun durumu her tazelendiğinde çağrılır; durum değişmediyse dokunmaz.
  static Future<void> sync({
    required bool playedToday,
    required int streak,
  }) async {
    final now = DateTime.now();
    final state = (
      day: DateTime(now.year, now.month, now.day),
      playedToday: playedToday,
      streak: streak,
      language: AppLanguage.current,
    );
    if (state == _planned) return;
    _planned = state;

    try {
      await _plugin.cancelAll();
      final l10n = _localizations();
      final plan = planDailyReminders(
        now: now,
        playedToday: playedToday,
        streak: streak,
        l10n: l10n,
      );
      for (final (index, reminder) in plan.indexed) {
        await _plugin.zonedSchedule(
          _firstId + index,
          reminder.title,
          reminder.body,
          tz.TZDateTime.from(reminder.at.toUtc(), tz.UTC),
          _details(l10n),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      }
    } catch (_) {
      // Bir sonraki tazelemede yeniden denensin.
      _planned = null;
    }
  }

  /// Oturum kapanınca eski hesabın hatırlatmaları çalmasın.
  static Future<void> cancel() async {
    _planned = null;
    try {
      await _plugin.cancelAll();
    } catch (_) {}
  }
}
