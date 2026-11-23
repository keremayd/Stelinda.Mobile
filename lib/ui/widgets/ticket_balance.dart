import 'dart:async';

import 'package:stelinda/l10n/l10n.dart';
import 'package:stelinda/ui/widgets/premium_ticket_mark.dart';
import 'package:flutter/material.dart';
import 'package:stelinda/ui/app_typography.dart';

/// Bilet bakiyesi: kalınlık bantlı yıldızlı bilet, yanında sayı ve soluk
/// "/tavan". Görevler başlığında doğdu; ana ekranın üst şeridi de aynı
/// parçayı kullanır (16 Kas 2026, kullanıcı: "görevler ekranındaki gibi,
/// daha güzel"). İki yerde ayrı çizilseydi zamanla birbirinden ayrılırlardı.
///
/// Ölçüler biletin enine ve sayının boyuna oranlı; Görevler'de bilet 84,
/// sayı 40 (670 ölçeği). Ana ekranda sayı şeritteki seri sayısıyla aynı
/// boyda, bilet ve kesir aynı oranlarla ona göre.
class TicketBalance extends StatefulWidget {
  const TicketBalance({
    super.key,
    required this.scale,
    required this.count,
    required this.max,
    required this.ticketWidth,
    required this.numberSize,
    this.iconKey,
    this.rolling = false,
    this.unlimited = false,
    this.onTap,
  });

  final double scale;
  final int count;

  /// Tavan kullanıcı bazında değişebiliyor (premium `max_lives`'ı
  /// yükseltecek), bu yüzden sabit 15 değil satırdan okunur. Yüklenmediyse
  /// (0) kesir hiç çizilmez: "13/0" bakiyeyi yalanlar.
  ///
  /// Tavan **yazıyla** gösteriliyor. Kesir yerine kap çizmek (çubuk, bölmeli
  /// kap) denendi, hepsi başka sebeplerden elendi; tavanın anlaşılması
  /// önceliklendi. Tavandayken renk değişmez: dolu olmak iyi bir durum,
  /// aciliyet tonu (§2.10) onu cezaya çevirirdi.
  final int max;

  /// Biletin eni ve sayının boyu, tasarım birimi.
  final double ticketWidth;
  final double numberSize;

  /// Biletin yeri: uçan biletler buraya iner, harcanan bilet buradan kalkar.
  /// Sayı değil, biletin kendisi.
  final Key? iconKey;

  /// Sayı değişince yenisine kayarak döner: azalırken düşer, artarken
  /// yükselir. Ana ekranda bedel yolda yazmadığı için harcamayı bu söylüyor.
  final bool rolling;

  /// Premium üye: altın bilet ve sayı yerine premium bilet; biletin kendisi
  /// ∞ taşıdığı için sayı yazılmaz (kullanıcı kararı, 23 Kas 2026).
  final bool unlimited;

  /// Verilirse bilet basılabilir (bilet penceresini açar): öbür düğmeler gibi
  /// yüzü kalınlık bandına çöker (§2.4), sayı yerinde kalır (kullanıcı,
  /// 23 Kas 2026).
  final VoidCallback? onTap;

  /// Kalınlık bandı: §2.6 `yildiz` taşının koyusu, ödül biletlerinin
  /// sönük tonu (§5 "Sönükten parlağa").
  static const _band = Color(0xFFB87E00);
  static const _muted = Color(0xFF8FA0B5);

  @override
  State<TicketBalance> createState() => _TicketBalanceState();
}

class _TicketBalanceState extends State<TicketBalance> {
  /// Kaydırılan listede dokunuş aynı karede bitebiliyor; çökme en az bu
  /// kadar görünür (§2.4, `_ClaimButton`).
  static const _minPress = Duration(milliseconds: 120);

  bool _pressed = false;
  DateTime? _pressedAt;
  Timer? _release;

  void _press() {
    _release?.cancel();
    _pressedAt = DateTime.now();
    setState(() => _pressed = true);
  }

  void _unpress() {
    final held = DateTime.now().difference(_pressedAt ?? DateTime.now());
    final wait = _minPress - held;
    _release?.cancel();
    if (wait <= Duration.zero) {
      if (mounted) setState(() => _pressed = false);
    } else {
      _release = Timer(wait, () {
        if (mounted) setState(() => _pressed = false);
      });
    }
  }

  @override
  void dispose() {
    _release?.cancel();
    super.dispose();
  }

  Widget _tappable(Widget child) {
    final onTap = widget.onTap;
    if (onTap == null) return child;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _press(),
      onTapUp: (_) {
        _unpress();
        onTap();
      },
      onTapCancel: _unpress,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = widget.scale;
    final width = widget.ticketWidth * scale;
    final depth = widget.ticketWidth * 6 / 84 * scale;
    // Çökme: bant (alt katman) 60 ms'de söner, yüz 80 ms'de banda iner;
    // gölge yüzden önce kaybolur, hareket "oturma" gibi okunur (§2.4).
    const fade = Duration(milliseconds: 60);
    const sink = Duration(milliseconds: 80);
    final faceTop = _pressed ? depth : 0.0;
    final number = TextStyle(
      color: Colors.white,
      fontFamily: AppTypography.family,
      fontSize: widget.numberSize * scale,
      fontWeight: AppTypography.number,
      height: 1,
    );

    if (widget.unlimited) {
      // Uçan biletler (görev ödülü) yine biletin kendisine iner.
      return _tappable(Semantics(
        label: context.l10n.ticketsUnlimited,
        button: widget.onTap != null,
        child: SizedBox(
          width: width,
          height: width / PremiumTicketMark.aspectRatio + depth,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: sink,
                curve: Curves.easeOut,
                left: 0,
                top: faceTop,
                child: PremiumTicketMark(key: widget.iconKey, width: width),
              ),
            ],
          ),
        ),
      ));
    }

    return _tappable(Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Kalınlık bandı (§2.5): biletin kendi silüeti, koyu altınla biraz
        // aşağıda. Gölgesiz PNG ekranda işlenmemiş görünüyordu. ShaderMask
        // değil renkli Image: ayrı katman açmaz, büyüyüp küçülen bilette
        // takılmaz (§4.4).
        SizedBox(
          width: width,
          height: width * 110 / 172 + depth,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: depth,
                child: AnimatedOpacity(
                  duration: fade,
                  opacity: _pressed ? 0 : 1,
                  child: Image.asset(
                    'assets/icons/ticket.png',
                    width: width,
                    fit: BoxFit.contain,
                    color: TicketBalance._band,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: sink,
                curve: Curves.easeOut,
                left: 0,
                top: faceTop,
                child: Image.asset(
                  'assets/icons/ticket.png',
                  key: widget.iconKey,
                  width: width,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: widget.ticketWidth * 10 / 84 * scale),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            if (widget.rolling)
              _RollingCount(value: widget.count, style: number)
            else
              Text('${widget.count}', style: number),
            if (widget.max > 0)
              Text(
                '/${widget.max}',
                style: TextStyle(
                  color: TicketBalance._muted,
                  fontFamily: AppTypography.family,
                  fontSize: widget.numberSize * 0.6 * scale,
                  fontWeight: AppTypography.caption,
                  height: 1,
                ),
              ),
          ],
        ),
      ],
    ));
  }
}

class _RollingCount extends StatefulWidget {
  const _RollingCount({required this.value, required this.style});

  final int value;
  final TextStyle style;

  @override
  State<_RollingCount> createState() => _RollingCountState();
}

class _RollingCountState extends State<_RollingCount> {
  bool _falling = true;

  @override
  void didUpdateWidget(covariant _RollingCount oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _falling = widget.value < oldWidget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 240),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final incoming = child.key == ValueKey(widget.value);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, incoming == _falling ? -0.8 : 0.8),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Text(
        '${widget.value}',
        key: ValueKey(widget.value),
        style: widget.style,
      ),
    );
  }
}
