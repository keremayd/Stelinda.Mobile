// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get accountDeletionAppleCanceled =>
      'Apple onayı alınamadı, hesap silinmedi.';

  @override
  String get leagueMerkur => 'Merkür';

  @override
  String get leagueAytasi => 'Aytaşı';

  @override
  String get leagueYildiz => 'Yıldız';

  @override
  String get leagueKuyruklu => 'Kuyruklu';

  @override
  String get leagueMars => 'Mars';

  @override
  String get leagueUranus => 'Uranüs';

  @override
  String get leagueSaturn => 'Satürn';

  @override
  String get leagueNebula => 'Nebula';

  @override
  String get leagueKosmoz => 'Kosmoz';

  @override
  String get leagueSupernova => 'Supernova';

  @override
  String get leaguePulsar => 'Pulsar';

  @override
  String pathDeck(int number) {
    return 'Deste $number';
  }

  @override
  String get pathReview => 'Tekrar';

  @override
  String get pathReinforce => 'Pekiştirme';

  @override
  String get ticketsOut => 'Biletin bitti';

  @override
  String get ticketsUnit => 'bilet';

  @override
  String ticketsNextIn(String time) {
    return '$time sonra 1 bilet';
  }

  @override
  String get ticketsRenewing => 'Bilet yenileniyor';

  @override
  String get ticketsSoon => 'Birazdan';

  @override
  String ticketsHoursMinutes(int hours, int minutes) {
    return '$hours sa $minutes dk';
  }

  @override
  String ticketsMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String get ticketsUnderMinute => '<1 dk';

  @override
  String ticketsCapEveryHours(int hours) {
    return 'Harcayınca her $hours saatte 1 yenilenir';
  }

  @override
  String ticketsCapEveryMinutes(int minutes) {
    return 'Harcayınca her $minutes dakikada 1 yenilenir';
  }

  @override
  String ticketsCapMax(int max) {
    return 'En fazla $max bilet birikir';
  }

  @override
  String get ticketsEarnFree => 'ÜCRETSİZ KAZAN';

  @override
  String get ticketsReviewOn => 'Hemen kazan';

  @override
  String get ticketsQuests => 'Görevler';

  @override
  String get ticketsQuestsLeft => 'Bugün kalan';

  @override
  String get ticketsQuestsDone => 'Yarın yenilenir';

  @override
  String get ticketsQuestsDaily => 'Günlük görevler';

  @override
  String get ticketsPremiumTitle => 'BİLETİN HİÇ BİTMESİN';

  @override
  String get ticketsPremiumBody => 'Premium ile beklemeden oyna';

  @override
  String get pathArticle => 'Artikel';

  @override
  String get pathArticleDetail => 'der/die/das tekrarı';

  @override
  String pathArticleProgress(int done, int goal) {
    return '$done/$goal artikel';
  }

  @override
  String pathReviewStationDetail(int count) {
    return '$count hatanı düzelt';
  }

  @override
  String get pathReviewStationEmpty => 'Hatan yok';

  @override
  String get stepIntroStart => 'BAŞLA';

  @override
  String get introDeckTitle => 'Deste';

  @override
  String introDeckTagline(int count) {
    return '$count yeni kelime';
  }

  @override
  String get introDeckRow1 => 'Kelimeler resimleriyle tanıtılır';

  @override
  String get introDeckRow2 => 'Hepsi bilinince deste biter';

  @override
  String get introArticleRow1 => 'Kartı doğru artikele sürükle';

  @override
  String get introArticleRow2 => 'Unutulan artikeller geri gelir';

  @override
  String get introReinforceTagline => 'Ünitenin son adımı';

  @override
  String get introReinforceRow1 => 'Doğru bilinen kelime pekişir';

  @override
  String introReinforceRow2(int percent) {
    return '%$percent pekişince yeni ünite açılır';
  }

  @override
  String get introReviewTitle => 'Rövanş';

  @override
  String get introReviewTagline => 'Hataların tekrarı';

  @override
  String get introReviewRow1 => 'Yanlış bilinen kartlar toplanır';

  @override
  String get introReviewRow2 => 'Hepsi düzelince 1 bilet kazanılır';

  @override
  String get articleStepDoneTitle => 'Artikel tamam!';

  @override
  String articleStepDoneBody(int goal) {
    return '$goal artikel doğru bilindi. Unutulanlar yeniden sorulur.';
  }

  @override
  String get articleStepContinue => 'DEVAM ET';

  @override
  String pathUnlockHint(int unit, String unitSuffix, int percent) {
    return 'Ünite $unit$unitSuffix %$percent\'i pekişince açılır';
  }

  @override
  String unitUnlockReason(int unit, String unitSuffix, int percent) {
    return 'Ünite $unit$unitSuffix %$percent\'ini pekiştirdin.';
  }

  @override
  String get leagueMemberReport => 'Bildir';

  @override
  String get leagueMemberBlock => 'Engelle';

  @override
  String get leagueMemberCancel => 'Vazgeç';

  @override
  String get leagueReportTitle => 'Neden bildiriyorsun?';

  @override
  String get leagueReportReasonName => 'Uygunsuz ad';

  @override
  String get leagueReportReasonPhoto => 'Uygunsuz fotoğraf';

  @override
  String get leagueReportReasonOther => 'Başka bir sebep';

  @override
  String get leagueReportSent => 'Bildirimin alındı, incelenecek.';

  @override
  String leagueBlockTitle(String name) {
    return '$name engellensin mi?';
  }

  @override
  String get leagueBlockBody => 'Sıralamada artık birbirinizi görmezsiniz.';

  @override
  String leagueBlockDone(String name) {
    return '$name engellendi.';
  }

  @override
  String get leagueModerationFailed =>
      'Gönderilemedi. Bağlantını kontrol edip tekrar dene.';

  @override
  String leagueMemberOptions(String name) {
    return '$name için seçenekler';
  }

  @override
  String get premiumStoreUnavailable =>
      'Mağazaya şu an ulaşılamıyor. Biraz sonra tekrar dene.';

  @override
  String get premiumWelcome =>
      'Premium\'a hoş geldin! Biletlerin artık sınırsız.';

  @override
  String get premiumPurchaseFailed => 'Satın alma tamamlanamadı. Tekrar dene.';

  @override
  String get premiumPurchasePending =>
      'Satın alma onay bekliyor; onaylanınca Premium açılır.';

  @override
  String get premiumNothingToRestore =>
      'Geri yüklenecek etkin bir abonelik bulunamadı.';

  @override
  String get premiumActiveTitle => 'Premium üyeliğin aktif';

  @override
  String get premiumActiveBody =>
      'Biletlerin sınırsız, seri korumaların her hafta ikiye dolar.';

  @override
  String get premiumManage => 'ABONELİĞİ YÖNET';

  @override
  String get premiumActiveClose => 'Kapat';

  @override
  String get premiumManageFailed => 'Abonelik sayfası açılamadı. Tekrar dene.';

  @override
  String get ticketsUnlimited => 'Sınırsız bilet';

  @override
  String get accountDeletionSubscriptionNote =>
      'Premium abonelik hesapla birlikte iptal edilmez. Ödemenin durması için abonelik App Store\'dan ayrıca iptal edilmelidir.';

  @override
  String get accountDeletionManageSubscription => 'Aboneliği yönet';

  @override
  String get passwordHelpTitle => 'Şifreni mi unuttun?';

  @override
  String get passwordHelpBody =>
      'Şifre sıfırlama bağlantısı yakında uygulamaya eklenecek. O zamana kadar hesapta kayıtlı e-posta adresinden destek adresine yazılabilir:';

  @override
  String get passwordHelpWrite => 'DESTEĞE YAZ';

  @override
  String get passwordHelpMailSubject => 'Şifre sıfırlama';

  @override
  String get passwordHelpCopied =>
      'E-posta uygulaması açılamadı; adres kopyalandı.';

  @override
  String get passwordHelpClose => 'Kapat';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get profilePhotoChange => 'Profil fotoğrafını değiştir';

  @override
  String get profilePhotoUpdated => 'Profil fotoğrafı güncellendi.';

  @override
  String get profilePhotoFailed => 'Fotoğraf yüklenemedi. Tekrar dene.';

  @override
  String get pathBackToCurrent => 'Bulunduğun desteye dön';

  @override
  String pathReviewCount(int count) {
    return '$count tekrar';
  }

  @override
  String pathWordCount(int count) {
    return '$count kelime';
  }

  @override
  String pathNewProgress(int done, int goal) {
    return '$done/$goal yeni';
  }

  @override
  String get pathPractice => 'Pratik';

  @override
  String pathNewWords(int count) {
    return '$count yeni kelime';
  }

  @override
  String pathWordsProgress(int done, int total) {
    return '$done/$total kelime';
  }

  @override
  String pathGoalPercent(int percent) {
    return '%$percent';
  }

  @override
  String pathNodeDone(String label) {
    return '$label, tamamlandı';
  }

  @override
  String get pathNextArticle => 'Sıradaki Artikel tekrarı';

  @override
  String get pathNextDeck => 'Sıradaki deste';

  @override
  String get pathGateDone => 'Ünite sonu, hedefe ulaşıldı';

  @override
  String get pathGatePlay => 'Pekiştirme, oyna';

  @override
  String get pathGateLocked => 'Ünite sonu, pekiştirme';

  @override
  String get actionContinue => 'DEVAM ET';

  @override
  String get actionContinueSpoken => 'Devam et';

  @override
  String get actionStart => 'BAŞLA';

  @override
  String get actionStartSpoken => 'Başla';

  @override
  String get actionReview => 'TEKRAR ET';

  @override
  String get actionReviewSpoken => 'Tekrar et';

  @override
  String get actionPractice => 'PRATİK';

  @override
  String get actionPracticeSpoken => 'Pratik yap';

  @override
  String pathDueBadge(int count) {
    return '$count kelime tekrar bekliyor';
  }

  @override
  String pathSheetDeckWaiting(int count) {
    return 'Bu destenin $count yeni kelimesi seni bekliyor.';
  }

  @override
  String pathSheetUnitDone(int percent) {
    return 'Bu ünitenin desteleri bitti. Sıradaki ünite, kelimelerin %$percent\'i pekişince açılır; tekrarlar onları pekiştiriyor.';
  }

  @override
  String pathMoreWords(int count) {
    return '+$count kelime daha';
  }

  @override
  String pathOpensAfterDeck(int deck) {
    return 'Deste $deck bitince açılır.';
  }

  @override
  String get pathOpensAfterUnit => 'Önceki ünite bitince açılır.';

  @override
  String pathWordsToMeet(int count) {
    return 'Tanışacağın $count kelime';
  }

  @override
  String pathSheetDoneSummary(int count, int consolidated, String suffix) {
    return '$count kelimeyle tanıştın · $consolidated$suffix pekişti';
  }

  @override
  String pathSheetCurrentSummary(int done, int goal, int reviews) {
    return '$done/$goal yeni kelime · $reviews tekrar';
  }

  @override
  String get wordStatusDue => 'Tekrar zamanı';

  @override
  String get wordStatusConsolidated => 'Pekişti';

  @override
  String get wordStatusLearning => 'Öğreniliyor';

  @override
  String get authEnterEmail => 'E-posta adresini gir.';

  @override
  String get authInvalidEmail => 'Geçerli bir e-posta adresi gir.';

  @override
  String get authEnterPassword => 'Şifreni gir.';

  @override
  String get authAppleLoginFailed => 'Apple ile giriş yapılamadı. Tekrar dene.';

  @override
  String get authGoogleLoginFailed =>
      'Google ile giriş yapılamadı. Tekrar dene.';

  @override
  String get authWrongCredentials => 'E-posta veya şifre hatalı.';

  @override
  String get authNoConnection =>
      'Bağlantı kurulamadı. İnternetini ve sunucuyu kontrol et.';

  @override
  String get authLoginUnavailable =>
      'Şu anda giriş yapılamıyor. Lütfen tekrar dene.';

  @override
  String get authGoogleLoginCanceled => 'Google ile giriş iptal edildi.';

  @override
  String get authAppleLoginCanceled => 'Apple ile giriş iptal edildi.';

  @override
  String get authEmailHint => 'E-posta';

  @override
  String get authPasswordHint => 'Şifre';

  @override
  String get authSigningInGoogle => 'Google ile giriş yapılıyor...';

  @override
  String get authSigningInApple => 'Apple ile giriş yapılıyor...';

  @override
  String get authSigningIn => 'Giriş yapılıyor...';

  @override
  String get authForgotPassword => 'Parolamı unuttum';

  @override
  String get authSignInApple => 'Apple ile giriş yap';

  @override
  String get authSignInGoogle => 'Google ile giriş yap';

  @override
  String get authNoAccount => 'Hesabın yok mu? ';

  @override
  String get authSignUp => 'Kayıt ol';

  @override
  String get authSignIn => 'Giriş yap';

  @override
  String get authFirstNameRequired => 'İsmini yazmalısın.';

  @override
  String get authLastNameRequired => 'Soyismini yazmalısın.';

  @override
  String get authPasswordRule =>
      'Şifren en az 6 karakter ve bir rakam içermeli.';

  @override
  String get authDuplicateEmail => 'Bu e-posta adresiyle zaten bir hesap var.';

  @override
  String get authDuplicateName =>
      'Bu isimle hesap oluşturulamadı. Farklı bir ad veya soyad dene.';

  @override
  String get authCheckDetails => 'Bilgileri kontrol edip tekrar dene.';

  @override
  String get authSignUpUnavailable =>
      'Şu anda kayıt oluşturulamıyor. Lütfen tekrar dene.';

  @override
  String get authCreatedLoginFailed =>
      'Hesabın oluşturuldu. Giriş yapılamadı; tekrar dene.';

  @override
  String get authGoogleContinueCanceled =>
      'Google ile devam etme iptal edildi.';

  @override
  String get authGoogleContinueFailed =>
      'Google ile devam edilemedi. Tekrar dene.';

  @override
  String get authAppleContinueCanceled => 'Apple ile devam etme iptal edildi.';

  @override
  String get authAppleContinueFailed =>
      'Apple ile devam edilemedi. Tekrar dene.';

  @override
  String get authContinueApple => 'Apple ile devam et';

  @override
  String get authContinueGoogle => 'Google ile devam et';

  @override
  String get authHaveAccount => 'Hesabın var mı? ';

  @override
  String get authFirstNameHint => 'İsim';

  @override
  String get authLastNameHint => 'Soyisim';

  @override
  String get authCreateProfile => 'Profilini oluştur';

  @override
  String get authOr => 'veya';

  @override
  String get premiumChoosePlan => 'Planını seç';

  @override
  String premiumTrialDaysFree(int days) {
    return '$days gün ücretsiz';
  }

  @override
  String get premiumYearly => 'Yıllık';

  @override
  String premiumYearlyDetail(String perMonth, int percent) {
    return 'Ayda $perMonth · %$percent tasarruf';
  }

  @override
  String get premiumPerYear => '/ yıl';

  @override
  String get premiumRecommended => 'ÖNERİLEN';

  @override
  String get premiumMonthly => 'Aylık';

  @override
  String get premiumMonthlyDetail => 'Her ay yenilenir';

  @override
  String get premiumPerMonth => '/ ay';

  @override
  String get commonBack => 'Geri';

  @override
  String premiumRenewalYearly(String price) {
    return 'yıllık $price';
  }

  @override
  String premiumRenewalMonthly(String price) {
    return 'aylık $price';
  }

  @override
  String premiumCancelAnytime(String store) {
    return '$store üzerinden her zaman iptal edilebilir.';
  }

  @override
  String premiumTryFree(int days) {
    return '$days GÜN ÜCRETSİZ DENE';
  }

  @override
  String get premiumGoPremium => 'PREMIUM\'A GEÇ';

  @override
  String premiumTermsTrial(int days, String renewal) {
    return 'Stelinda Premium: $days gün ücretsiz, ardından $renewal. Abonelik, deneme süresi ya da dönem bitmeden en az 24 saat önce iptal edilmezse ';
  }

  @override
  String premiumTerms(String renewal) {
    return 'Stelinda Premium: $renewal. Abonelik, dönem bitmeden en az 24 saat önce iptal edilmezse ';
  }

  @override
  String get premiumAutoRenews => 'otomatik olarak yenilenir';

  @override
  String get premiumTermsEnd =>
      '. İptal edildiğinde Premium, dönemin sonuna kadar kullanılabilir.';

  @override
  String get premiumRestore => 'Geri yükle';

  @override
  String get legalTerms => 'Kullanım koşulları';

  @override
  String get legalPrivacy => 'Gizlilik politikası';

  @override
  String get premiumUnlimitedTickets => 'Sınırsız bilet';

  @override
  String get premiumWeeklyFreezes => 'Haftada 2 seri koruması';

  @override
  String get premiumAllContent => 'Tüm öğrenme içeriği';

  @override
  String get premiumHeadlineStart => 'Almanca seviyeni\n';

  @override
  String get premiumHeadlineAccent => 'bulutların üstüne';

  @override
  String get premiumHeadlineEnd => ' çıkar';

  @override
  String get premiumSubtitle =>
      'Sınırsız bilet ve seri korumasıyla kesintisiz öğren.';

  @override
  String get commonClose => 'Kapat';

  @override
  String get premiumFree => 'ÜCRETSİZ';

  @override
  String get summaryPracticeDone => 'Pratik tamam!';

  @override
  String get summaryReinforceDone => 'Pekiştirme tamam!';

  @override
  String summaryDeckDone(int deck) {
    return 'Deste $deck tamam!';
  }

  @override
  String get summaryReviewDone => 'Tekrar tamam!';

  @override
  String get summaryOneMoreRound => 'BİR TUR DAHA';

  @override
  String get summaryPractice => 'PRATİK YAP';

  @override
  String summaryPracticedWords(int count) {
    return '$count kelimeyle pratik yaptın.\nKelimeler pekiştirmede pekişir.';
  }

  @override
  String summaryConsolidated(int count) {
    return '$count kelime pekişti.';
  }

  @override
  String get summaryNoneConsolidated => 'Bu turda pekişen kelime olmadı.';

  @override
  String summaryGoalLeft(String gained, int left) {
    return '$gained\nHedefe $left kelime kaldı.';
  }

  @override
  String summaryGoalReached(String gained) {
    return '$gained\nHedefe ulaştın.';
  }

  @override
  String summaryMetWords(int count) {
    return '$count kelimeyle tanıştın';
  }

  @override
  String summaryReviewedWords(int count) {
    return '$count kelimeyi tekrar ettin';
  }

  @override
  String summaryLearnedConsolidated(String learned, int count) {
    return '$learned, $count kelime pekişti.';
  }

  @override
  String summaryLearnedDeck(String learned) {
    return '$learned.\nDesteler bitince pekiştirme açılır.';
  }

  @override
  String get statPoints => 'PUAN';

  @override
  String get statCorrect => 'DOĞRU';

  @override
  String get statRevenge => 'RÖVANŞ';

  @override
  String pointsCount(int count) {
    return '$count puan';
  }

  @override
  String leaguePointsTo(String league, String points) {
    return '$league Ligi\'ne $points kaldı';
  }

  @override
  String get questsTicketsFull =>
      'Biletlerin dolu. Biraz oyna, sonra ödülünü al — görev seni bekliyor.';

  @override
  String questsFreezeCap(int cap) {
    return 'En fazla $cap seri koruması tutulabilir.';
  }

  @override
  String get questsFreezeClaimed => 'Seri koruması alındı.';

  @override
  String get questsDemoTitle => '3 günlük seriye ulaş';

  @override
  String get questsDaily => 'GÜNLÜK GÖREVLER';

  @override
  String get questsAllDoneToday => 'Bugünün tüm görevlerini bitirdin.';

  @override
  String get questsTitle => 'Görevler';

  @override
  String questsProgress(int done, int total) {
    return '$done/$total görev';
  }

  @override
  String get questsFreezeTaken => 'Seri koruması alındı';

  @override
  String questsRewardFreeze(String head) {
    return '$head · ödül: seri koruması';
  }

  @override
  String get questsGoalLabel => 'BUGÜNÜN HEDEFİ';

  @override
  String get questsAllDone => 'Hepsini bitirdin!';

  @override
  String get questsFinishAll => 'Tüm görevleri bitir';

  @override
  String get questsFreezeReadySpoken => 'Seri koruması hazır, al';

  @override
  String get questsFreezeReady => 'Seri koruması hazır';

  @override
  String get questsRefreshing => 'YENİLENİYOR';

  @override
  String questsHoursMinutesShort(int hours, int minutes) {
    return '$hours SA $minutes DK';
  }

  @override
  String questsMinutesShort(int minutes) {
    return '$minutes DK';
  }

  @override
  String get questsRefreshingSpoken => 'Görevler yenileniyor';

  @override
  String questsRefreshInHours(int hours, int minutes) {
    return 'Görevler $hours saat $minutes dakika sonra yenilenir';
  }

  @override
  String questsRefreshInMinutes(int minutes) {
    return 'Görevler $minutes dakika sonra yenilenir';
  }

  @override
  String questsClaimReward(int count) {
    return 'Ödülü al: $count bilet';
  }

  @override
  String get questsFreezeTodayClaimed => 'Bugünün seri koruması alındı.';

  @override
  String get questsFreezeAfterAll =>
      'Seri koruması tüm görevler bitince alınabilir.';

  @override
  String get questsFreeze => 'Seri koruması';

  @override
  String get questsLoadFailed =>
      'Görevler yüklenemedi.\nAşağı çekerek tekrar dene.';

  @override
  String get leagueMonthlySeason => 'Aylık sezon';

  @override
  String leagueSeasonOf(String monthYear) {
    return '$monthYear sezonu';
  }

  @override
  String get leagueSeasonRenewing => 'Sezon yenileniyor';

  @override
  String leagueSeasonEndsDays(int days, int hours) {
    return 'Sezon bitimine $days gün $hours saat';
  }

  @override
  String leagueSeasonEndsHours(int hours, int minutes) {
    return 'Sezon bitimine $hours saat $minutes dk';
  }

  @override
  String leagueSeasonEndsMinutes(int minutes) {
    return 'Sezon bitimine $minutes dk';
  }

  @override
  String leagueNamed(String name) {
    return '$name Ligi';
  }

  @override
  String get leagueYourPoints => 'Lig puanın';

  @override
  String leagueNextThreshold(String league, int threshold, int left) {
    return '$league için $threshold puan · $left puan kaldı';
  }

  @override
  String get leagueTopReached => 'En üst ligdesin';

  @override
  String get leagueHowPointsTitle => 'Puan nasıl kazanılır?';

  @override
  String get leagueHowPointsBody =>
      'Karty’de doğru cevap +1, Boost ile doğru cevap +3 puan verir.';

  @override
  String get leagueNewSeasonTitle => 'Yeni sezonda ne olur?';

  @override
  String get leagueNewSeasonBody =>
      'Her ay yeni sezon başlar. Son liginden bir kademe aşağıdan başlarsın; ara verdiğin her ek ay için bir kademe daha düşersin (en az Merkür).';

  @override
  String get commonGotIt => 'ANLADIM';

  @override
  String get leagueInfoButton => 'Lig ve sezon bilgisi';

  @override
  String get countdownRenewing => 'Yenileniyor';

  @override
  String countdownDays(int days) {
    return '$days gün';
  }

  @override
  String countdownHours(int hours) {
    return '$hours sa';
  }

  @override
  String countdownMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String leagueSeasonEndsIn(String value) {
    return 'Sezonun bitmesine $value';
  }

  @override
  String get leagueSoloSceneLabel => 'Lig gezegenine bayrak diken maskot';

  @override
  String leagueFirstToReach(String league) {
    return '$league Ligi\'ne ilk sen ulaştın';
  }

  @override
  String get leagueRivalsComing => 'Yeni rakipler yolda.';

  @override
  String leagueEntryPoints(int count) {
    return '$count Puan';
  }

  @override
  String get wordsLoadFailed => 'Kelimeler yüklenemedi. Tekrar deneyebilirsin.';

  @override
  String get wordsMoreFailed => 'Diğer kelimeler yüklenemedi.';

  @override
  String get commonTryAgain => 'Tekrar dene';

  @override
  String get wordsSoundOff =>
      'Ses kapalı. Telaffuzu dinlemek için açabilirsin.';

  @override
  String get wordsTurnSoundOn => 'Sesi aç';

  @override
  String get wordsTitle => 'Kelimelerim';

  @override
  String get wordsCollection => 'Kelime koleksiyonun';

  @override
  String wordsMetCount(int count) {
    return '$count kelimeyle tanıştın';
  }

  @override
  String get wordsSubtitle => 'Kelimelerine yeniden göz at, seslerini dinle.';

  @override
  String get wordsFilterAll => 'Tümü';

  @override
  String get wordsFilterNew => 'Yeni';

  @override
  String get wordsFilterDue => 'Tekrar';

  @override
  String get wordsFilterArticle => 'Artikel';

  @override
  String get wordsHeader => 'KELİMELER';

  @override
  String get wordsEmptyNew => 'Yeni tanıştığın kelime yok.';

  @override
  String get wordsEmptyDue => 'Şu an tekrar zamanı gelen kelime yok.';

  @override
  String get wordsEmptyArticle => 'Artikel çalışacak kelime yok.';

  @override
  String get wordsEmptyAll => 'Henüz bir kelimeyle tanışmadın.';

  @override
  String get commonTryAgainCaps => 'TEKRAR DENE';

  @override
  String get wordStatusPracticeArticle => 'Artikel çalış';

  @override
  String get wordStatusNew => 'Yeni tanıştın';

  @override
  String get wordStatusStudied => 'Çalışıldı';

  @override
  String wordListenTo(String word) {
    return '$word telaffuzunu dinle';
  }

  @override
  String get wordListenHintMuted => 'Dinlemek için önce sesi aç';

  @override
  String get wordListenHintReplay => 'Telaffuzu yeniden çal';

  @override
  String get wordListenTipMuted => 'Sesi açıp dinle';

  @override
  String get wordListenTip => 'Telaffuzu dinle';

  @override
  String settingsVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get settingsSound => 'Ses';

  @override
  String get settingsVibration => 'Titreşim';

  @override
  String get settingsManageSubscription => 'Aboneliği yönet';

  @override
  String get settingsSignOut => 'Çıkış yap';

  @override
  String get settingsDeleteAccount => 'Hesabı sil';

  @override
  String get settingsNoConnection =>
      'Bağlantı kurulamadı. İnternetini kontrol edip tekrar dene.';

  @override
  String get settingsDeleteFailed => 'Hesap silinemedi. Tekrar dene.';

  @override
  String get deleteAccountTitle => 'Hesabın silinsin mi?';

  @override
  String get deleteAccountBody =>
      'Puanın, serin, öğrendiğin kelimeler ve lig sıralaman kalıcı olarak silinir. Bu işlem geri alınamaz.';

  @override
  String get deleteAccountConfirm => 'HESABIMI SİL';

  @override
  String get commonCancel => 'Vazgeç';

  @override
  String get profileTopLeague => 'En üst lig';

  @override
  String get profileNextLeague => 'Bir üst lig';

  @override
  String get profileAtTop => 'Zirvedesin';

  @override
  String profilePointsLeft(int count) {
    return '$count puan kaldı';
  }

  @override
  String profileStreakBadge(int days) {
    return '$days günlük rozet';
  }

  @override
  String profileDaysLeft(int count) {
    return '$count gün kaldı';
  }

  @override
  String get statWords => 'KELİME';

  @override
  String get statArticles => 'ARTİKEL';

  @override
  String get statLeaderboard => 'LİDERLİK';

  @override
  String profileWordsOpen(String count) {
    return '$count kelime, Kelimelerim ekranını aç';
  }

  @override
  String profileRevengeWaiting(int count) {
    return '$count rövanş kartı seni bekliyor';
  }

  @override
  String get profileRevengeNone => 'Rövanş kartın yok';

  @override
  String get profileRevengeWin => 'Yanlış bildiklerini geri kazan';

  @override
  String get profileRevengeCollect => 'Yanlış cevapladıkların burada birikir';

  @override
  String get profileDailyStreak => 'günlük seri';

  @override
  String get streakGalaxy => 'Galaksi seviyesindesin!';

  @override
  String get streakKeepRhythm => 'Ritmi koru!';

  @override
  String get streakGreat => 'Harika gidiyorsun!';

  @override
  String get streakRiseUp => 'Haydi yüksel!';

  @override
  String get streakStretch => 'Beyni esnetme zamanı!';

  @override
  String get streakMedal => 'Madalyanı kazan!';

  @override
  String get streakConsistency => 'İstikrarın seni güçlendiriyor!';

  @override
  String get streakMissedYou => 'Seni özledik!';

  @override
  String get streakCatchWind => 'Rüzgarı yakala!';

  @override
  String get streakProtected => 'Serin korundu!';

  @override
  String get streakLongest => 'En uzun seridesin!';

  @override
  String get streakContinues => 'Serin devam ediyor!';

  @override
  String get streakComeBack => 'Bugün geri dön!';

  @override
  String streakAtRiskTitle(int days) {
    return '$days günlük serin tehlikede';
  }

  @override
  String streakFreezeKicked(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün ara verdin ama seri koruman devreye girdi.',
      one: 'Bir gün ara verdin ama seri koruman devreye girdi.',
    );
    return '$_temp0';
  }

  @override
  String streakFreezeAsk(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün ara verdin. Seri koruman kullanılsın mı?',
      one: 'Bir gün ara verdin. Seri koruman kullanılsın mı?',
    );
    return '$_temp0';
  }

  @override
  String streakFreezeCost(int spent, int left) {
    return '$spent koruma harcanır, $left kalır';
  }

  @override
  String get streakDayStreakLabel => 'günlük seri';

  @override
  String get streakFreezesLeftLabel => 'koruma kaldı';

  @override
  String get streakUseFreeze => 'KORUMAYI KULLAN';

  @override
  String get streakDeclineFreeze => 'GEREK YOK, SERİ SIFIRLANSIN';

  @override
  String articlePickSpoken(String article) {
    return '$article seç';
  }

  @override
  String get gameExit => 'Oyundan çık';

  @override
  String articleCorrectFeedback(String phrase) {
    return 'Doğru! $phrase';
  }

  @override
  String get articleAllDoneTitle => 'Harika iş!';

  @override
  String get articleAllDoneBody =>
      'Şimdilik çalışılacak artikel kartı kalmadı.';

  @override
  String get actionMainMenu => 'ANA MENÜYE DÖN';

  @override
  String get commonGoBackCaps => 'GERİ DÖN';

  @override
  String get articleLockedTitle => 'Artikel Pusulası hazırlanıyor';

  @override
  String articleLockedBody(int count) {
    return '$count farklı Karty öğrenince açılır';
  }

  @override
  String get actionPlayKarty => 'KARTY OYNA';

  @override
  String get reviewDoneTitle => 'Rövanşı tamamladın!';

  @override
  String get reviewDoneBody =>
      'Karty\'lerle yeniden karşılaştın ve öğrendiklerini güçlendirdin.';

  @override
  String reviewDoneTickets(int count) {
    return '+$count bilet kazandın';
  }

  @override
  String get reviewDoneStronger => 'Bilgilerin güçlendi';

  @override
  String get pauseSpoken => 'Oyun duraklatıldı';

  @override
  String get pauseTitle => 'Duraklatıldı';

  @override
  String get pauseCorrectStreak => 'Doğru serisi';

  @override
  String reminderStreakTitle(int streak) {
    return '$streak günlük serin bekliyor';
  }

  @override
  String get reminderStreakBody => 'Bugün bir oyun oyna, serin devam etsin.';

  @override
  String get reminderMissedTitle => 'Seni özledik';

  @override
  String get reminderMissedBody => 'Birkaç kelimeyle kaldığın yerden devam et.';

  @override
  String get reminderInviteTitle => 'Bugünün kelimeleri hazır';

  @override
  String get reminderInviteBody => 'Günde birkaç dakika yeter.';

  @override
  String get reminderChannelName => 'Günlük hatırlatma';

  @override
  String get reminderChannelDescription =>
      'Bugün oynamadıysan günde en çok bir kez hatırlatır.';

  @override
  String get kartyLoadError => 'Karty yüklenirken bir hata oluştu.';

  @override
  String get commonErrorRetry => 'Bir hata oluştu. Tekrar deneyin.';

  @override
  String get kartyPromptNewWord => 'Yeni kelime';

  @override
  String get kartyPromptPickImage => 'Görseli bul';

  @override
  String get kartyPromptPickArticle => 'Artikeli seç';

  @override
  String get kartyPromptArrange => 'Harfleri diz';

  @override
  String get kartyPromptListen => 'Duyduğunu bul';

  @override
  String get kartyTimeUp => 'Süre doldu';

  @override
  String get soundOffSpoken => 'Telaffuz sesi kapalı';

  @override
  String get soundOnSpoken => 'Telaffuz sesi açık';

  @override
  String get soundTurnOn => 'Sesi aç';

  @override
  String get soundTurnOff => 'Sesi kapat';

  @override
  String get gameResumeSpoken => 'Oyuna devam et';

  @override
  String get gamePauseSpoken => 'Oyunu duraklat';

  @override
  String get kartyImageOption => 'Görsel seçeneği';

  @override
  String kartyRemoveLetter(String letter) {
    return '$letter harfini geri al';
  }

  @override
  String get kartyListenWord => 'Kelimeyi dinle';

  @override
  String get kartyListenSlow => 'Yavaş dinle';

  @override
  String kartyLeaguePointsSpoken(int points) {
    return '$points lig puanı';
  }

  @override
  String kartyLeaguePointsBoostSpoken(int points) {
    return '$points lig puanı. Üç kat puan etkin.';
  }

  @override
  String get kartyBoostReadySpoken =>
      'Boost hazır. 20 saniye 3 kat lig puanı için etkinleştir';

  @override
  String get kartyBoostEnergySpoken => 'Boost enerjisi';

  @override
  String get profileNextGoals => 'SIRADAKİ HEDEFLERİN';

  @override
  String get profileToday => 'BUGÜN';

  @override
  String get profileTotal => 'TOPLAM';

  @override
  String get profileWordsLink => 'KELİMELERİM  ›';

  @override
  String get profileWordsLinkSpoken => 'Kelimelerim ekranını aç';

  @override
  String get leagueSaveFailed => 'Lig bilgisi kaydedilemedi. Tekrar dene.';

  @override
  String get leaguePromotedLabel => 'LİG ATLADIN';

  @override
  String leaguePromotedFrom(String name) {
    return '$name Ligi’nden yükseldin.';
  }

  @override
  String get reviewStationSpoken => 'Karty Rövanş';

  @override
  String get pathLoadFailed => 'Karty Yolu yüklenemedi.';

  @override
  String get welcomeTitle => 'Almancayı oyunlarla öğren';

  @override
  String get welcomeSubtitle => 'Günde birkaç dakika yeter.';

  @override
  String get welcomeStart => 'Ücretsiz başla';

  @override
  String get welcomeHaveAccount => 'Zaten hesabım var';

  @override
  String get unitSaveFailed => 'Ünite bilgisi kaydedilemedi. Tekrar dene.';

  @override
  String unitUnlockedLabel(int number) {
    return 'ÜNİTE $number AÇILDI';
  }

  @override
  String unitNewWordsWaiting(int count) {
    return '$count yeni kelime seni bekliyor.';
  }

  @override
  String unitLabel(int number) {
    return 'ÜNİTE $number';
  }

  @override
  String unitWordsWaiting(int count) {
    return '$count kelime seni bekliyor';
  }

  @override
  String unitWordsConsolidated(int done, int total) {
    return '$done/$total kelime pekişti';
  }

  @override
  String streakDayNumber(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days. Gün',
      zero: '0 Gün',
    );
    return '$_temp0';
  }

  @override
  String get questDoneTitle => 'Görev tamamlandı!';

  @override
  String questRewardTickets(int count) {
    return '+$count bilet';
  }

  @override
  String get pronunciationOff => 'Telaffuz kapalı';

  @override
  String get navHome => 'Ana sayfa';

  @override
  String get navLeagues => 'Ligler';

  @override
  String get navQuests => 'Görevler';

  @override
  String get navPremium => 'Premium';

  @override
  String get navProfile => 'Profil';

  @override
  String get subscriptionOpenFailed =>
      'Abonelik sayfası açılamadı. Tekrar dene.';

  @override
  String get networkTimeout =>
      'Bağlantı zaman aşımına uğradı. Daha sonra tekrar deneyin.';

  @override
  String get signedOut => 'Çıkış yapıldı. Tekrar görüşmek üzere!';

  @override
  String get accountDeleted => 'Hesabın silindi.';

  @override
  String get questsCompleted => 'TAMAMLANANLAR';

  @override
  String get authEnterDetails => 'Bilgilerini gir';

  @override
  String get gameOpenFailed => 'Oyun açılamadı. Daha sonra tekrar dene.';

  @override
  String get loadingSpoken => 'Yükleniyor';

  @override
  String get weekdaysShort => 'Pzt Sal Çar Per Cum Cmt Paz';

  @override
  String get monthNames =>
      'Ocak Şubat Mart Nisan Mayıs Haziran Temmuz Ağustos Eylül Ekim Kasım Aralık';

  @override
  String get questsClaimShort => 'AL';

  @override
  String profileFreezeUnit(int count) {
    return 'koruma';
  }

  @override
  String rankOrdinal(int rank) {
    return '$rank.';
  }
}
