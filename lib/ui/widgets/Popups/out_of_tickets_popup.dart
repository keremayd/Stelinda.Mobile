import 'package:stelinda/l10n/l10n.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:stelinda/ui/widgets/app_shape_style.dart';
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:stelinda/ui/widgets/Buttons/depth_pressable_button.dart';
import 'package:stelinda/ui/widgets/clock_mark.dart';
import 'package:stelinda/ui/widgets/premium_ticket_mark.dart';
import 'package:stelinda/ui/widgets/quest_flag_mark.dart';
import 'package:stelinda/ui/widgets/quest_icons.dart';
import 'package:stelinda/ui/widgets/ticket_with_count.dart';

/// Bilet bittiğinde açılan pencere.
///
/// Bilet oyuna giriş bedelidir; bitince oyun açılmaz. Bu pencere o duvarı
/// açıklar ve **dört yol** sunar — Duolingo'nun kalp akışıyla aynı yapı:
///
/// | Duolingo | Bizde |
/// |---|---|
/// | Bekle (geri sayım) | Sonraki bilet — geri sayım |
/// | Pratik yap → anında kalp | **Rövanş oyna → +1 bilet** |
/// | Gem ile doldur | Görevleri bitir → bilet |
/// | Super ("sınırsız kalp") | Premium ("biletin hiç bitmesin") |
///
/// **Kritik olan ikinci satır.** Duolingo'nun ücretsiz yolu *anlık ve
/// tekrarlanabilir*: bir pratik yap, kalbini hemen geri al. Bizde eskiden
/// yalnız "görevleri tamamla" vardı; görevlerini bitirmiş kullanıcı için
/// pencere sadece beklemeye indirgeniyordu. Rövanş o boşluğu kapatıyor ve
/// sömürülemez — yalnız gerçekten bekleyen yanlış kart varsa çalışır.
///
/// Ödemeyen kullanıcı köşeye sıkıştırılmaz: üç ücretsiz yol da her zaman
/// görünür. Baskı var, duvar yok.
Future<void> showOutOfTicketsPopup(
  BuildContext context, {
  required DateTime? nextTicketAt,
  required Future<bool> Function() onRefreshTickets,
  required VoidCallback onGoToReview,
  required VoidCallback onGoToQuests,
  VoidCallback? onGoPremium,
  int? questTickets,
  bool reviewAvailable = true,
  int? maxBalance,
  int regenMinutes = 0,
}) {
  return _showTicketsDialog(
    context,
    (context) => OutOfTicketsCard(
      nextTicketAt: nextTicketAt,
      balance: 0,
      maxBalance: maxBalance,
      regenMinutes: regenMinutes,
      onRefreshTickets: onRefreshTickets,
      onTicketsReady: () => Navigator.of(context).pop(),
      questTickets: questTickets,
      reviewAvailable: reviewAvailable,
      onGoToReview: () {
        Navigator.of(context).pop();
        onGoToReview();
      },
      onGoToQuests: () {
        Navigator.of(context).pop();
        onGoToQuests();
      },
      onGoPremium: onGoPremium == null
          ? null
          : () {
              Navigator.of(context).pop();
              onGoPremium();
            },
    ),
  );
}

/// Bilet penceresinin canlı değerleri (üst şeritteki bilete dokununca).
class TicketStatus {
  const TicketStatus({
    required this.balance,
    this.maxBalance,
    this.nextTicketAt,
    this.regenMinutes = 0,
    this.questTickets,
    this.reviewAvailable = true,
  });

  final int balance;
  final int? maxBalance;
  final DateTime? nextTicketAt;

  /// Bir biletin yenilenme süresi, dakika; bilinmiyorsa 0.
  final int regenMinutes;
  final int? questTickets;
  final bool reviewAvailable;
}

/// Üst şeritteki bilete dokununca açılan pencere: elindeki bilet, sıradakinin
/// süresi, ücretsiz yollar ve Premium. Bilet bitmişse aynı kart "Biletin
/// bitti" hâlinde açılır. Pencere beklemeden açılır; değerler [changes]
/// bildirdikçe [read]'den yeniden okunur (tazeleme arkada, §3.1).
Future<void> showTicketStatusPopup(
  BuildContext context, {
  required Listenable changes,
  required TicketStatus Function() read,
  required Future<bool> Function() onRefreshTickets,
  required VoidCallback onGoToReview,
  required VoidCallback onGoToQuests,
  VoidCallback? onGoPremium,
}) {
  return _showTicketsDialog(
    context,
    (context) => ListenableBuilder(
      listenable: changes,
      builder: (context, _) {
        final status = read();
        return OutOfTicketsCard(
          balance: status.balance,
          maxBalance: status.maxBalance,
          nextTicketAt: status.nextTicketAt,
          regenMinutes: status.regenMinutes,
          questTickets: status.questTickets,
          reviewAvailable: status.reviewAvailable,
          onRefreshTickets: onRefreshTickets,
          // Bilet gelince pencere açık kalır, sayı kendiliğinden artar.
          onTicketsReady: () {},
          onGoToReview: () {
            Navigator.of(context).pop();
            onGoToReview();
          },
          onGoToQuests: () {
            Navigator.of(context).pop();
            onGoToQuests();
          },
          onGoPremium: onGoPremium == null
              ? null
              : () {
                  Navigator.of(context).pop();
                  onGoPremium();
                },
        );
      },
    ),
  );
}

Future<void> _showTicketsDialog(
  BuildContext context,
  Widget Function(BuildContext context) card,
) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: const Color(0xFF041227).withValues(alpha: 0.86),
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.06,
      ),
      child: card(context),
    ),
  );
}

/// Pencerenin içeriği. `Dialog`'dan ayrı bir widget çünkü golden önizlemesi
/// kartı tek başına render edebilsin.
class OutOfTicketsCard extends StatefulWidget {
  const OutOfTicketsCard({
    super.key,
    required this.nextTicketAt,
    required this.onRefreshTickets,
    required this.onTicketsReady,
    required this.onGoToReview,
    required this.onGoToQuests,
    this.onGoPremium,
    this.questTickets,
    this.reviewAvailable = true,
    this.balance,
    this.maxBalance,
    this.regenMinutes = 0,
  });

  final DateTime? nextTicketAt;

  /// Bir biletin yenilenme süresi, dakika (sunucudan). Tavanda geri sayım
  /// yerine kural yazılır: "Bilet harcayınca her 4 saatte 1 yenilenir."
  final int regenMinutes;

  /// Verilir ve sıfırdan büyükse kart bilet durumu hâlinde açılır (üst
  /// şeritteki bilete dokununca): büyük bilet, "8/15 bilet", geri sayım.
  /// Tavandaysa kazanma yolları gizlenir, o an bilet kazanılamıyor.
  final int? balance;
  final int? maxBalance;
  final Future<bool> Function() onRefreshTickets;
  final VoidCallback onTicketsReady;

  /// Bugün görevlerden kazanılabilecek bilet. Bilinmiyorsa sayı yazılmaz —
  /// "0 bilet" göstermek yolu kapalı gibi gösterirdi.
  final int? questTickets;
  final bool reviewAvailable;

  final VoidCallback onGoToReview;
  final VoidCallback onGoToQuests;

  /// Null ise premium düğmesi yok (satın almanın olmadığı platform).
  final VoidCallback? onGoPremium;

  @override
  State<OutOfTicketsCard> createState() => _OutOfTicketsCardState();
}

class _OutOfTicketsCardState extends State<OutOfTicketsCard>
    with SingleTickerProviderStateMixin {
  static const _cardFace = Color(0xFF041227);
  static const _cardBorder = Color(0xFF0B2143);
  static const _tile = Color(0xFF0C2244);
  static const _tileBase = Color(0xFF07182F);
  static const _muted = Color(0xFF8FA0B5);
  static const _countdownValue = Color(0xFFE9EEF5);
  static const _urgent = Color(0xFFFF6B3D);
  static const _accent = Color(0xFF1CB1F5);
  static const _accentDeep = Color(0xFF1B84B5);

  late final AnimationController _entry;
  Timer? _tick;
  Timer? _refreshAt;
  bool _refreshInFlight = false;
  bool _readyHandled = false;

  @override
  void initState() {
    super.initState();
    // Giriş: kayarak değil büyüyerek. Kayma "bir liste öğesi geldi" der,
    // büyüme "bir an oldu" der — bu bir an.
    _entry = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    )..forward();

    // Geri sayım dakikada bir tazelenir; saniye göstermiyoruz.
    _tick = Timer.periodic(const Duration(seconds: 20), (_) {
      if (mounted) setState(() {});
    });
    _scheduleTicketRefresh();
  }

  @override
  void didUpdateWidget(OutOfTicketsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Durum penceresinde bilet gelince yeni zaman gelir: sayaç yeniden kurulur.
    if (oldWidget.nextTicketAt != widget.nextTicketAt) {
      _refreshAt?.cancel();
      _readyHandled = false;
      _scheduleTicketRefresh();
    }
  }

  bool get _hasTickets => (widget.balance ?? 0) > 0;

  bool get _atCap {
    final max = widget.maxBalance;
    return _hasTickets && max != null && widget.balance! >= max;
  }

  /// Tavandaki satır: harcayınca ne hızla geri gelir. Süre bilinmiyorsa
  /// (eski sunucu) yalnız tavan söylenir.
  String _capText(AppLocalizations l10n) {
    final minutes = widget.regenMinutes;
    if (minutes <= 0) return l10n.ticketsCapMax(_max);
    return minutes % 60 == 0
        ? l10n.ticketsCapEveryHours(minutes ~/ 60)
        : l10n.ticketsCapEveryMinutes(minutes);
  }

  /// Yuva sayısı: tavan (bilinmiyorsa 5).
  int get _max => widget.maxBalance ?? 5;

  /// Sıradaki biletin dolmuşluğu: yenilenme süresinin geçen kısmı.
  double get _filling {
    final left = _remaining;
    final minutes = widget.regenMinutes;
    if (left == null || minutes <= 0) return 0;
    return (1 - left.inSeconds / (minutes * 60)).clamp(0.0, 1.0);
  }

  @override
  void dispose() {
    _tick?.cancel();
    _refreshAt?.cancel();
    _entry.dispose();
    super.dispose();
  }

  void _scheduleTicketRefresh() {
    final at = widget.nextTicketAt;
    if (at == null) return;

    final delay = at.difference(DateTime.now().toUtc());
    if (delay <= Duration.zero) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _refreshTicketBalance();
      });
      return;
    }

    // Metin yaklaşık dakika gösterebilir; gerçek istek milisaniyesine kadar
    // sunucunun verdiği yenilenme anında çalışır.
    _refreshAt = Timer(delay, _refreshTicketBalance);
  }

  Future<void> _refreshTicketBalance() async {
    if (!mounted || _refreshInFlight || _readyHandled) return;
    _refreshInFlight = true;

    // Sayaç sıfırda bir başarı iddiası göstermez; sunucudan cevap gelene kadar
    // yalnız kısa bir yenileme durumu görünür.
    setState(() {});

    var hasTicket = false;
    try {
      hasTicket = await widget.onRefreshTickets();
    } catch (_) {
      // Geçici bağlantı hatasında popup açık kalır ve güvenli aralıkla dener.
    } finally {
      _refreshInFlight = false;
    }

    if (!mounted) return;
    if (hasTicket) {
      _readyHandled = true;
      widget.onTicketsReady();
      return;
    }

    // Eski bir sunucu sürümü veya anlık ağ gecikmesi bile kullanıcıyı yanlış
    // "hazır" durumunda bırakmasın. Gerçek bakiye gelene kadar tekrar sorgula.
    _refreshAt = Timer(const Duration(seconds: 5), _refreshTicketBalance);
  }

  Duration? get _remaining {
    final at = widget.nextTicketAt;
    if (at == null) return null;
    final diff = at.difference(DateTime.now().toUtc());
    return diff.isNegative ? Duration.zero : diff;
  }

  /// §2.10: renk dekorasyon değil aciliyet sinyali. Süre son 15 dakikaya
  /// düştüğünde sıcak tona geçer — "neredeyse geldi" demek için.
  bool get _isImminent {
    final left = _remaining;
    return left != null && left > Duration.zero && left.inMinutes <= 15;
  }

  bool get _renewalDue => _remaining == Duration.zero;

  String _countdownText(AppLocalizations l10n) {
    final left = _remaining;
    if (left == null) return l10n.ticketsSoon;
    if (left.inHours > 0) {
      return l10n.ticketsHoursMinutes(left.inHours, left.inMinutes % 60);
    }
    if (left.inMinutes < 1) return l10n.ticketsUnderMinute;
    return l10n.ticketsMinutes(left.inMinutes);
  }

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.sizeOf(context).width / 750;

    return ScaleTransition(
      scale: Tween(begin: 0.86, end: 1.0).animate(
        CurvedAnimation(parent: _entry, curve: Curves.easeOutBack),
      ),
      child: FadeTransition(
        opacity: _entry,
        child: _card(scale),
      ),
    );
  }

  /// Kart genişliği tasarım biriminde: 750 referanstan kenar boşlukları
  /// (44×2) düşülmüş hâli. Sabit olmalı çünkü içindeki depth-press buton
  /// sonsuz genişlik kabul etmiyor.
  static const _cardWidth = 662.0;
  static const _cardPadding = 34.0;
  static const _contentWidth = _cardWidth - _cardPadding * 2;

  /// Kart dili §2.3: yüz sayfa zemini, kontur `0B2143`, altta taban dudağı.
  ///
  /// Yerleşim (25 Kas 2026, kullanıcı onayı; `bilet-penceresi-oneri-yakin`):
  /// biletler beş yuvalık bir sıra (tavan 5 olduğu için sayılabilir; 15
  /// yuva "barkod gibi" okunuyordu), dolular renkli, boşlar silüet, sıradaki
  /// yuvada bilet yenilenme süresinin geçen kısmı kadar alttan yükselir.
  /// Altında "3/5 bilet" (5 küçük ve soluk, ana ekrandaki gibi), geri sayım
  /// kapsülü, "ÜCRETSİZ KAZAN" altında yan yana iki karo, en altta Premium.
  /// Rakiplerdeki sıra: miktar görsel ve sayıyla, yollar ücretsizden
  /// ücretliye, Premium en sonda.
  Widget _card(double scale) {
    final s = scale;
    final l10n = context.l10n;
    final radius = BorderRadius.circular(AppShapeStyle.cardRadius(34 * s));

    return Container(
      width: _cardWidth * s,
      decoration: BoxDecoration(color: _cardBorder, borderRadius: radius),
      padding: EdgeInsets.only(bottom: AppShapeStyle.cardDepth(8 * s)),
      child: Container(
        decoration: BoxDecoration(
          color: _cardFace,
          borderRadius: radius,
          border: Border.all(
              color: _cardBorder, width: AppShapeStyle.outline(2 * s)),
        ),
        padding: EdgeInsets.fromLTRB(
          _cardPadding * s,
          40 * s,
          _cardPadding * s,
          30 * s,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!_hasTickets) ...[
              _depletedTicketMascot(s),
              SizedBox(height: 8 * s),
              Text(
                l10n.ticketsOut,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46 * s,
                  fontWeight: AppTypography.heading,
                  fontFamily: AppTypography.displayFamily,
                  height: 1,
                ),
              ),
              SizedBox(height: 26 * s),
            ],
            _slots(s),
            SizedBox(height: 22 * s),
            if (_hasTickets) ...[
              _balanceTitle(s, l10n),
              SizedBox(height: 16 * s),
            ],
            // Tavanda bilet yenilenmez, geri sayım yok; yerine kural:
            // ne zaman ve ne hızla geleceği (kullanıcı, 24 Kas 2026).
            if (_atCap)
              Text(
                _capText(l10n),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _muted,
                  fontSize: 26 * s,
                  fontWeight: AppTypography.body,
                  fontFamily: AppTypography.family,
                ),
              )
            else
              _countdownPill(s, l10n),

            // Ücretsiz kazanma yolları. Rövanş önce: **anlık** sonuç
            // veriyor; görevler günlük ve bitmiş olabilir. Tavanda gizli:
            // ödül tavanı aşmaz (§5).
            if (!_atCap) ...[
              SizedBox(height: 34 * s),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.ticketsEarnFree,
                  style: TextStyle(
                    color: _muted,
                    fontSize: 21 * s,
                    letterSpacing: 1.6 * s,
                    fontWeight: AppTypography.label,
                    fontFamily: AppTypography.family,
                  ),
                ),
              ),
              SizedBox(height: 14 * s),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _earnTile(
                      s,
                      icon: QuestIcon(questKey: 'review_two', size: 52 * s),
                      title: l10n.introReviewTitle,
                      detail: widget.reviewAvailable
                          ? l10n.ticketsReviewOn
                          : l10n.pathReviewStationEmpty,
                      reward: widget.reviewAvailable ? 1 : null,
                      onTap:
                          widget.reviewAvailable ? widget.onGoToReview : null,
                    ),
                  ),
                  SizedBox(width: 16 * s),
                  Expanded(
                    child: _earnTile(
                      s,
                      icon: QuestFlagMark(size: 50 * s),
                      title: l10n.ticketsQuests,
                      detail: switch (widget.questTickets) {
                        null => l10n.ticketsQuestsDaily,
                        0 => l10n.ticketsQuestsDone,
                        _ => l10n.ticketsQuestsLeft,
                      },
                      reward: widget.questTickets,
                      onTap: widget.onGoToQuests,
                    ),
                  ),
                ],
              ),
            ],
            if (widget.onGoPremium != null) ...[
              SizedBox(height: 26 * s),
              DepthPressableButton(
                width: _contentWidth * s,
                height: 112 * s,
                radius: 24 * s,
                shadowOffset: 9 * s,
                backgroundColor: _accent,
                shadowColor: _accentDeep,
                fontSize: 28 * s,
                fontWeight: AppTypography.action,
                onPressed: widget.onGoPremium!,
                // Duolingo'nun premium dili iridescent olsa da tüm yüzeyi
                // gökkuşağı yapmak metin kontrastını ve Karty'nin kaplama
                // dilini bozar. Renk premium bilette, eylem accent yüzeyde.
                child: _premiumButtonContent(s, l10n),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Beş (tavan kadar) bilet yuvası.
  Widget _slots(double s) {
    final max = _max;
    const gap = 12.0;
    final width = math.min(104.0, (_contentWidth - gap * (max - 1)) / max);
    final balance = widget.balance ?? 0;
    return Semantics(
      label: '${math.min(balance, max)}/$max ${context.l10n.ticketsUnit}',
      excludeSemantics: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < max; i++) ...[
            if (i > 0) SizedBox(width: gap * s),
            _TicketSlot(
              width: width * s,
              fill: i < balance
                  ? 1
                  : i == balance && !_atCap
                      ? _filling
                      : 0,
            ),
          ],
        ],
      ),
    );
  }

  /// "3/5 bilet": sayı büyük, tavan küçük ve soluk (ana ekrandaki gibi).
  Widget _balanceTitle(double s, AppLocalizations l10n) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 54 * s,
          fontWeight: AppTypography.number,
          fontFamily: AppTypography.family,
          height: 1,
        ),
        children: [
          TextSpan(text: '${widget.balance}'),
          if (widget.maxBalance != null)
            TextSpan(
              text: '/${widget.maxBalance}',
              style: TextStyle(color: _muted, fontSize: 32 * s),
            ),
          TextSpan(
            text: '  ${l10n.ticketsUnit}',
            style: TextStyle(
              color: _muted,
              fontSize: 28 * s,
              fontWeight: AppTypography.label,
            ),
          ),
        ],
      ),
    );
  }

  /// Geri sayım: §2.10 saat simgesi, değer kalın; son 15 dakikada sıcak ton.
  Widget _countdownPill(double s, AppLocalizations l10n) {
    final valueColor = _isImminent ? _urgent : _countdownValue;
    final muted = TextStyle(
      color: _muted,
      fontSize: 25 * s,
      fontWeight: AppTypography.caption,
      fontFamily: AppTypography.family,
    );
    final List<InlineSpan> text;
    if (_renewalDue) {
      text = [TextSpan(text: l10n.ticketsRenewing, style: muted)];
    } else {
      final value = _countdownText(l10n);
      final sentence = l10n.ticketsNextIn(value);
      final at = sentence.indexOf(value);
      text = [
        if (at > 0) TextSpan(text: sentence.substring(0, at), style: muted),
        TextSpan(
          text: value,
          style: TextStyle(
            color: valueColor,
            fontSize: 27 * s,
            fontWeight: AppTypography.number,
            fontFamily: AppTypography.family,
          ),
        ),
        TextSpan(text: sentence.substring(at + value.length), style: muted),
      ];
    }
    return Container(
      padding: EdgeInsets.fromLTRB(18 * s, 10 * s, 22 * s, 10 * s),
      decoration: BoxDecoration(
        color: _tile,
        borderRadius: BorderRadius.circular(28 * s),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_renewalDue)
            SizedBox(
              width: 30 * s,
              height: 30 * s,
              child: CircularProgressIndicator(
                strokeWidth: 4 * s,
                color: _countdownValue,
              ),
            )
          else
            ClockMark(size: 34 * s, urgent: _isImminent),
          SizedBox(width: 10 * s),
          Flexible(
            child: Text.rich(
              TextSpan(children: text),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Ücretsiz kazanma yolu: yan yana karo. Uygulamanın ortak basılabilir
  /// yüzeyi (`DepthPressableButton`, ikincil düğme renkleri): basınca
  /// tabanına çöker. Kapalı yol görünür kalır (keşfedilsin); ortak düğmenin
  /// pasif hâliyle çökük ve soluk, basılmaz.
  Widget _earnTile(
    double s, {
    required Widget icon,
    required String title,
    required String detail,
    required int? reward,
    required VoidCallback? onTap,
  }) {
    return Semantics(
      button: onTap != null,
      enabled: onTap != null,
      label: '$title, $detail',
      excludeSemantics: true,
      child: LayoutBuilder(
        builder: (context, constraints) => DepthPressableButton(
          width: constraints.maxWidth,
          height: 151 * s,
          radius: 24 * s,
          shadowOffset: 9 * s,
          backgroundColor: _tile,
          shadowColor: _tileBase,
          fontSize: 27 * s,
          enabled: onTap != null,
          onPressed: onTap ?? () {},
          child: SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20 * s, 16 * s, 16 * s, 14 * s),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icon,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27 * s,
                                fontWeight: AppTypography.label,
                                fontFamily: AppTypography.family,
                                height: 1.1,
                              ),
                            ),
                            Text(
                              detail,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: _muted,
                                fontSize: 21 * s,
                                fontWeight: AppTypography.body,
                                fontFamily: AppTypography.family,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (reward != null && reward > 0)
                    // Rozet biletin altına taştığı için gövde optik olarak
                    // ortalansın diye biraz aşağı (§5).
                    Transform.translate(
                      offset: Offset(0, 6 * s),
                      child: TicketWithCount(
                        scale: s,
                        count: reward,
                        ticketWidth: 70,
                        badgeSize: 32,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Son biletin elde tutulamayacak kadar akışkanlaşması, kaybı nesnenin
  /// kendisi üzerinden anlatır. Görsel bileti zaten içerdiği için ayrıca
  /// `ticket.png` bindirilmez.
  Widget _depletedTicketMascot(double s) {
    return SizedBox(
      height: 210 * s,
      child: Image.asset(
        'assets/icons/mascot_ticket_melt.png',
        height: 210 * s,
        fit: BoxFit.contain,
      ),
    );
  }

  /// Premium vaadi ile eylemi tek yüzeyde toplar.
  Widget _premiumButtonContent(double s, AppLocalizations l10n) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22 * s),
      child: Row(
        children: [
          PremiumTicketMark(width: 96 * s),
          SizedBox(width: 18 * s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.ticketsPremiumTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26 * s,
                    fontWeight: AppTypography.action,
                    fontFamily: AppTypography.family,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 6 * s),
                Text(
                  l10n.ticketsPremiumBody,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 20 * s,
                    fontWeight: AppTypography.caption,
                    fontFamily: AppTypography.family,
                    height: 1.15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Bilet yuvası: dolu (renkli bilet, kalınlık bandı), boş (lacivert
/// silüet) ya da dolmakta (biletin kendisi alttan [fill] kadar yükselir;
/// soluk altın tonu lacivertte zeytine döndüğü için tam renk, §4.3).
/// Silüet `ticket.png`'nin kendisi (`srcIn`), elle çizilmez (§5).
class _TicketSlot extends StatelessWidget {
  const _TicketSlot({required this.width, required this.fill});

  final double width;
  final double fill;

  @override
  Widget build(BuildContext context) {
    final depth = width * 6 / 84;
    final height = width * 110 / 172;
    Widget ticket(Color? color) => Image.asset(
          'assets/icons/ticket.png',
          width: width,
          color: color,
          colorBlendMode: color == null ? null : BlendMode.srcIn,
        );
    final lit = fill >= 1;
    return SizedBox(
      width: width,
      height: height + depth,
      child: Stack(
        children: [
          Positioned(
            top: depth,
            child: ticket(
              lit ? const Color(0xFFB87E00) : const Color(0xFF07182F),
            ),
          ),
          Positioned(
            top: 0,
            child: ticket(lit ? null : const Color(0xFF163258)),
          ),
          if (!lit && fill > 0)
            Positioned(
              top: 0,
              child: ClipRect(
                clipper: _BottomClip(fill),
                child: ticket(null),
              ),
            ),
        ],
      ),
    );
  }
}

class _BottomClip extends CustomClipper<Rect> {
  const _BottomClip(this.fill);

  final double fill;

  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(0, size.height * (1 - fill), size.width, size.height);

  @override
  bool shouldReclip(covariant _BottomClip oldClipper) =>
      oldClipper.fill != fill;
}
