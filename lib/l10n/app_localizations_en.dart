// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accountDeletionAppleCanceled =>
      'Couldn\'t get Apple\'s approval, so your account wasn\'t deleted.';

  @override
  String get leagueMerkur => 'Mercury';

  @override
  String get leagueAytasi => 'Moonstone';

  @override
  String get leagueYildiz => 'Star';

  @override
  String get leagueKuyruklu => 'Comet';

  @override
  String get leagueMars => 'Mars';

  @override
  String get leagueUranus => 'Uranus';

  @override
  String get leagueSaturn => 'Saturn';

  @override
  String get leagueNebula => 'Nebula';

  @override
  String get leagueKosmoz => 'Cosmos';

  @override
  String get leagueSupernova => 'Supernova';

  @override
  String get leaguePulsar => 'Pulsar';

  @override
  String pathDeck(int number) {
    return 'Deck $number';
  }

  @override
  String get pathReview => 'Review';

  @override
  String get pathReinforce => 'Reinforce';

  @override
  String get ticketsOut => 'Out of tickets';

  @override
  String get ticketsUnit => 'tickets';

  @override
  String ticketsNextIn(String time) {
    return '1 ticket in $time';
  }

  @override
  String get ticketsRenewing => 'Refilling ticket';

  @override
  String get ticketsSoon => 'Soon';

  @override
  String ticketsHoursMinutes(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String ticketsMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get ticketsUnderMinute => '<1 min';

  @override
  String ticketsCapEveryHours(int hours) {
    return 'Once used, 1 refills every $hours hours';
  }

  @override
  String ticketsCapEveryMinutes(int minutes) {
    return 'Once used, 1 refills every $minutes minutes';
  }

  @override
  String ticketsCapMax(int max) {
    return 'You can hold up to $max tickets';
  }

  @override
  String get ticketsEarnFree => 'EARN FOR FREE';

  @override
  String get ticketsReviewOn => 'Earn now';

  @override
  String get ticketsQuests => 'Quests';

  @override
  String get ticketsQuestsLeft => 'Left today';

  @override
  String get ticketsQuestsDone => 'Back tomorrow';

  @override
  String get ticketsQuestsDaily => 'Daily quests';

  @override
  String get ticketsPremiumTitle => 'NEVER RUN OUT';

  @override
  String get ticketsPremiumBody => 'Play without waiting with Premium';

  @override
  String get pathArticle => 'Articles';

  @override
  String get pathArticleDetail => 'der/die/das review';

  @override
  String pathArticleProgress(int done, int goal) {
    return '$done/$goal articles';
  }

  @override
  String pathReviewStationDetail(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fix $count mistakes',
      one: 'Fix 1 mistake',
    );
    return '$_temp0';
  }

  @override
  String get pathReviewStationEmpty => 'No mistakes';

  @override
  String get stepIntroStart => 'START';

  @override
  String get introDeckTitle => 'Deck';

  @override
  String introDeckTagline(int count) {
    return '$count new words';
  }

  @override
  String get introDeckRow1 => 'Words are shown with pictures';

  @override
  String get introDeckRow2 => 'Know them all to finish the deck';

  @override
  String get introArticleRow1 => 'Drag the card to its article';

  @override
  String get introArticleRow2 => 'Forgotten articles come back';

  @override
  String get introReinforceTagline => 'The unit\'s last step';

  @override
  String get introReinforceRow1 => 'Words you get right stick';

  @override
  String introReinforceRow2(int percent) {
    return 'The next unit opens at $percent%';
  }

  @override
  String get introReviewTitle => 'Rematch';

  @override
  String get introReviewTagline => 'Replay your mistakes';

  @override
  String get introReviewRow1 => 'Cards you got wrong collect here';

  @override
  String get introReviewRow2 => 'Fix them all to earn 1 ticket';

  @override
  String get articleStepDoneTitle => 'Articles done!';

  @override
  String articleStepDoneBody(int goal) {
    return 'You got $goal articles right. Forgotten ones will come back.';
  }

  @override
  String get articleStepContinue => 'CONTINUE';

  @override
  String pathUnlockHint(int unit, String unitSuffix, int percent) {
    return 'Opens when $percent% of Unit $unit sticks';
  }

  @override
  String unitUnlockReason(int unit, String unitSuffix, int percent) {
    return 'You reinforced $percent% of Unit $unit.';
  }

  @override
  String get leagueMemberReport => 'Report';

  @override
  String get leagueMemberBlock => 'Block';

  @override
  String get leagueMemberCancel => 'Cancel';

  @override
  String get leagueReportTitle => 'Why are you reporting?';

  @override
  String get leagueReportReasonName => 'Inappropriate name';

  @override
  String get leagueReportReasonPhoto => 'Inappropriate photo';

  @override
  String get leagueReportReasonOther => 'Something else';

  @override
  String get leagueReportSent => 'Thanks, we\'ll review your report.';

  @override
  String leagueBlockTitle(String name) {
    return 'Block $name?';
  }

  @override
  String get leagueBlockBody =>
      'You won\'t see each other in the rankings anymore.';

  @override
  String leagueBlockDone(String name) {
    return '$name is blocked.';
  }

  @override
  String get leagueModerationFailed =>
      'Couldn\'t send. Check your connection and try again.';

  @override
  String leagueMemberOptions(String name) {
    return 'Options for $name';
  }

  @override
  String get premiumStoreUnavailable =>
      'The store can\'t be reached right now. Try again in a bit.';

  @override
  String get premiumWelcome =>
      'Welcome to Premium! Your tickets are now unlimited.';

  @override
  String get premiumPurchaseFailed =>
      'The purchase couldn\'t be completed. Try again.';

  @override
  String get premiumPurchasePending =>
      'Your purchase is awaiting approval; Premium turns on once it\'s approved.';

  @override
  String get premiumNothingToRestore =>
      'No active subscription found to restore.';

  @override
  String get premiumActiveTitle => 'Your Premium membership is active';

  @override
  String get premiumActiveBody =>
      'Unlimited tickets, and your streak freezes refill to two every week.';

  @override
  String get premiumManage => 'MANAGE SUBSCRIPTION';

  @override
  String get premiumActiveClose => 'Close';

  @override
  String get premiumManageFailed =>
      'Couldn\'t open the subscription page. Try again.';

  @override
  String get ticketsUnlimited => 'Unlimited tickets';

  @override
  String get accountDeletionSubscriptionNote =>
      'Deleting your account doesn\'t cancel a Premium subscription. Cancel it separately in the App Store to stop payments.';

  @override
  String get accountDeletionManageSubscription => 'Manage subscription';

  @override
  String get passwordHelpTitle => 'Forgot your password?';

  @override
  String get passwordHelpBody =>
      'Password reset is coming to the app soon. Until then, email support from the address on your account:';

  @override
  String get passwordHelpWrite => 'EMAIL SUPPORT';

  @override
  String get passwordHelpMailSubject => 'Password reset';

  @override
  String get passwordHelpCopied =>
      'Couldn\'t open your email app; the address was copied.';

  @override
  String get passwordHelpClose => 'Close';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get profilePhotoChange => 'Change profile photo';

  @override
  String get profilePhotoUpdated => 'Profile photo updated.';

  @override
  String get profilePhotoFailed => 'Couldn\'t upload the photo. Try again.';

  @override
  String get pathBackToCurrent => 'Back to your deck';

  @override
  String pathReviewCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String pathWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0';
  }

  @override
  String pathNewProgress(int done, int goal) {
    return '$done/$goal new';
  }

  @override
  String get pathPractice => 'Practice';

  @override
  String pathNewWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new words',
      one: '1 new word',
    );
    return '$_temp0';
  }

  @override
  String pathWordsProgress(int done, int total) {
    return '$done/$total words';
  }

  @override
  String pathGoalPercent(int percent) {
    return '$percent%';
  }

  @override
  String pathNodeDone(String label) {
    return '$label, done';
  }

  @override
  String get pathNextArticle => 'Upcoming article review';

  @override
  String get pathNextDeck => 'Upcoming deck';

  @override
  String get pathGateDone => 'End of unit, goal reached';

  @override
  String get pathGatePlay => 'Reinforce, play';

  @override
  String get pathGateLocked => 'End of unit, reinforcement';

  @override
  String get actionContinue => 'CONTINUE';

  @override
  String get actionContinueSpoken => 'Continue';

  @override
  String get actionStart => 'START';

  @override
  String get actionStartSpoken => 'Start';

  @override
  String get actionReview => 'REVIEW';

  @override
  String get actionReviewSpoken => 'Review';

  @override
  String get actionPractice => 'PRACTICE';

  @override
  String get actionPracticeSpoken => 'Practice';

  @override
  String pathDueBadge(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words are due for review',
      one: '1 word is due for review',
    );
    return '$_temp0';
  }

  @override
  String pathSheetDeckWaiting(int count) {
    return 'This deck has $count new words waiting for you.';
  }

  @override
  String pathSheetUnitDone(int percent) {
    return 'This unit\'s decks are done. The next unit opens when $percent% of the words stick; reviews reinforce them.';
  }

  @override
  String pathMoreWords(int count) {
    return '+$count more';
  }

  @override
  String pathOpensAfterDeck(int deck) {
    return 'Opens after Deck $deck.';
  }

  @override
  String get pathOpensAfterUnit => 'Opens after the previous unit.';

  @override
  String pathWordsToMeet(int count) {
    return '$count words you\'ll meet';
  }

  @override
  String pathSheetDoneSummary(int count, int consolidated, String suffix) {
    return 'You met $count words · $consolidated stuck';
  }

  @override
  String pathSheetCurrentSummary(int done, int goal, int reviews) {
    String _temp0 = intl.Intl.pluralLogic(
      reviews,
      locale: localeName,
      other: '$reviews reviews',
      one: '1 review',
    );
    return '$done/$goal new words · $_temp0';
  }

  @override
  String get wordStatusDue => 'Time to review';

  @override
  String get wordStatusConsolidated => 'Reinforced';

  @override
  String get wordStatusLearning => 'Learning';

  @override
  String get authEnterEmail => 'Enter your email address.';

  @override
  String get authInvalidEmail => 'Enter a valid email address.';

  @override
  String get authEnterPassword => 'Enter your password.';

  @override
  String get authAppleLoginFailed => 'Couldn\'t sign in with Apple. Try again.';

  @override
  String get authGoogleLoginFailed =>
      'Couldn\'t sign in with Google. Try again.';

  @override
  String get authWrongCredentials => 'Wrong email or password.';

  @override
  String get authNoConnection =>
      'Couldn\'t connect. Check your internet connection.';

  @override
  String get authLoginUnavailable =>
      'Can\'t sign in right now. Please try again.';

  @override
  String get authGoogleLoginCanceled => 'Google sign-in was canceled.';

  @override
  String get authAppleLoginCanceled => 'Apple sign-in was canceled.';

  @override
  String get authEmailHint => 'Email';

  @override
  String get authPasswordHint => 'Password';

  @override
  String get authSigningInGoogle => 'Signing in with Google...';

  @override
  String get authSigningInApple => 'Signing in with Apple...';

  @override
  String get authSigningIn => 'Signing in...';

  @override
  String get authForgotPassword => 'Forgot password';

  @override
  String get authSignInApple => 'Sign in with Apple';

  @override
  String get authSignInGoogle => 'Sign in with Google';

  @override
  String get authNoAccount => 'Don\'t have an account? ';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authFirstNameRequired => 'Enter your first name.';

  @override
  String get authLastNameRequired => 'Enter your last name.';

  @override
  String get authPasswordRule =>
      'Your password needs at least 6 characters and a number.';

  @override
  String get authDuplicateEmail => 'An account with this email already exists.';

  @override
  String get authDuplicateName =>
      'Couldn\'t create an account with this name. Try a different first or last name.';

  @override
  String get authCheckDetails => 'Check your details and try again.';

  @override
  String get authSignUpUnavailable =>
      'Can\'t create an account right now. Please try again.';

  @override
  String get authCreatedLoginFailed =>
      'Your account was created, but signing in failed. Try again.';

  @override
  String get authGoogleContinueCanceled =>
      'Continuing with Google was canceled.';

  @override
  String get authGoogleContinueFailed =>
      'Couldn\'t continue with Google. Try again.';

  @override
  String get authAppleContinueCanceled => 'Continuing with Apple was canceled.';

  @override
  String get authAppleContinueFailed =>
      'Couldn\'t continue with Apple. Try again.';

  @override
  String get authContinueApple => 'Continue with Apple';

  @override
  String get authContinueGoogle => 'Continue with Google';

  @override
  String get authHaveAccount => 'Already have an account? ';

  @override
  String get authFirstNameHint => 'First name';

  @override
  String get authLastNameHint => 'Last name';

  @override
  String get authCreateProfile => 'Create your profile';

  @override
  String get authOr => 'or';

  @override
  String get premiumChoosePlan => 'Choose your plan';

  @override
  String premiumTrialDaysFree(int days) {
    return '$days days free';
  }

  @override
  String get premiumYearly => 'Yearly';

  @override
  String premiumYearlyDetail(String perMonth, int percent) {
    return '$perMonth/month · save $percent%';
  }

  @override
  String get premiumPerYear => '/ year';

  @override
  String get premiumRecommended => 'RECOMMENDED';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumMonthlyDetail => 'Renews every month';

  @override
  String get premiumPerMonth => '/ month';

  @override
  String get commonBack => 'Back';

  @override
  String premiumRenewalYearly(String price) {
    return '$price per year';
  }

  @override
  String premiumRenewalMonthly(String price) {
    return '$price per month';
  }

  @override
  String premiumCancelAnytime(String store) {
    return 'Cancel anytime in $store.';
  }

  @override
  String premiumTryFree(int days) {
    return 'TRY $days DAYS FREE';
  }

  @override
  String get premiumGoPremium => 'GET PREMIUM';

  @override
  String premiumTermsTrial(int days, String renewal) {
    return 'Stelinda Premium: $days days free, then $renewal. Unless canceled at least 24 hours before the trial or period ends, the subscription ';
  }

  @override
  String premiumTerms(String renewal) {
    return 'Stelinda Premium: $renewal. Unless canceled at least 24 hours before the period ends, the subscription ';
  }

  @override
  String get premiumAutoRenews => 'renews automatically';

  @override
  String get premiumTermsEnd =>
      '. If canceled, Premium stays available until the end of the period.';

  @override
  String get premiumRestore => 'Restore';

  @override
  String get legalTerms => 'Terms of use';

  @override
  String get legalPrivacy => 'Privacy policy';

  @override
  String get premiumUnlimitedTickets => 'Unlimited tickets';

  @override
  String get premiumWeeklyFreezes => '2 streak freezes a week';

  @override
  String get premiumAllContent => 'All learning content';

  @override
  String get premiumHeadlineStart => 'Take your German\n';

  @override
  String get premiumHeadlineAccent => 'above the clouds';

  @override
  String get premiumHeadlineEnd => '';

  @override
  String get premiumSubtitle =>
      'Learn without breaks with unlimited tickets and streak freezes.';

  @override
  String get commonClose => 'Close';

  @override
  String get premiumFree => 'FREE';

  @override
  String get summaryPracticeDone => 'Practice done!';

  @override
  String get summaryReinforceDone => 'Reinforcement done!';

  @override
  String summaryDeckDone(int deck) {
    return 'Deck $deck done!';
  }

  @override
  String get summaryReviewDone => 'Review done!';

  @override
  String get summaryOneMoreRound => 'ONE MORE ROUND';

  @override
  String get summaryPractice => 'PRACTICE';

  @override
  String summaryPracticedWords(int count) {
    return 'You practiced $count words.\nWords stick in reinforcement.';
  }

  @override
  String summaryConsolidated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words stuck.',
      one: '1 word stuck.',
    );
    return '$_temp0';
  }

  @override
  String get summaryNoneConsolidated => 'No words stuck this round.';

  @override
  String summaryGoalLeft(String gained, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      left,
      locale: localeName,
      other: '$left words',
      one: '1 word',
    );
    return '$gained\n$_temp0 to the goal.';
  }

  @override
  String summaryGoalReached(String gained) {
    return '$gained\nYou reached the goal.';
  }

  @override
  String summaryMetWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return 'You met $_temp0';
  }

  @override
  String summaryReviewedWords(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return 'You reviewed $_temp0';
  }

  @override
  String summaryLearnedConsolidated(String learned, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$learned, and $_temp0 stuck.';
  }

  @override
  String summaryLearnedDeck(String learned) {
    return '$learned.\nReinforcement opens when the decks are done.';
  }

  @override
  String get statPoints => 'POINTS';

  @override
  String get statCorrect => 'CORRECT';

  @override
  String get statRevenge => 'REMATCH';

  @override
  String pointsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return '$_temp0';
  }

  @override
  String leaguePointsTo(String league, String points) {
    return '$points to the $league League';
  }

  @override
  String get questsTicketsFull =>
      'Your tickets are full. Play a bit, then claim your reward — the quest will wait.';

  @override
  String questsFreezeCap(int cap) {
    return 'You can hold up to $cap streak freezes.';
  }

  @override
  String get questsFreezeClaimed => 'Streak freeze claimed.';

  @override
  String get questsDemoTitle => 'Reach a 3-day streak';

  @override
  String get questsDaily => 'DAILY QUESTS';

  @override
  String get questsAllDoneToday => 'You finished all of today\'s quests.';

  @override
  String get questsTitle => 'Quests';

  @override
  String questsProgress(int done, int total) {
    return '$done/$total quests';
  }

  @override
  String get questsFreezeTaken => 'Streak freeze claimed';

  @override
  String questsRewardFreeze(String head) {
    return '$head · reward: streak freeze';
  }

  @override
  String get questsGoalLabel => 'TODAY\'S GOAL';

  @override
  String get questsAllDone => 'All done!';

  @override
  String get questsFinishAll => 'Finish every quest';

  @override
  String get questsFreezeReadySpoken => 'Streak freeze ready, claim it';

  @override
  String get questsFreezeReady => 'Streak freeze ready';

  @override
  String get questsRefreshing => 'REFRESHING';

  @override
  String questsHoursMinutesShort(int hours, int minutes) {
    return '${hours}H ${minutes}M';
  }

  @override
  String questsMinutesShort(int minutes) {
    return '${minutes}M';
  }

  @override
  String get questsRefreshingSpoken => 'Quests are refreshing';

  @override
  String questsRefreshInHours(int hours, int minutes) {
    return 'Quests refresh in $hours hours $minutes minutes';
  }

  @override
  String questsRefreshInMinutes(int minutes) {
    return 'Quests refresh in $minutes minutes';
  }

  @override
  String questsClaimReward(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tickets',
      one: '1 ticket',
    );
    return 'Claim reward: $_temp0';
  }

  @override
  String get questsFreezeTodayClaimed => 'Today\'s streak freeze is claimed.';

  @override
  String get questsFreezeAfterAll =>
      'You can claim the streak freeze after finishing every quest.';

  @override
  String get questsFreeze => 'Streak freeze';

  @override
  String get questsLoadFailed =>
      'Couldn\'t load quests.\nPull down to try again.';

  @override
  String get leagueMonthlySeason => 'Monthly season';

  @override
  String leagueSeasonOf(String monthYear) {
    return '$monthYear season';
  }

  @override
  String get leagueSeasonRenewing => 'Season is renewing';

  @override
  String leagueSeasonEndsDays(int days, int hours) {
    return 'Season ends in $days d $hours h';
  }

  @override
  String leagueSeasonEndsHours(int hours, int minutes) {
    return 'Season ends in $hours h $minutes min';
  }

  @override
  String leagueSeasonEndsMinutes(int minutes) {
    return 'Season ends in $minutes min';
  }

  @override
  String leagueNamed(String name) {
    return '$name League';
  }

  @override
  String get leagueYourPoints => 'Your league points';

  @override
  String leagueNextThreshold(String league, int threshold, int left) {
    return '$threshold points for $league · $left to go';
  }

  @override
  String get leagueTopReached => 'You\'re in the top league';

  @override
  String get leagueHowPointsTitle => 'How do I earn points?';

  @override
  String get leagueHowPointsBody =>
      'A correct answer in Karty gives +1 point, and +3 with Boost.';

  @override
  String get leagueNewSeasonTitle => 'What happens in a new season?';

  @override
  String get leagueNewSeasonBody =>
      'A new season starts every month. You start one tier below your last league, and drop one more tier for each extra month you take off (down to Mercury).';

  @override
  String get commonGotIt => 'GOT IT';

  @override
  String get leagueInfoButton => 'League and season info';

  @override
  String get countdownRenewing => 'Renewing';

  @override
  String countdownDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String countdownHours(int hours) {
    return '$hours h';
  }

  @override
  String countdownMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String leagueSeasonEndsIn(String value) {
    return 'Season ends in $value';
  }

  @override
  String get leagueSoloSceneLabel =>
      'The mascot planting a flag on the league planet';

  @override
  String leagueFirstToReach(String league) {
    return 'You\'re the first to reach the $league League';
  }

  @override
  String get leagueRivalsComing => 'New rivals are on the way.';

  @override
  String leagueEntryPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return '$_temp0';
  }

  @override
  String get wordsLoadFailed => 'Couldn\'t load your words. You can try again.';

  @override
  String get wordsMoreFailed => 'Couldn\'t load more words.';

  @override
  String get commonTryAgain => 'Try again';

  @override
  String get wordsSoundOff =>
      'Sound is off. Turn it on to hear the pronunciation.';

  @override
  String get wordsTurnSoundOn => 'Turn sound on';

  @override
  String get wordsTitle => 'My words';

  @override
  String get wordsCollection => 'Your word collection';

  @override
  String wordsMetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return 'You\'ve met $_temp0';
  }

  @override
  String get wordsSubtitle =>
      'Look through your words again and listen to them.';

  @override
  String get wordsFilterAll => 'All';

  @override
  String get wordsFilterNew => 'New';

  @override
  String get wordsFilterDue => 'Review';

  @override
  String get wordsFilterArticle => 'Articles';

  @override
  String get wordsHeader => 'WORDS';

  @override
  String get wordsEmptyNew => 'No newly met words.';

  @override
  String get wordsEmptyDue => 'No words are due for review right now.';

  @override
  String get wordsEmptyArticle => 'No words to practice articles with.';

  @override
  String get wordsEmptyAll => 'You haven\'t met any words yet.';

  @override
  String get commonTryAgainCaps => 'TRY AGAIN';

  @override
  String get wordStatusPracticeArticle => 'Practice article';

  @override
  String get wordStatusNew => 'Just met';

  @override
  String get wordStatusStudied => 'Studied';

  @override
  String wordListenTo(String word) {
    return 'Listen to $word';
  }

  @override
  String get wordListenHintMuted => 'Turn sound on first to listen';

  @override
  String get wordListenHintReplay => 'Play the pronunciation again';

  @override
  String get wordListenTipMuted => 'Turn sound on and listen';

  @override
  String get wordListenTip => 'Listen to the pronunciation';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get settingsSound => 'Sound';

  @override
  String get settingsVibration => 'Vibration';

  @override
  String get settingsManageSubscription => 'Manage subscription';

  @override
  String get settingsSignOut => 'Sign out';

  @override
  String get settingsDeleteAccount => 'Delete account';

  @override
  String get settingsNoConnection =>
      'Couldn\'t connect. Check your internet and try again.';

  @override
  String get settingsDeleteFailed =>
      'Couldn\'t delete your account. Try again.';

  @override
  String get deleteAccountTitle => 'Delete your account?';

  @override
  String get deleteAccountBody =>
      'Your points, streak, learned words, and league ranking will be permanently deleted. This can\'t be undone.';

  @override
  String get deleteAccountConfirm => 'DELETE MY ACCOUNT';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get profileTopLeague => 'Top league';

  @override
  String get profileNextLeague => 'Next league';

  @override
  String get profileAtTop => 'You\'re at the top';

  @override
  String profilePointsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points to go',
      one: '1 point to go',
    );
    return '$_temp0';
  }

  @override
  String profileStreakBadge(int days) {
    return '$days-day badge';
  }

  @override
  String profileDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days to go',
      one: '1 day to go',
    );
    return '$_temp0';
  }

  @override
  String get statWords => 'WORDS';

  @override
  String get statArticles => 'ARTICLES';

  @override
  String get statLeaderboard => 'RANK';

  @override
  String profileWordsOpen(String count) {
    return '$count words, open My words';
  }

  @override
  String profileRevengeWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rematch cards are waiting',
      one: '1 rematch card is waiting',
    );
    return '$_temp0';
  }

  @override
  String get profileRevengeNone => 'No rematch cards';

  @override
  String get profileRevengeWin => 'Win back the ones you missed';

  @override
  String get profileRevengeCollect => 'Cards you answer wrong collect here';

  @override
  String get profileDailyStreak => 'day streak';

  @override
  String get streakGalaxy => 'You\'re at galaxy level!';

  @override
  String get streakKeepRhythm => 'Keep the rhythm!';

  @override
  String get streakGreat => 'You\'re doing great!';

  @override
  String get streakRiseUp => 'Keep climbing!';

  @override
  String get streakStretch => 'Time to stretch your brain!';

  @override
  String get streakMedal => 'Earn your medal!';

  @override
  String get streakConsistency => 'Consistency makes you stronger!';

  @override
  String get streakMissedYou => 'We missed you!';

  @override
  String get streakCatchWind => 'Catch the wind!';

  @override
  String get streakProtected => 'Your streak is safe!';

  @override
  String get streakLongest => 'Your longest streak yet!';

  @override
  String get streakContinues => 'Your streak continues!';

  @override
  String get streakComeBack => 'Come back today!';

  @override
  String streakAtRiskTitle(int days) {
    return 'Your $days-day streak is at risk';
  }

  @override
  String streakFreezeKicked(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'You missed $days days, but your streak freeze kicked in.',
      one: 'You missed a day, but your streak freeze kicked in.',
    );
    return '$_temp0';
  }

  @override
  String streakFreezeAsk(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'You missed $days days. Use your streak freeze?',
      one: 'You missed a day. Use your streak freeze?',
    );
    return '$_temp0';
  }

  @override
  String streakFreezeCost(int spent, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      spent,
      locale: localeName,
      other: 'Uses $spent freezes',
      one: 'Uses 1 freeze',
    );
    return '$_temp0, $left left';
  }

  @override
  String get streakDayStreakLabel => 'day streak';

  @override
  String get streakFreezesLeftLabel => 'freezes left';

  @override
  String get streakUseFreeze => 'USE FREEZE';

  @override
  String get streakDeclineFreeze => 'NO THANKS, RESET MY STREAK';

  @override
  String articlePickSpoken(String article) {
    return 'Choose $article';
  }

  @override
  String get gameExit => 'Leave game';

  @override
  String articleCorrectFeedback(String phrase) {
    return 'Correct! $phrase';
  }

  @override
  String get articleAllDoneTitle => 'Great job!';

  @override
  String get articleAllDoneBody => 'No article cards left to practice for now.';

  @override
  String get actionMainMenu => 'BACK TO HOME';

  @override
  String get commonGoBackCaps => 'GO BACK';

  @override
  String get articleLockedTitle => 'Article Compass is getting ready';

  @override
  String articleLockedBody(int count) {
    return 'Opens after you learn $count different Karty words';
  }

  @override
  String get actionPlayKarty => 'PLAY KARTY';

  @override
  String get reviewDoneTitle => 'Rematch complete!';

  @override
  String get reviewDoneBody =>
      'You faced your Karty words again and made them stronger.';

  @override
  String reviewDoneTickets(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You earned +$count tickets',
      one: 'You earned +1 ticket',
    );
    return '$_temp0';
  }

  @override
  String get reviewDoneStronger => 'Your knowledge got stronger';

  @override
  String get pauseSpoken => 'Game paused';

  @override
  String get pauseTitle => 'Paused';

  @override
  String get pauseCorrectStreak => 'Correct streak';

  @override
  String reminderStreakTitle(int streak) {
    return 'Your $streak-day streak is waiting';
  }

  @override
  String get reminderStreakBody =>
      'Play one game today to keep your streak going.';

  @override
  String get reminderMissedTitle => 'We miss you';

  @override
  String get reminderMissedBody =>
      'Pick up where you left off with a few words.';

  @override
  String get reminderInviteTitle => 'Today\'s words are ready';

  @override
  String get reminderInviteBody => 'A few minutes a day is enough.';

  @override
  String get reminderChannelName => 'Daily reminder';

  @override
  String get reminderChannelDescription =>
      'Reminds you at most once a day if you haven\'t played.';

  @override
  String get kartyLoadError => 'Something went wrong while loading Karty.';

  @override
  String get commonErrorRetry => 'Something went wrong. Please try again.';

  @override
  String get kartyPromptNewWord => 'New word';

  @override
  String get kartyPromptPickImage => 'Find the picture';

  @override
  String get kartyPromptPickArticle => 'Choose the article';

  @override
  String get kartyPromptArrange => 'Spell the word';

  @override
  String get kartyPromptListen => 'Find what you hear';

  @override
  String get kartyTimeUp => 'Time\'s up';

  @override
  String get soundOffSpoken => 'Pronunciation sound off';

  @override
  String get soundOnSpoken => 'Pronunciation sound on';

  @override
  String get soundTurnOn => 'Turn sound on';

  @override
  String get soundTurnOff => 'Turn sound off';

  @override
  String get gameResumeSpoken => 'Resume game';

  @override
  String get gamePauseSpoken => 'Pause game';

  @override
  String get kartyImageOption => 'Picture option';

  @override
  String kartyRemoveLetter(String letter) {
    return 'Remove letter $letter';
  }

  @override
  String get kartyListenWord => 'Listen to the word';

  @override
  String get kartyListenSlow => 'Listen slowly';

  @override
  String kartyLeaguePointsSpoken(int points) {
    return '$points league points';
  }

  @override
  String kartyLeaguePointsBoostSpoken(int points) {
    return '$points league points. Triple points active.';
  }

  @override
  String get kartyBoostReadySpoken =>
      'Boost ready. Activate for 20 seconds of triple league points';

  @override
  String get kartyBoostEnergySpoken => 'Boost energy';

  @override
  String get profileNextGoals => 'YOUR NEXT GOALS';

  @override
  String get profileToday => 'TODAY';

  @override
  String get profileTotal => 'TOTAL';

  @override
  String get profileWordsLink => 'MY WORDS  ›';

  @override
  String get profileWordsLinkSpoken => 'Open My Words';

  @override
  String get leagueSaveFailed => 'Couldn\'t save league info. Try again.';

  @override
  String get leaguePromotedLabel => 'PROMOTED';

  @override
  String leaguePromotedFrom(String name) {
    return 'You moved up from the $name League.';
  }

  @override
  String get reviewStationSpoken => 'Karty Rematch';

  @override
  String get pathLoadFailed => 'Couldn\'t load your path.';

  @override
  String get welcomeTitle => 'Learn German through games';

  @override
  String get welcomeSubtitle => 'A few minutes a day is enough.';

  @override
  String get welcomeStart => 'Start for free';

  @override
  String get welcomeHaveAccount => 'I already have an account';

  @override
  String get unitSaveFailed => 'Couldn\'t save unit info. Try again.';

  @override
  String unitUnlockedLabel(int number) {
    return 'UNIT $number UNLOCKED';
  }

  @override
  String unitNewWordsWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new words are waiting for you.',
      one: '1 new word is waiting for you.',
    );
    return '$_temp0';
  }

  @override
  String unitLabel(int number) {
    return 'UNIT $number';
  }

  @override
  String unitWordsWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words are waiting for you',
      one: '1 word is waiting for you',
    );
    return '$_temp0';
  }

  @override
  String unitWordsConsolidated(int done, int total) {
    return '$done/$total words stuck';
  }

  @override
  String streakDayNumber(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Day $days',
      zero: '0 days',
    );
    return '$_temp0';
  }

  @override
  String get questDoneTitle => 'Quest complete!';

  @override
  String questRewardTickets(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count tickets',
      one: '+1 ticket',
    );
    return '$_temp0';
  }

  @override
  String get pronunciationOff => 'Pronunciation off';

  @override
  String get navHome => 'Home';

  @override
  String get navLeagues => 'Leagues';

  @override
  String get navQuests => 'Quests';

  @override
  String get navPremium => 'Premium';

  @override
  String get navProfile => 'Profile';

  @override
  String get subscriptionOpenFailed =>
      'Couldn\'t open the subscription page. Try again.';

  @override
  String get networkTimeout =>
      'The connection timed out. Please try again later.';

  @override
  String get signedOut => 'You\'re signed out. See you soon!';

  @override
  String get accountDeleted => 'Your account has been deleted.';

  @override
  String get questsCompleted => 'COMPLETED';

  @override
  String get authEnterDetails => 'Enter your details';

  @override
  String get gameOpenFailed => 'Couldn\'t open the game. Try again later.';

  @override
  String get loadingSpoken => 'Loading';

  @override
  String get weekdaysShort => 'Mon Tue Wed Thu Fri Sat Sun';

  @override
  String get monthNames =>
      'January February March April May June July August September October November December';

  @override
  String get questsClaimShort => 'CLAIM';

  @override
  String profileFreezeUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'freezes',
      one: 'freeze',
    );
    return '$_temp0';
  }

  @override
  String rankOrdinal(int rank) {
    return '#$rank';
  }
}
