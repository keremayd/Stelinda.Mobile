// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get accountDeletionAppleCanceled =>
      'Miratimi i Apple nuk u mor, llogaria nuk u fshi.';

  @override
  String get leagueMerkur => 'Mërkuri';

  @override
  String get leagueAytasi => 'Guri i Hënës';

  @override
  String get leagueYildiz => 'Ylli';

  @override
  String get leagueKuyruklu => 'Kometa';

  @override
  String get leagueMars => 'Marsi';

  @override
  String get leagueUranus => 'Urani';

  @override
  String get leagueSaturn => 'Saturni';

  @override
  String get leagueNebula => 'Mjegullnaja';

  @override
  String get leagueKosmoz => 'Kozmosi';

  @override
  String get leagueSupernova => 'Supernova';

  @override
  String get leaguePulsar => 'Pulsari';

  @override
  String pathDeck(int number) {
    return 'Pako $number';
  }

  @override
  String get pathReview => 'Përsëritje';

  @override
  String get pathReinforce => 'Përforcim';

  @override
  String get pathArticle => 'Artikulli';

  @override
  String get pathArticleDetail => 'përsëritje der/die/das';

  @override
  String pathArticleProgress(int done, int goal) {
    return '$done/$goal artikuj';
  }

  @override
  String pathReviewStationDetail(int count) {
    return 'Korrigjo $count gabime';
  }

  @override
  String get pathReviewStationEmpty => 'S\'ke gabime';

  @override
  String get stepIntroStart => 'FILLO';

  @override
  String get introDeckTitle => 'Pako';

  @override
  String introDeckTagline(int count) {
    return '$count fjalë të reja';
  }

  @override
  String get introDeckRow1 => 'Fjalët prezantohen me figura';

  @override
  String get introDeckRow2 => 'Pakoja mbaron kur dihen të gjitha';

  @override
  String get introArticleRow1 => 'Tërhiqe kartën te artikulli i saktë';

  @override
  String get introArticleRow2 => 'Artikujt e harruar kthehen';

  @override
  String get introReinforceTagline => 'Hapi i fundit i njësisë';

  @override
  String get introReinforceRow1 => 'Fjala e ditur saktë përforcohet';

  @override
  String introReinforceRow2(int percent) {
    return 'Me $percent% të përforcuara hapet njësia e re';
  }

  @override
  String get introReviewTitle => 'Revansh';

  @override
  String get introReviewTagline => 'Përsëritja e gabimeve';

  @override
  String get introReviewRow1 => 'Kartat e gabuara mblidhen këtu';

  @override
  String get introReviewRow2 => 'Kur korrigjohen të gjitha, fitohet 1 biletë';

  @override
  String get articleStepDoneTitle => 'Artikujt u kryen!';

  @override
  String articleStepDoneBody(int goal) {
    return '$goal artikuj u gjetën saktë. Të harruarit pyeten përsëri.';
  }

  @override
  String get articleStepContinue => 'VAZHDO';

  @override
  String pathUnlockHint(int unit, String unitSuffix, int percent) {
    return 'Hapet kur përforcohet $percent% e Njësisë $unit';
  }

  @override
  String unitUnlockReason(int unit, String unitSuffix, int percent) {
    return 'E përforcove $percent% të Njësisë $unit.';
  }

  @override
  String get leagueMemberReport => 'Raporto';

  @override
  String get leagueMemberBlock => 'Blloko';

  @override
  String get leagueMemberCancel => 'Anulo';

  @override
  String get leagueReportTitle => 'Pse po e raporton?';

  @override
  String get leagueReportReasonName => 'Emër i papërshtatshëm';

  @override
  String get leagueReportReasonPhoto => 'Foto e papërshtatshme';

  @override
  String get leagueReportReasonOther => 'Arsye tjetër';

  @override
  String get leagueReportSent => 'Raportimi u mor dhe do të shqyrtohet.';

  @override
  String leagueBlockTitle(String name) {
    return 'Të bllokohet $name?';
  }

  @override
  String get leagueBlockBody =>
      'Nuk do ta shihni më njëri-tjetrin në renditje.';

  @override
  String leagueBlockDone(String name) {
    return '$name u bllokua.';
  }

  @override
  String get leagueModerationFailed =>
      'Nuk u dërgua. Kontrollo lidhjen dhe provo sërish.';

  @override
  String leagueMemberOptions(String name) {
    return 'Opsione për $name';
  }

  @override
  String get premiumStoreUnavailable =>
      'Dyqani nuk arrihet tani. Provo sërish pak më vonë.';

  @override
  String get premiumWelcome =>
      'Mirë se erdhe në Premium! Biletat e tua tani janë të pakufizuara.';

  @override
  String get premiumPurchaseFailed => 'Blerja nuk u përfundua. Provo sërish.';

  @override
  String get premiumPurchasePending =>
      'Blerja pret miratim; Premium hapet pasi të miratohet.';

  @override
  String get premiumNothingToRestore =>
      'Nuk u gjet asnjë abonim aktiv për t\'u rikthyer.';

  @override
  String get premiumActiveTitle => 'Anëtarësimi Premium është aktiv';

  @override
  String get premiumActiveBody =>
      'Biletat janë të pakufizuara, mbrojtjet e serisë mbushen në dy çdo javë.';

  @override
  String get premiumManage => 'MENAXHO ABONIMIN';

  @override
  String get premiumActiveClose => 'Mbyll';

  @override
  String get premiumManageFailed => 'Faqja e abonimit nuk u hap. Provo sërish.';

  @override
  String get ticketsUnlimited => 'Bileta të pakufizuara';

  @override
  String get accountDeletionSubscriptionNote =>
      'Abonimi Premium nuk anulohet bashkë me llogarinë. Që pagesa të ndalet, abonimi duhet anuluar veçmas në App Store.';

  @override
  String get accountDeletionManageSubscription => 'Menaxho abonimin';

  @override
  String get passwordHelpTitle => 'E harrove fjalëkalimin?';

  @override
  String get passwordHelpBody =>
      'Lidhja për rivendosjen e fjalëkalimit do të shtohet së shpejti në aplikacion. Deri atëherë mund t\'i shkruhet mbështetjes nga adresa e email-it e regjistruar në llogari:';

  @override
  String get passwordHelpWrite => 'SHKRUAJI MBËSHTETJES';

  @override
  String get passwordHelpMailSubject => 'Rivendosja e fjalëkalimit';

  @override
  String get passwordHelpCopied =>
      'Aplikacioni i email-it nuk u hap; adresa u kopjua.';

  @override
  String get passwordHelpClose => 'Mbyll';

  @override
  String get settingsTitle => 'Cilësimet';

  @override
  String get profilePhotoChange => 'Ndrysho foton e profilit';

  @override
  String get profilePhotoUpdated => 'Fotoja e profilit u përditësua.';

  @override
  String get profilePhotoFailed => 'Fotoja nuk u ngarkua. Provo përsëri.';
}
