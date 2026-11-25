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
  String get ticketsOut => 'Biletat mbaruan';

  @override
  String get ticketsUnit => 'bileta';

  @override
  String ticketsNextIn(String time) {
    return '1 biletë pas $time';
  }

  @override
  String get ticketsRenewing => 'Bileta po rinovohet';

  @override
  String get ticketsSoon => 'Së shpejti';

  @override
  String ticketsHoursMinutes(int hours, int minutes) {
    return '$hours orë $minutes min';
  }

  @override
  String ticketsMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get ticketsUnderMinute => '<1 min';

  @override
  String ticketsCapEveryHours(int hours) {
    return 'Pasi shpenzohet, rinovohet 1 çdo $hours orë';
  }

  @override
  String ticketsCapEveryMinutes(int minutes) {
    return 'Pasi shpenzohet, rinovohet 1 çdo $minutes minuta';
  }

  @override
  String ticketsCapMax(int max) {
    return 'Mblidhen deri në $max bileta';
  }

  @override
  String get ticketsEarnFree => 'FITO FALAS';

  @override
  String get ticketsReviewOn => 'Fito tani';

  @override
  String get ticketsQuests => 'Detyrat';

  @override
  String get ticketsQuestsLeft => 'Mbeten sot';

  @override
  String get ticketsQuestsDone => 'Rinovohen nesër';

  @override
  String get ticketsQuestsDaily => 'Detyrat ditore';

  @override
  String get ticketsPremiumTitle => 'BILETAT MOS MBAROFSHIN';

  @override
  String get ticketsPremiumBody => 'Luaj pa pritur me Premium';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Korrigjo $count gabime',
      one: 'Korrigjo 1 gabim',
    );
    return '$_temp0';
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

  @override
  String get pathBackToCurrent => 'Kthehu te pakoja jote';

  @override
  String pathReviewCount(int count) {
    return '$count përsëritje';
  }

  @override
  String pathWordCount(int count) {
    return '$count fjalë';
  }

  @override
  String pathNewProgress(int done, int goal) {
    return '$done/$goal të reja';
  }

  @override
  String get pathPractice => 'Praktikë';

  @override
  String pathNewWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fjalë të reja',
      one: '1 fjalë e re',
    );
    return '$_temp0';
  }

  @override
  String pathWordsProgress(int done, int total) {
    return '$done/$total fjalë';
  }

  @override
  String pathGoalPercent(int percent) {
    return '$percent%';
  }

  @override
  String pathNodeDone(String label) {
    return '$label, u krye';
  }

  @override
  String get pathNextArticle => 'Përsëritja e radhës e artikujve';

  @override
  String get pathNextDeck => 'Pakoja e radhës';

  @override
  String get pathGateDone => 'Fundi i njësisë, qëllimi u arrit';

  @override
  String get pathGatePlay => 'Përforcim, luaj';

  @override
  String get pathGateLocked => 'Fundi i njësisë, përforcim';

  @override
  String get actionContinue => 'VAZHDO';

  @override
  String get actionContinueSpoken => 'Vazhdo';

  @override
  String get actionStart => 'FILLO';

  @override
  String get actionStartSpoken => 'Fillo';

  @override
  String get actionReview => 'PËRSËRIT';

  @override
  String get actionReviewSpoken => 'Përsërit';

  @override
  String get actionPractice => 'PRAKTIKË';

  @override
  String get actionPracticeSpoken => 'Praktiko';

  @override
  String pathDueBadge(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fjalë presin përsëritje',
      one: '1 fjalë pret përsëritje',
    );
    return '$_temp0';
  }

  @override
  String pathSheetDeckWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Në këtë pako të presin $count fjalë të reja.',
      one: 'Në këtë pako të pret 1 fjalë e re.',
    );
    return '$_temp0';
  }

  @override
  String pathSheetUnitDone(int percent) {
    return 'Pakot e kësaj njësie mbaruan. Njësia e radhës hapet kur përforcohet $percent% e fjalëve; përsëritjet i përforcojnë ato.';
  }

  @override
  String pathMoreWords(int count) {
    return '+$count fjalë të tjera';
  }

  @override
  String pathOpensAfterDeck(int deck) {
    return 'Hapet pasi të mbarojë Pakoja $deck.';
  }

  @override
  String get pathOpensAfterUnit => 'Hapet pasi të mbarojë njësia e mëparshme.';

  @override
  String pathWordsToMeet(int count) {
    return '$count fjalë që do të njohësh';
  }

  @override
  String pathSheetDoneSummary(int count, int consolidated, String suffix) {
    return 'U njohe me $count fjalë · $consolidated u përforcuan';
  }

  @override
  String pathSheetCurrentSummary(int done, int goal, int reviews) {
    return '$done/$goal fjalë të reja · $reviews përsëritje';
  }

  @override
  String get wordStatusDue => 'Koha për përsëritje';

  @override
  String get wordStatusConsolidated => 'E përforcuar';

  @override
  String get wordStatusLearning => 'Po mësohet';

  @override
  String get authEnterEmail => 'Shkruaj adresën e email-it.';

  @override
  String get authInvalidEmail => 'Shkruaj një adresë email-i të vlefshme.';

  @override
  String get authEnterPassword => 'Shkruaj fjalëkalimin.';

  @override
  String get authAppleLoginFailed => 'Hyrja me Apple nuk u krye. Provo sërish.';

  @override
  String get authGoogleLoginFailed =>
      'Hyrja me Google nuk u krye. Provo sërish.';

  @override
  String get authWrongCredentials => 'Email-i ose fjalëkalimi është i gabuar.';

  @override
  String get authNoConnection => 'Lidhja nuk u realizua. Kontrollo internetin.';

  @override
  String get authLoginUnavailable =>
      'Hyrja nuk është e mundur tani. Provo sërish.';

  @override
  String get authGoogleLoginCanceled => 'Hyrja me Google u anulua.';

  @override
  String get authAppleLoginCanceled => 'Hyrja me Apple u anulua.';

  @override
  String get authEmailHint => 'Email';

  @override
  String get authPasswordHint => 'Fjalëkalimi';

  @override
  String get authSigningInGoogle => 'Po hyn me Google...';

  @override
  String get authSigningInApple => 'Po hyn me Apple...';

  @override
  String get authSigningIn => 'Po hyn...';

  @override
  String get authForgotPassword => 'Harrova fjalëkalimin';

  @override
  String get authSignInApple => 'Hyr me Apple';

  @override
  String get authSignInGoogle => 'Hyr me Google';

  @override
  String get authNoAccount => 'Nuk ke llogari? ';

  @override
  String get authSignUp => 'Regjistrohu';

  @override
  String get authSignIn => 'Hyr';

  @override
  String get authFirstNameRequired => 'Shkruaj emrin.';

  @override
  String get authLastNameRequired => 'Shkruaj mbiemrin.';

  @override
  String get authPasswordRule =>
      'Fjalëkalimi duhet të ketë të paktën 6 karaktere dhe një numër.';

  @override
  String get authDuplicateEmail =>
      'Ekziston tashmë një llogari me këtë adresë email-i.';

  @override
  String get authDuplicateName =>
      'Llogaria nuk u krijua me këtë emër. Provo një emër ose mbiemër tjetër.';

  @override
  String get authCheckDetails => 'Kontrollo të dhënat dhe provo sërish.';

  @override
  String get authSignUpUnavailable =>
      'Llogaria nuk mund të krijohet tani. Provo sërish.';

  @override
  String get authCreatedLoginFailed =>
      'Llogaria u krijua, por hyrja nuk u krye. Provo sërish.';

  @override
  String get authGoogleContinueCanceled => 'Vazhdimi me Google u anulua.';

  @override
  String get authGoogleContinueFailed =>
      'Vazhdimi me Google nuk u krye. Provo sërish.';

  @override
  String get authAppleContinueCanceled => 'Vazhdimi me Apple u anulua.';

  @override
  String get authAppleContinueFailed =>
      'Vazhdimi me Apple nuk u krye. Provo sërish.';

  @override
  String get authContinueApple => 'Vazhdo me Apple';

  @override
  String get authContinueGoogle => 'Vazhdo me Google';

  @override
  String get authHaveAccount => 'Ke llogari? ';

  @override
  String get authFirstNameHint => 'Emri';

  @override
  String get authLastNameHint => 'Mbiemri';

  @override
  String get authCreateProfile => 'Krijo profilin tënd';

  @override
  String get authOr => 'ose';

  @override
  String get premiumChoosePlan => 'Zgjidh planin';

  @override
  String premiumTrialDaysFree(int days) {
    return '$days ditë falas';
  }

  @override
  String get premiumYearly => 'Vjetor';

  @override
  String premiumYearlyDetail(String perMonth, int percent) {
    return '$perMonth/muaj · kursen $percent%';
  }

  @override
  String get premiumPerYear => '/ vit';

  @override
  String get premiumRecommended => 'I REKOMANDUAR';

  @override
  String get premiumMonthly => 'Mujor';

  @override
  String get premiumMonthlyDetail => 'Rinovohet çdo muaj';

  @override
  String get premiumPerMonth => '/ muaj';

  @override
  String get commonBack => 'Prapa';

  @override
  String premiumRenewalYearly(String price) {
    return '$price në vit';
  }

  @override
  String premiumRenewalMonthly(String price) {
    return '$price në muaj';
  }

  @override
  String premiumCancelAnytime(String store) {
    return 'Mund të anulohet në çdo kohë në $store.';
  }

  @override
  String premiumTryFree(int days) {
    return 'PROVO $days DITË FALAS';
  }

  @override
  String get premiumGoPremium => 'KALO NË PREMIUM';

  @override
  String premiumTermsTrial(int days, String renewal) {
    return 'Stelinda Premium: $days ditë falas, pastaj $renewal. Nëse nuk anulohet të paktën 24 orë para përfundimit të provës ose të periudhës, abonimi ';
  }

  @override
  String premiumTerms(String renewal) {
    return 'Stelinda Premium: $renewal. Nëse nuk anulohet të paktën 24 orë para përfundimit të periudhës, abonimi ';
  }

  @override
  String get premiumAutoRenews => 'rinovohet automatikisht';

  @override
  String get premiumTermsEnd =>
      '. Nëse anulohet, Premium mbetet i disponueshëm deri në fund të periudhës.';

  @override
  String get premiumRestore => 'Rikthe blerjet';

  @override
  String get legalTerms => 'Kushtet e përdorimit';

  @override
  String get legalPrivacy => 'Politika e privatësisë';

  @override
  String get premiumUnlimitedTickets => 'Bileta të pakufizuara';

  @override
  String get premiumWeeklyFreezes => '2 mbrojtje serie në javë';

  @override
  String get premiumAllContent => 'Të gjitha mësimet';

  @override
  String get premiumHeadlineStart => 'Ngrije gjermanishten\n';

  @override
  String get premiumHeadlineAccent => 'mbi re';

  @override
  String get premiumHeadlineEnd => '';

  @override
  String get premiumSubtitle =>
      'Mëso pa pushim me bileta pa kufi dhe mbrojtje.';

  @override
  String get commonClose => 'Mbyll';

  @override
  String get premiumFree => 'FALAS';

  @override
  String get summaryPracticeDone => 'Praktika u krye!';

  @override
  String get summaryReinforceDone => 'Përforcimi u krye!';

  @override
  String summaryDeckDone(int deck) {
    return 'Pakoja $deck u krye!';
  }

  @override
  String get summaryReviewDone => 'Përsëritja u krye!';

  @override
  String get summaryOneMoreRound => 'EDHE NJË RAUND';

  @override
  String get summaryPractice => 'PRAKTIKO';

  @override
  String summaryPracticedWords(int count) {
    return 'Praktikove $count fjalë.\nFjalët përforcohen te përforcimi.';
  }

  @override
  String summaryConsolidated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fjalë u përforcuan.',
      one: '1 fjalë u përforcua.',
    );
    return '$_temp0';
  }

  @override
  String get summaryNoneConsolidated =>
      'Në këtë raund nuk u përforcua asnjë fjalë.';

  @override
  String summaryGoalLeft(String gained, int left) {
    return '$gained\nDeri te qëllimi mbeten $left fjalë.';
  }

  @override
  String summaryGoalReached(String gained) {
    return '$gained\nE arrite qëllimin.';
  }

  @override
  String summaryMetWords(int count) {
    return 'U njohe me $count fjalë';
  }

  @override
  String summaryReviewedWords(int count) {
    return 'Përsërite $count fjalë';
  }

  @override
  String summaryLearnedConsolidated(String learned, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fjalë u përforcuan.',
      one: '1 fjalë u përforcua.',
    );
    return '$learned, $_temp0';
  }

  @override
  String summaryLearnedDeck(String learned) {
    return '$learned.\nPërforcimi hapet kur mbarojnë pakot.';
  }

  @override
  String get statPoints => 'PIKË';

  @override
  String get statCorrect => 'SAKTË';

  @override
  String get statRevenge => 'REVANSH';

  @override
  String pointsCount(int count) {
    return '$count pikë';
  }

  @override
  String leaguePointsTo(String league, String points) {
    return '$points deri te Liga $league';
  }

  @override
  String get questsTicketsFull =>
      'Biletat e tua janë plot. Luaj pak, pastaj merre shpërblimin — detyra të pret.';

  @override
  String questsFreezeCap(int cap) {
    return 'Mund të mbahen deri në $cap mbrojtje të serisë.';
  }

  @override
  String get questsFreezeClaimed => 'Mbrojtja e serisë u mor.';

  @override
  String get questsDemoTitle => 'Arrij një seri 3-ditore';

  @override
  String get questsDaily => 'DETYRAT DITORE';

  @override
  String get questsAllDoneToday => 'I mbarove të gjitha detyrat e sotme.';

  @override
  String get questsTitle => 'Detyrat';

  @override
  String questsProgress(int done, int total) {
    return '$done/$total detyra';
  }

  @override
  String get questsFreezeTaken => 'Mbrojtja e serisë u mor';

  @override
  String questsRewardFreeze(String head) {
    return '$head · për mbrojtje të serisë';
  }

  @override
  String get questsGoalLabel => 'QËLLIMI I SOTËM';

  @override
  String get questsAllDone => 'I mbarove të gjitha!';

  @override
  String get questsFinishAll => 'Mbaro çdo detyrë';

  @override
  String get questsFreezeReadySpoken => 'Mbrojtja e serisë është gati, merre';

  @override
  String get questsFreezeReady => 'Mbrojtja e serisë gati';

  @override
  String get questsRefreshing => 'PO RINOVOHET';

  @override
  String questsHoursMinutesShort(int hours, int minutes) {
    return '$hours ORË $minutes MIN';
  }

  @override
  String questsMinutesShort(int minutes) {
    return '$minutes MIN';
  }

  @override
  String get questsRefreshingSpoken => 'Detyrat po rinovohen';

  @override
  String questsRefreshInHours(int hours, int minutes) {
    return 'Detyrat rinovohen për $hours orë e $minutes minuta';
  }

  @override
  String questsRefreshInMinutes(int minutes) {
    return 'Detyrat rinovohen për $minutes minuta';
  }

  @override
  String questsClaimReward(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Merr shpërblimin: $count bileta',
      one: 'Merr shpërblimin: 1 biletë',
    );
    return '$_temp0';
  }

  @override
  String get questsFreezeTodayClaimed => 'Mbrojtja e sotme e serisë u mor.';

  @override
  String get questsFreezeAfterAll =>
      'Mbrojtja e serisë merret kur mbarojnë të gjitha detyrat.';

  @override
  String get questsFreeze => 'Mbrojtja e serisë';

  @override
  String get questsLoadFailed =>
      'Detyrat nuk u ngarkuan.\nTërhiq poshtë për të provuar sërish.';

  @override
  String get leagueMonthlySeason => 'Sezon mujor';

  @override
  String leagueSeasonOf(String monthYear) {
    return 'Sezoni i muajit $monthYear';
  }

  @override
  String get leagueSeasonRenewing => 'Sezoni po rinovohet';

  @override
  String leagueSeasonEndsDays(int days, int hours) {
    return 'Deri në fund të sezonit: $days ditë $hours orë';
  }

  @override
  String leagueSeasonEndsHours(int hours, int minutes) {
    return 'Deri në fund të sezonit: $hours orë $minutes min';
  }

  @override
  String leagueSeasonEndsMinutes(int minutes) {
    return 'Deri në fund të sezonit: $minutes min';
  }

  @override
  String leagueNamed(String name) {
    return 'Liga $name';
  }

  @override
  String get leagueYourPoints => 'Pikët e tua në ligë';

  @override
  String leagueNextThreshold(String league, int threshold, int left) {
    return '$threshold pikë për $league · mbeten $left';
  }

  @override
  String get leagueTopReached => 'Je në ligën më të lartë';

  @override
  String get leagueHowPointsTitle => 'Si fitohen pikët?';

  @override
  String get leagueHowPointsBody =>
      'Në Karty, përgjigjja e saktë jep +1 pikë, me Boost +3.';

  @override
  String get leagueNewSeasonTitle => 'Çfarë ndodh në sezonin e ri?';

  @override
  String get leagueNewSeasonBody =>
      'Çdo muaj fillon një sezon i ri. Fillon një nivel më poshtë se liga jote e fundit; për çdo muaj shtesë pa luajtur bie edhe një nivel (deri te Mërkuri).';

  @override
  String get commonGotIt => 'E KUPTOVA';

  @override
  String get leagueInfoButton => 'Informacion për ligën dhe sezonin';

  @override
  String get countdownRenewing => 'Po rinovohet';

  @override
  String countdownDays(int days) {
    return '$days ditë';
  }

  @override
  String countdownHours(int hours) {
    return '$hours orë';
  }

  @override
  String countdownMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String leagueSeasonEndsIn(String value) {
    return 'Deri në fund të sezonit: $value';
  }

  @override
  String get leagueSoloSceneLabel =>
      'Maskota ngul flamurin në planetin e ligës';

  @override
  String leagueFirstToReach(String league) {
    return 'Je i pari që arrin në Ligën $league';
  }

  @override
  String get leagueRivalsComing => 'Rivalë të rinj janë në rrugë.';

  @override
  String leagueEntryPoints(int count) {
    return '$count pikë';
  }

  @override
  String get wordsLoadFailed =>
      'Fjalët nuk u ngarkuan. Mund të provosh sërish.';

  @override
  String get wordsMoreFailed => 'Fjalët e tjera nuk u ngarkuan.';

  @override
  String get commonTryAgain => 'Provo sërish';

  @override
  String get wordsSoundOff =>
      'Zëri është i fikur. Ndize për të dëgjuar shqiptimin.';

  @override
  String get wordsTurnSoundOn => 'Ndiz zërin';

  @override
  String get wordsTitle => 'Fjalët e mia';

  @override
  String get wordsCollection => 'Koleksioni yt i fjalëve';

  @override
  String wordsMetCount(int count) {
    return 'U njohe me $count fjalë';
  }

  @override
  String get wordsSubtitle => 'Shfleto sërish fjalët e tua dhe dëgjoji.';

  @override
  String get wordsFilterAll => 'Të gjitha';

  @override
  String get wordsFilterNew => 'Të reja';

  @override
  String get wordsFilterDue => 'Përsëritje';

  @override
  String get wordsFilterArticle => 'Artikuj';

  @override
  String get wordsHeader => 'FJALËT';

  @override
  String get wordsEmptyNew => 'Nuk ka fjalë të njohura rishtazi.';

  @override
  String get wordsEmptyDue => 'Tani nuk ka fjalë për përsëritje.';

  @override
  String get wordsEmptyArticle => 'Nuk ka fjalë për të praktikuar artikujt.';

  @override
  String get wordsEmptyAll => 'Ende nuk je njohur me asnjë fjalë.';

  @override
  String get commonTryAgainCaps => 'PROVO SËRISH';

  @override
  String get wordStatusPracticeArticle => 'Praktiko artikullin';

  @override
  String get wordStatusNew => 'E njohur rishtazi';

  @override
  String get wordStatusStudied => 'E studiuar';

  @override
  String wordListenTo(String word) {
    return 'Dëgjo shqiptimin e $word';
  }

  @override
  String get wordListenHintMuted => 'Për ta dëgjuar, ndiz fillimisht zërin';

  @override
  String get wordListenHintReplay => 'Luaje sërish shqiptimin';

  @override
  String get wordListenTipMuted => 'Ndiz zërin dhe dëgjo';

  @override
  String get wordListenTip => 'Dëgjo shqiptimin';

  @override
  String settingsVersion(String version) {
    return 'Versioni $version';
  }

  @override
  String get settingsSound => 'Zëri';

  @override
  String get settingsVibration => 'Dridhja';

  @override
  String get settingsManageSubscription => 'Menaxho abonimin';

  @override
  String get settingsSignOut => 'Dil nga llogaria';

  @override
  String get settingsDeleteAccount => 'Fshi llogarinë';

  @override
  String get settingsNoConnection =>
      'Lidhja nuk u realizua. Kontrollo internetin dhe provo sërish.';

  @override
  String get settingsDeleteFailed => 'Llogaria nuk u fshi. Provo sërish.';

  @override
  String get deleteAccountTitle => 'Të fshihet llogaria?';

  @override
  String get deleteAccountBody =>
      'Pikët, seria, fjalët e mësuara dhe renditja në ligë fshihen përgjithmonë. Ky veprim nuk mund të zhbëhet.';

  @override
  String get deleteAccountConfirm => 'FSHI LLOGARINË TIME';

  @override
  String get commonCancel => 'Anulo';

  @override
  String get profileTopLeague => 'Liga më e lartë';

  @override
  String get profileNextLeague => 'Liga e radhës';

  @override
  String get profileAtTop => 'Je në majë';

  @override
  String profilePointsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mbeten $count pikë',
      one: 'Mbetet 1 pikë',
    );
    return '$_temp0';
  }

  @override
  String profileStreakBadge(int days) {
    return 'Distinktivi $days-ditor';
  }

  @override
  String profileDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mbeten $count ditë',
      one: 'Mbetet 1 ditë',
    );
    return '$_temp0';
  }

  @override
  String get statWords => 'FJALË';

  @override
  String get statArticles => 'ARTIKUJ';

  @override
  String get statLeaderboard => 'RENDITJA';

  @override
  String profileWordsOpen(String count) {
    return '$count fjalë, hap Fjalët e mia';
  }

  @override
  String profileRevengeWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count karta revanshi të presin',
      one: '1 kartë revanshi të pret',
    );
    return '$_temp0';
  }

  @override
  String get profileRevengeNone => 'Nuk ke karta revanshi';

  @override
  String get profileRevengeWin => 'Fito sërish ato që gabove';

  @override
  String get profileRevengeCollect => 'Përgjigjet e gabuara mblidhen këtu';

  @override
  String get profileDailyStreak => 'ditë rresht';

  @override
  String get streakGalaxy => 'Je në nivelin e galaktikës!';

  @override
  String get streakKeepRhythm => 'Ruaje ritmin!';

  @override
  String get streakGreat => 'Po shkon shkëlqyeshëm!';

  @override
  String get streakRiseUp => 'Vazhdo të ngjitesh!';

  @override
  String get streakStretch => 'Koha të zgjatësh trurin!';

  @override
  String get streakMedal => 'Fito medaljen tënde!';

  @override
  String get streakConsistency => 'Qëndrueshmëria të forcon!';

  @override
  String get streakMissedYou => 'Na mungove!';

  @override
  String get streakCatchWind => 'Kape erën!';

  @override
  String get streakProtected => 'Seria jote u mbrojt!';

  @override
  String get streakLongest => 'Seria jote më e gjatë!';

  @override
  String get streakContinues => 'Seria jote vazhdon!';

  @override
  String get streakComeBack => 'Kthehu sot!';

  @override
  String streakAtRiskTitle(int days) {
    return 'Seria jote $days-ditore është në rrezik';
  }

  @override
  String streakFreezeKicked(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Mungove $days ditë, por mbrojtja e serisë hyri në veprim.',
      one: 'Mungove një ditë, por mbrojtja e serisë hyri në veprim.',
    );
    return '$_temp0';
  }

  @override
  String streakFreezeAsk(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Mungove $days ditë. Të përdoret mbrojtja e serisë?',
      one: 'Mungove një ditë. Të përdoret mbrojtja e serisë?',
    );
    return '$_temp0';
  }

  @override
  String streakFreezeCost(int spent, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      spent,
      locale: localeName,
      other: 'Shpenzohen $spent, mbeten $left',
      one: 'Shpenzohet 1, mbeten $left',
    );
    return '$_temp0';
  }

  @override
  String get streakDayStreakLabel => 'ditë rresht';

  @override
  String get streakFreezesLeftLabel => 'mbrojtje mbeten';

  @override
  String get streakUseFreeze => 'PËRDOR MBROJTJEN';

  @override
  String get streakDeclineFreeze => 'JO, LE TË RIFILLOJË SERIA';

  @override
  String articlePickSpoken(String article) {
    return 'Zgjidh $article';
  }

  @override
  String get gameExit => 'Dil nga loja';

  @override
  String articleCorrectFeedback(String phrase) {
    return 'Saktë! $phrase';
  }

  @override
  String get articleAllDoneTitle => 'Punë e shkëlqyer!';

  @override
  String get articleAllDoneBody =>
      'Për momentin nuk ka karta artikujsh për të praktikuar.';

  @override
  String get actionMainMenu => 'KTHEHU NË FILLIM';

  @override
  String get commonGoBackCaps => 'KTHEHU';

  @override
  String get articleLockedTitle => 'Busulla e Artikujve po përgatitet';

  @override
  String articleLockedBody(int count) {
    return 'Hapet pasi të mësosh $count fjalë të ndryshme Karty';
  }

  @override
  String get actionPlayKarty => 'LUAJ KARTY';

  @override
  String get reviewDoneTitle => 'Revanshi u krye!';

  @override
  String get reviewDoneBody =>
      'U ndeshe sërish me fjalët Karty dhe i forcove ato që mësove.';

  @override
  String reviewDoneTickets(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fitove +$count bileta',
      one: 'Fitove +1 biletë',
    );
    return '$_temp0';
  }

  @override
  String get reviewDoneStronger => 'Njohuritë e tua u forcuan';

  @override
  String get pauseSpoken => 'Loja u ndal';

  @override
  String get pauseTitle => 'Në pauzë';

  @override
  String get pauseCorrectStreak => 'Seri përgjigjesh të sakta';

  @override
  String reminderStreakTitle(int streak) {
    return 'Seria jote $streak-ditore të pret';
  }

  @override
  String get reminderStreakBody => 'Luaj një lojë sot që seria të vazhdojë.';

  @override
  String get reminderMissedTitle => 'Na mungon';

  @override
  String get reminderMissedBody => 'Vazhdo aty ku e le me disa fjalë.';

  @override
  String get reminderInviteTitle => 'Fjalët e sotme janë gati';

  @override
  String get reminderInviteBody => 'Mjaftojnë pak minuta në ditë.';

  @override
  String get reminderChannelName => 'Kujtesë ditore';

  @override
  String get reminderChannelDescription =>
      'Të kujton më së shumti një herë në ditë nëse nuk ke luajtur.';

  @override
  String get kartyLoadError => 'Ndodhi një gabim gjatë ngarkimit të Karty.';

  @override
  String get commonErrorRetry => 'Ndodhi një gabim. Provo sërish.';

  @override
  String get kartyPromptNewWord => 'Fjalë e re';

  @override
  String get kartyPromptPickImage => 'Gjej figurën';

  @override
  String get kartyPromptPickArticle => 'Zgjidh artikullin';

  @override
  String get kartyPromptArrange => 'Rendit shkronjat';

  @override
  String get kartyPromptListen => 'Gjej atë që dëgjon';

  @override
  String get kartyTimeUp => 'Koha mbaroi';

  @override
  String get soundOffSpoken => 'Zëri i shqiptimit është i fikur';

  @override
  String get soundOnSpoken => 'Zëri i shqiptimit është i ndezur';

  @override
  String get soundTurnOn => 'Ndiz zërin';

  @override
  String get soundTurnOff => 'Fik zërin';

  @override
  String get gameResumeSpoken => 'Vazhdo lojën';

  @override
  String get gamePauseSpoken => 'Ndal lojën';

  @override
  String get kartyImageOption => 'Opsion figure';

  @override
  String kartyRemoveLetter(String letter) {
    return 'Hiq shkronjën $letter';
  }

  @override
  String get kartyListenWord => 'Dëgjo fjalën';

  @override
  String get kartyListenSlow => 'Dëgjo ngadalë';

  @override
  String kartyLeaguePointsSpoken(int points) {
    return '$points pikë në ligë';
  }

  @override
  String kartyLeaguePointsBoostSpoken(int points) {
    return '$points pikë në ligë. Pikët e trefishta janë aktive.';
  }

  @override
  String get kartyBoostReadySpoken =>
      'Boost-i gati. Aktivizoje për 20 sekonda pikë të trefishta në ligë';

  @override
  String get kartyBoostEnergySpoken => 'Energjia e Boost-it';

  @override
  String get profileNextGoals => 'QËLLIMET E RADHËS';

  @override
  String get profileToday => 'SOT';

  @override
  String get profileTotal => 'GJITHSEJ';

  @override
  String get profileWordsLink => 'FJALËT E MIA  ›';

  @override
  String get profileWordsLinkSpoken => 'Hap Fjalët e mia';

  @override
  String get leagueSaveFailed =>
      'Informacioni i ligës nuk u ruajt. Provo sërish.';

  @override
  String get leaguePromotedLabel => 'KALOVE LIGËN';

  @override
  String leaguePromotedFrom(String name) {
    return 'U ngjite nga Liga $name.';
  }

  @override
  String get reviewStationSpoken => 'Revansh Karty';

  @override
  String get pathLoadFailed => 'Rruga jote nuk u ngarkua.';

  @override
  String get welcomeTitle => 'Mëso gjermanisht duke luajtur';

  @override
  String get welcomeSubtitle => 'Mjaftojnë pak minuta në ditë.';

  @override
  String get welcomeStart => 'Fillo falas';

  @override
  String get welcomeHaveAccount => 'Kam tashmë llogari';

  @override
  String get unitSaveFailed =>
      'Informacioni i njësisë nuk u ruajt. Provo sërish.';

  @override
  String unitUnlockedLabel(int number) {
    return 'NJËSIA $number U HAP';
  }

  @override
  String unitNewWordsWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Të presin $count fjalë të reja.',
      one: 'Të pret 1 fjalë e re.',
    );
    return '$_temp0';
  }

  @override
  String unitLabel(int number) {
    return 'NJËSIA $number';
  }

  @override
  String unitWordsWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Të presin $count fjalë',
      one: 'Të pret 1 fjalë',
    );
    return '$_temp0';
  }

  @override
  String unitWordsConsolidated(int done, int total) {
    return '$done/$total fjalë të përforcuara';
  }

  @override
  String streakDayNumber(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Dita $days',
      zero: '0 ditë',
    );
    return '$_temp0';
  }

  @override
  String get questDoneTitle => 'Detyra u krye!';

  @override
  String questRewardTickets(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count bileta',
      one: '+1 biletë',
    );
    return '$_temp0';
  }

  @override
  String get pronunciationOff => 'Shqiptimi i fikur';

  @override
  String get navHome => 'Kreu';

  @override
  String get navLeagues => 'Ligat';

  @override
  String get navQuests => 'Detyrat';

  @override
  String get navPremium => 'Premium';

  @override
  String get navProfile => 'Profili';

  @override
  String get subscriptionOpenFailed =>
      'Faqja e abonimit nuk u hap. Provo sërish.';

  @override
  String get networkTimeout => 'Lidhjes i mbaroi koha. Provo sërish më vonë.';

  @override
  String get signedOut => 'Dole nga llogaria. Shihemi së shpejti!';

  @override
  String get accountDeleted => 'Llogaria jote u fshi.';

  @override
  String get questsCompleted => 'TË KRYERA';

  @override
  String get authEnterDetails => 'Shkruaj të dhënat';

  @override
  String get gameOpenFailed => 'Loja nuk u hap. Provo sërish më vonë.';

  @override
  String get loadingSpoken => 'Po ngarkohet';

  @override
  String get weekdaysShort => 'Hën Mar Mër Enj Pre Sht Die';

  @override
  String get monthNames =>
      'janar shkurt mars prill maj qershor korrik gusht shtator tetor nëntor dhjetor';

  @override
  String get questsClaimShort => 'MERR';

  @override
  String profileFreezeUnit(int count) {
    return 'mbrojtje';
  }

  @override
  String rankOrdinal(int rank) {
    return '#$rank';
  }
}
