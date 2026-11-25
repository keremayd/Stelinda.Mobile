import 'package:stelinda/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:stelinda/models/responses/LeagueProgressResponse.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:stelinda/ui/widgets/Buttons/depth_pressable_button.dart';
import 'package:stelinda/ui/widgets/app_shape_style.dart';
import 'package:stelinda/ui/widgets/league_badge_mark.dart';

Future<void> showLeagueInfoPopup(
  BuildContext context, {
  required LeagueProgressResponse league,
  required String? nextLeagueName,
}) =>
    showDialog<void>(
      context: context,
      barrierColor: const Color(0xFF041227).withValues(alpha: 0.86),
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(dialogContext).width * 0.06,
        ),
        child: SingleChildScrollView(
          child: LeagueInfoCard(
            league: league,
            nextLeagueName: nextLeagueName,
            onClose: () => Navigator.of(dialogContext).pop(),
          ),
        ),
      ),
    );

/// Lig kartındaki bilgi düğmesinin ayrıntıları. Ayrı widget olduğu için ekran
/// düzenini büyütmeden ve gerçek sezon verisini sahtelemeden önizlenebilir.
class LeagueInfoCard extends StatelessWidget {
  const LeagueInfoCard({
    super.key,
    required this.league,
    required this.nextLeagueName,
    required this.onClose,
    this.now,
  });

  final LeagueProgressResponse league;
  final String? nextLeagueName;
  final VoidCallback onClose;
  final DateTime? now;

  static const _background = Color(0xFF041227);
  static const _border = Color(0xFF0B2143);
  static const _panel = Color(0xFF0C2244);
  static const _muted = Color(0xFF8FA0B5);
  static const _accent = Color(0xFF1CB1F5);
  static const _accentDepth = Color(0xFF1B84B5);

  /// "Kasım 2026 sezonu": ay adı dile göre (Material yerelleştirmesi).
  String _seasonLabel(BuildContext context) {
    final l10n = context.l10n;
    final month = league.seasonKey % 100;
    final year = league.seasonKey ~/ 100;
    if (month < 1 || month > 12) return l10n.leagueMonthlySeason;
    // Ay adı ARB'den: Material'ın ay adı yerelleştirme delegesine bağlı,
    // metinlerle aynı dilde olacağı garanti değil.
    final monthName = l10n.monthNames.split(' ')[month - 1];
    return l10n.leagueSeasonOf('$monthName $year');
  }

  String _remainingLabel(AppLocalizations l10n) {
    final remaining =
        league.seasonEndsAtUtc.difference((now ?? DateTime.now()).toUtc());
    if (remaining <= Duration.zero) return l10n.leagueSeasonRenewing;
    if (remaining.inDays > 0) {
      final hours = remaining.inHours - remaining.inDays * 24;
      return l10n.leagueSeasonEndsDays(remaining.inDays, hours);
    }
    if (remaining.inHours > 0) {
      final minutes = remaining.inMinutes - remaining.inHours * 60;
      return l10n.leagueSeasonEndsHours(remaining.inHours, minutes);
    }
    return l10n.leagueSeasonEndsMinutes(remaining.inMinutes);
  }

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.sizeOf(context).width / 750;
    final radius = BorderRadius.circular(AppShapeStyle.cardRadius(34 * scale));
    final nextThreshold = league.maxPoints;
    final hasNext = nextThreshold != null && nextLeagueName != null;
    final pointsLeft = league.pointsToNextLeague ??
        (nextThreshold == null ? 0 : nextThreshold - league.points);

    return Container(
      width: 662 * scale,
      decoration: BoxDecoration(color: _border, borderRadius: radius),
      padding: EdgeInsets.only(bottom: AppShapeStyle.cardDepth(8 * scale)),
      child: Container(
        decoration: BoxDecoration(
          color: _background,
          borderRadius: radius,
          border: Border.all(
            color: _border,
            width: AppShapeStyle.outline(2 * scale),
          ),
        ),
        padding: EdgeInsets.fromLTRB(
          34 * scale,
          38 * scale,
          34 * scale,
          34 * scale,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.leagueNamed(
                LeagueVisuals.nameOf(league.leagueKey, context.l10n),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppTypography.displayFamily,
                fontSize: 46 * scale,
                fontWeight: AppTypography.heading,
                height: 1,
              ),
            ),
            SizedBox(height: 12 * scale),
            Text(
              _seasonLabel(context),
              style: TextStyle(
                color: _muted,
                fontFamily: AppTypography.family,
                fontSize: 25 * scale,
                fontWeight: AppTypography.label,
              ),
            ),
            SizedBox(height: 30 * scale),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(26 * scale),
              decoration: BoxDecoration(
                color: _panel,
                borderRadius:
                    BorderRadius.circular(AppShapeStyle.cardRadius(22 * scale)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n.leagueYourPoints,
                          style: _bodyStyle(scale, color: _muted)),
                      Text(
                        '${league.points}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppTypography.family,
                          fontSize: 43 * scale,
                          fontWeight: AppTypography.number,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20 * scale),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20 * scale),
                    child: LinearProgressIndicator(
                      value: league.progressRatio.clamp(0.0, 1.0),
                      minHeight: 16 * scale,
                      backgroundColor: _border,
                      valueColor: const AlwaysStoppedAnimation(_accent),
                    ),
                  ),
                  SizedBox(height: 18 * scale),
                  Text(
                    hasNext
                        ? context.l10n.leagueNextThreshold(
                            nextLeagueName!,
                            nextThreshold,
                            pointsLeft,
                          )
                        : context.l10n.leagueTopReached,
                    style: _bodyStyle(scale, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24 * scale),
            Text(
              _remainingLabel(context.l10n),
              style: _bodyStyle(scale, color: _muted),
            ),
            SizedBox(height: 30 * scale),
            _rule(
              scale,
              title: context.l10n.leagueHowPointsTitle,
              body: context.l10n.leagueHowPointsBody,
            ),
            SizedBox(height: 24 * scale),
            _rule(
              scale,
              title: context.l10n.leagueNewSeasonTitle,
              body: context.l10n.leagueNewSeasonBody,
            ),
            SizedBox(height: 36 * scale),
            DepthPressableButton(
              text: context.l10n.commonGotIt,
              width: 594 * scale,
              height: 96 * scale,
              radius: 24 * scale,
              shadowOffset: 8 * scale,
              backgroundColor: _accent,
              shadowColor: _accentDepth,
              fontSize: 28 * scale,
              onPressed: onClose,
            ),
          ],
        ),
      ),
    );
  }

  Widget _rule(double scale, {required String title, required String body}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: AppTypography.family,
              fontSize: 28 * scale,
              fontWeight: AppTypography.label,
            ),
          ),
          SizedBox(height: 6 * scale),
          Text(body, style: _bodyStyle(scale, color: _muted)),
        ],
      ),
    );
  }

  TextStyle _bodyStyle(double scale, {required Color color}) => TextStyle(
        color: color,
        fontFamily: AppTypography.family,
        fontSize: 25 * scale,
        fontWeight: AppTypography.body,
        height: 1.35,
      );
}
