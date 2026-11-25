import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sq'),
    Locale('tr')
  ];

  /// Hesap silme penceresinde: Apple ile bağlı hesapta Apple penceresi kapatıldı ya da onay vermedi.
  ///
  /// In tr, this message translates to:
  /// **'Apple onayı alınamadı, hesap silinmedi.'**
  String get accountDeletionAppleCanceled;

  /// No description provided for @leagueMerkur.
  ///
  /// In tr, this message translates to:
  /// **'Merkür'**
  String get leagueMerkur;

  /// No description provided for @leagueAytasi.
  ///
  /// In tr, this message translates to:
  /// **'Aytaşı'**
  String get leagueAytasi;

  /// No description provided for @leagueYildiz.
  ///
  /// In tr, this message translates to:
  /// **'Yıldız'**
  String get leagueYildiz;

  /// No description provided for @leagueKuyruklu.
  ///
  /// In tr, this message translates to:
  /// **'Kuyruklu'**
  String get leagueKuyruklu;

  /// No description provided for @leagueMars.
  ///
  /// In tr, this message translates to:
  /// **'Mars'**
  String get leagueMars;

  /// No description provided for @leagueUranus.
  ///
  /// In tr, this message translates to:
  /// **'Uranüs'**
  String get leagueUranus;

  /// No description provided for @leagueSaturn.
  ///
  /// In tr, this message translates to:
  /// **'Satürn'**
  String get leagueSaturn;

  /// No description provided for @leagueNebula.
  ///
  /// In tr, this message translates to:
  /// **'Nebula'**
  String get leagueNebula;

  /// No description provided for @leagueKosmoz.
  ///
  /// In tr, this message translates to:
  /// **'Kosmoz'**
  String get leagueKosmoz;

  /// No description provided for @leagueSupernova.
  ///
  /// In tr, this message translates to:
  /// **'Supernova'**
  String get leagueSupernova;

  /// No description provided for @leaguePulsar.
  ///
  /// In tr, this message translates to:
  /// **'Pulsar'**
  String get leaguePulsar;

  /// Patikadaki deste düğmesinin adı.
  ///
  /// In tr, this message translates to:
  /// **'Deste {number}'**
  String pathDeck(int number);

  /// Açık bütün desteler bitince patikadaki yalnız tekrar adımı.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar'**
  String get pathReview;

  /// Ünitenin desteleri bitince şu anki düğüm olan pekiştirme kapısı.
  ///
  /// In tr, this message translates to:
  /// **'Pekiştirme'**
  String get pathReinforce;

  /// Bilet penceresi, bilet kalmadığında başlık.
  ///
  /// In tr, this message translates to:
  /// **'Biletin bitti'**
  String get ticketsOut;

  /// Bilet penceresinde "3/5 bilet" satırının birimi.
  ///
  /// In tr, this message translates to:
  /// **'bilet'**
  String get ticketsUnit;

  /// Geri sayım kapsülü; time kalın yazılır (ticketsHoursMinutes ya da ticketsMinutes).
  ///
  /// In tr, this message translates to:
  /// **'{time} sonra 1 bilet'**
  String ticketsNextIn(String time);

  /// No description provided for @ticketsRenewing.
  ///
  /// In tr, this message translates to:
  /// **'Bilet yenileniyor'**
  String get ticketsRenewing;

  /// No description provided for @ticketsSoon.
  ///
  /// In tr, this message translates to:
  /// **'Birazdan'**
  String get ticketsSoon;

  /// No description provided for @ticketsHoursMinutes.
  ///
  /// In tr, this message translates to:
  /// **'{hours} sa {minutes} dk'**
  String ticketsHoursMinutes(int hours, int minutes);

  /// No description provided for @ticketsMinutes.
  ///
  /// In tr, this message translates to:
  /// **'{minutes} dk'**
  String ticketsMinutes(int minutes);

  /// No description provided for @ticketsUnderMinute.
  ///
  /// In tr, this message translates to:
  /// **'<1 dk'**
  String get ticketsUnderMinute;

  /// Biletler tavandayken geri sayım yerine yenilenme kuralı.
  ///
  /// In tr, this message translates to:
  /// **'Harcayınca her {hours} saatte 1 yenilenir'**
  String ticketsCapEveryHours(int hours);

  /// No description provided for @ticketsCapEveryMinutes.
  ///
  /// In tr, this message translates to:
  /// **'Harcayınca her {minutes} dakikada 1 yenilenir'**
  String ticketsCapEveryMinutes(int minutes);

  /// No description provided for @ticketsCapMax.
  ///
  /// In tr, this message translates to:
  /// **'En fazla {max} bilet birikir'**
  String ticketsCapMax(int max);

  /// Bilet penceresinde ücretsiz yolların başlığı; büyük harfle yazılır.
  ///
  /// In tr, this message translates to:
  /// **'ÜCRETSİZ KAZAN'**
  String get ticketsEarnFree;

  /// No description provided for @ticketsReviewOn.
  ///
  /// In tr, this message translates to:
  /// **'Hemen kazan'**
  String get ticketsReviewOn;

  /// No description provided for @ticketsQuests.
  ///
  /// In tr, this message translates to:
  /// **'Görevler'**
  String get ticketsQuests;

  /// Görevler karosu: yanında bugün görevlerden kazanılabilecek bilet.
  ///
  /// In tr, this message translates to:
  /// **'Bugün kalan'**
  String get ticketsQuestsLeft;

  /// No description provided for @ticketsQuestsDone.
  ///
  /// In tr, this message translates to:
  /// **'Yarın yenilenir'**
  String get ticketsQuestsDone;

  /// No description provided for @ticketsQuestsDaily.
  ///
  /// In tr, this message translates to:
  /// **'Günlük görevler'**
  String get ticketsQuestsDaily;

  /// No description provided for @ticketsPremiumTitle.
  ///
  /// In tr, this message translates to:
  /// **'BİLETİN HİÇ BİTMESİN'**
  String get ticketsPremiumTitle;

  /// No description provided for @ticketsPremiumBody.
  ///
  /// In tr, this message translates to:
  /// **'Premium ile beklemeden oyna'**
  String get ticketsPremiumBody;

  /// Ünitenin ortasındaki Artikel adımının düğüm adı.
  ///
  /// In tr, this message translates to:
  /// **'Artikel'**
  String get pathArticle;

  /// Artikel adımının işini söyleyen ikinci satır; açıklama kartında da.
  ///
  /// In tr, this message translates to:
  /// **'der/die/das tekrarı'**
  String get pathArticleDetail;

  /// Şu anki Artikel adımının ilerlemesi (turda doğru bilinen artikel).
  ///
  /// In tr, this message translates to:
  /// **'{done}/{goal} artikel'**
  String pathArticleProgress(int done, int goal);

  /// Rövanş durağının ikinci satırı: bekleyen yanlış kart sayısı.
  ///
  /// In tr, this message translates to:
  /// **'{count} hatanı düzelt'**
  String pathReviewStationDetail(int count);

  /// Rövanş durağı, bekleyen yanlış kart yokken.
  ///
  /// In tr, this message translates to:
  /// **'Hatan yok'**
  String get pathReviewStationEmpty;

  /// Adımın ilk oyunundan önce çıkan açıklama kartındaki düğme; oyunu açar.
  ///
  /// In tr, this message translates to:
  /// **'BAŞLA'**
  String get stepIntroStart;

  /// No description provided for @introDeckTitle.
  ///
  /// In tr, this message translates to:
  /// **'Deste'**
  String get introDeckTitle;

  /// No description provided for @introDeckTagline.
  ///
  /// In tr, this message translates to:
  /// **'{count} yeni kelime'**
  String introDeckTagline(int count);

  /// No description provided for @introDeckRow1.
  ///
  /// In tr, this message translates to:
  /// **'Kelimeler resimleriyle tanıtılır'**
  String get introDeckRow1;

  /// No description provided for @introDeckRow2.
  ///
  /// In tr, this message translates to:
  /// **'Hepsi bilinince deste biter'**
  String get introDeckRow2;

  /// No description provided for @introArticleRow1.
  ///
  /// In tr, this message translates to:
  /// **'Kartı doğru artikele sürükle'**
  String get introArticleRow1;

  /// No description provided for @introArticleRow2.
  ///
  /// In tr, this message translates to:
  /// **'Unutulan artikeller geri gelir'**
  String get introArticleRow2;

  /// No description provided for @introReinforceTagline.
  ///
  /// In tr, this message translates to:
  /// **'Ünitenin son adımı'**
  String get introReinforceTagline;

  /// No description provided for @introReinforceRow1.
  ///
  /// In tr, this message translates to:
  /// **'Doğru bilinen kelime pekişir'**
  String get introReinforceRow1;

  /// No description provided for @introReinforceRow2.
  ///
  /// In tr, this message translates to:
  /// **'%{percent} pekişince yeni ünite açılır'**
  String introReinforceRow2(int percent);

  /// No description provided for @introReviewTitle.
  ///
  /// In tr, this message translates to:
  /// **'Rövanş'**
  String get introReviewTitle;

  /// No description provided for @introReviewTagline.
  ///
  /// In tr, this message translates to:
  /// **'Hataların tekrarı'**
  String get introReviewTagline;

  /// No description provided for @introReviewRow1.
  ///
  /// In tr, this message translates to:
  /// **'Yanlış bilinen kartlar toplanır'**
  String get introReviewRow1;

  /// No description provided for @introReviewRow2.
  ///
  /// In tr, this message translates to:
  /// **'Hepsi düzelince 1 bilet kazanılır'**
  String get introReviewRow2;

  /// Artikel adımının turu bitince.
  ///
  /// In tr, this message translates to:
  /// **'Artikel tamam!'**
  String get articleStepDoneTitle;

  /// No description provided for @articleStepDoneBody.
  ///
  /// In tr, this message translates to:
  /// **'{goal} artikel doğru bilindi. Unutulanlar yeniden sorulur.'**
  String articleStepDoneBody(int goal);

  /// No description provided for @articleStepContinue.
  ///
  /// In tr, this message translates to:
  /// **'DEVAM ET'**
  String get articleStepContinue;

  /// Kilitli ünitenin başlığında. unitSuffix Türkçe ilgi hâli eki (1'in, 2'nin); başka dil kullanmaz.
  ///
  /// In tr, this message translates to:
  /// **'Ünite {unit}{unitSuffix} %{percent}\'i pekişince açılır'**
  String pathUnlockHint(int unit, String unitSuffix, int percent);

  /// Ünite açılış kutlamasında, kilidi açan önceki ünite. unitSuffix yalnız Türkçede.
  ///
  /// In tr, this message translates to:
  /// **'Ünite {unit}{unitSuffix} %{percent}\'ini pekiştirdin.'**
  String unitUnlockReason(int unit, String unitSuffix, int percent);

  /// Sıralamada başka birine dokununca: kişiyi bildir (App Store 1.2).
  ///
  /// In tr, this message translates to:
  /// **'Bildir'**
  String get leagueMemberReport;

  /// Sıralamada başka birine dokununca: kişiyi engelle; onay düğmesi de bu.
  ///
  /// In tr, this message translates to:
  /// **'Engelle'**
  String get leagueMemberBlock;

  /// Bildir/engelle penceresini kapatır.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get leagueMemberCancel;

  /// Bildirim sebebi seçimi başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Neden bildiriyorsun?'**
  String get leagueReportTitle;

  /// No description provided for @leagueReportReasonName.
  ///
  /// In tr, this message translates to:
  /// **'Uygunsuz ad'**
  String get leagueReportReasonName;

  /// No description provided for @leagueReportReasonPhoto.
  ///
  /// In tr, this message translates to:
  /// **'Uygunsuz fotoğraf'**
  String get leagueReportReasonPhoto;

  /// No description provided for @leagueReportReasonOther.
  ///
  /// In tr, this message translates to:
  /// **'Başka bir sebep'**
  String get leagueReportReasonOther;

  /// Bildirim gönderilince çıkan mesaj.
  ///
  /// In tr, this message translates to:
  /// **'Bildirimin alındı, incelenecek.'**
  String get leagueReportSent;

  /// Engel onayı başlığı.
  ///
  /// In tr, this message translates to:
  /// **'{name} engellensin mi?'**
  String leagueBlockTitle(String name);

  /// No description provided for @leagueBlockBody.
  ///
  /// In tr, this message translates to:
  /// **'Sıralamada artık birbirinizi görmezsiniz.'**
  String get leagueBlockBody;

  /// Engel kaydedilince çıkan mesaj.
  ///
  /// In tr, this message translates to:
  /// **'{name} engellendi.'**
  String leagueBlockDone(String name);

  /// No description provided for @leagueModerationFailed.
  ///
  /// In tr, this message translates to:
  /// **'Gönderilemedi. Bağlantını kontrol edip tekrar dene.'**
  String get leagueModerationFailed;

  /// Ekran okuyucu: sıralamadaki satıra dokununca seçenekler açılır.
  ///
  /// In tr, this message translates to:
  /// **'{name} için seçenekler'**
  String leagueMemberOptions(String name);

  /// Premium ürünleri App Store'dan alınamayınca.
  ///
  /// In tr, this message translates to:
  /// **'Mağazaya şu an ulaşılamıyor. Biraz sonra tekrar dene.'**
  String get premiumStoreUnavailable;

  /// No description provided for @premiumWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Premium\'a hoş geldin! Biletlerin artık sınırsız.'**
  String get premiumWelcome;

  /// No description provided for @premiumPurchaseFailed.
  ///
  /// In tr, this message translates to:
  /// **'Satın alma tamamlanamadı. Tekrar dene.'**
  String get premiumPurchaseFailed;

  /// Ask to Buy gibi onay bekleyen satın alma.
  ///
  /// In tr, this message translates to:
  /// **'Satın alma onay bekliyor; onaylanınca Premium açılır.'**
  String get premiumPurchasePending;

  /// No description provided for @premiumNothingToRestore.
  ///
  /// In tr, this message translates to:
  /// **'Geri yüklenecek etkin bir abonelik bulunamadı.'**
  String get premiumNothingToRestore;

  /// No description provided for @premiumActiveTitle.
  ///
  /// In tr, this message translates to:
  /// **'Premium üyeliğin aktif'**
  String get premiumActiveTitle;

  /// No description provided for @premiumActiveBody.
  ///
  /// In tr, this message translates to:
  /// **'Biletlerin sınırsız, seri korumaların her hafta ikiye dolar.'**
  String get premiumActiveBody;

  /// No description provided for @premiumManage.
  ///
  /// In tr, this message translates to:
  /// **'ABONELİĞİ YÖNET'**
  String get premiumManage;

  /// No description provided for @premiumActiveClose.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get premiumActiveClose;

  /// No description provided for @premiumManageFailed.
  ///
  /// In tr, this message translates to:
  /// **'Abonelik sayfası açılamadı. Tekrar dene.'**
  String get premiumManageFailed;

  /// Ekran okuyucu: premium üyenin bilet sayacı (∞).
  ///
  /// In tr, this message translates to:
  /// **'Sınırsız bilet'**
  String get ticketsUnlimited;

  /// Hesap silme penceresi, premium üyede: abonelik hesapla birlikte iptal edilmez (Apple'ın hesap silme yönergesi).
  ///
  /// In tr, this message translates to:
  /// **'Premium abonelik hesapla birlikte iptal edilmez. Ödemenin durması için abonelik App Store\'dan ayrıca iptal edilmelidir.'**
  String get accountDeletionSubscriptionNote;

  /// Hesap silme penceresinde App Store abonelik sayfasını açan bağlantı.
  ///
  /// In tr, this message translates to:
  /// **'Aboneliği yönet'**
  String get accountDeletionManageSubscription;

  /// Girişte "Parolamı unuttum"a dokununca açılan pencerenin başlığı.
  ///
  /// In tr, this message translates to:
  /// **'Şifreni mi unuttun?'**
  String get passwordHelpTitle;

  /// Şifre penceresinin açıklaması; altında destek adresi ayrı satırda durur.
  ///
  /// In tr, this message translates to:
  /// **'Şifre sıfırlama bağlantısı yakında uygulamaya eklenecek. O zamana kadar hesapta kayıtlı e-posta adresinden destek adresine yazılabilir:'**
  String get passwordHelpBody;

  /// E-posta uygulamasında destek adresine taslak açan düğme.
  ///
  /// In tr, this message translates to:
  /// **'DESTEĞE YAZ'**
  String get passwordHelpWrite;

  /// Destek e-postası taslağının konusu.
  ///
  /// In tr, this message translates to:
  /// **'Şifre sıfırlama'**
  String get passwordHelpMailSubject;

  /// E-posta uygulaması açılamayınca adres panoya kopyalanır.
  ///
  /// In tr, this message translates to:
  /// **'E-posta uygulaması açılamadı; adres kopyalandı.'**
  String get passwordHelpCopied;

  /// No description provided for @passwordHelpClose.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get passwordHelpClose;

  /// No description provided for @settingsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settingsTitle;

  /// No description provided for @profilePhotoChange.
  ///
  /// In tr, this message translates to:
  /// **'Profil fotoğrafını değiştir'**
  String get profilePhotoChange;

  /// No description provided for @profilePhotoUpdated.
  ///
  /// In tr, this message translates to:
  /// **'Profil fotoğrafı güncellendi.'**
  String get profilePhotoUpdated;

  /// No description provided for @profilePhotoFailed.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraf yüklenemedi. Tekrar dene.'**
  String get profilePhotoFailed;

  /// No description provided for @pathBackToCurrent.
  ///
  /// In tr, this message translates to:
  /// **'Bulunduğun desteye dön'**
  String get pathBackToCurrent;

  /// No description provided for @pathReviewCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} tekrar'**
  String pathReviewCount(int count);

  /// No description provided for @pathWordCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelime'**
  String pathWordCount(int count);

  /// No description provided for @pathNewProgress.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{goal} yeni'**
  String pathNewProgress(int done, int goal);

  /// No description provided for @pathPractice.
  ///
  /// In tr, this message translates to:
  /// **'Pratik'**
  String get pathPractice;

  /// No description provided for @pathNewWords.
  ///
  /// In tr, this message translates to:
  /// **'{count} yeni kelime'**
  String pathNewWords(int count);

  /// No description provided for @pathWordsProgress.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{total} kelime'**
  String pathWordsProgress(int done, int total);

  /// No description provided for @pathGoalPercent.
  ///
  /// In tr, this message translates to:
  /// **'%{percent}'**
  String pathGoalPercent(int percent);

  /// No description provided for @pathNodeDone.
  ///
  /// In tr, this message translates to:
  /// **'{label}, tamamlandı'**
  String pathNodeDone(String label);

  /// No description provided for @pathNextArticle.
  ///
  /// In tr, this message translates to:
  /// **'Sıradaki Artikel tekrarı'**
  String get pathNextArticle;

  /// No description provided for @pathNextDeck.
  ///
  /// In tr, this message translates to:
  /// **'Sıradaki deste'**
  String get pathNextDeck;

  /// No description provided for @pathGateDone.
  ///
  /// In tr, this message translates to:
  /// **'Ünite sonu, hedefe ulaşıldı'**
  String get pathGateDone;

  /// No description provided for @pathGatePlay.
  ///
  /// In tr, this message translates to:
  /// **'Pekiştirme, oyna'**
  String get pathGatePlay;

  /// No description provided for @pathGateLocked.
  ///
  /// In tr, this message translates to:
  /// **'Ünite sonu, pekiştirme'**
  String get pathGateLocked;

  /// No description provided for @actionContinue.
  ///
  /// In tr, this message translates to:
  /// **'DEVAM ET'**
  String get actionContinue;

  /// No description provided for @actionContinueSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Devam et'**
  String get actionContinueSpoken;

  /// No description provided for @actionStart.
  ///
  /// In tr, this message translates to:
  /// **'BAŞLA'**
  String get actionStart;

  /// No description provided for @actionStartSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Başla'**
  String get actionStartSpoken;

  /// No description provided for @actionReview.
  ///
  /// In tr, this message translates to:
  /// **'TEKRAR ET'**
  String get actionReview;

  /// No description provided for @actionReviewSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar et'**
  String get actionReviewSpoken;

  /// No description provided for @actionPractice.
  ///
  /// In tr, this message translates to:
  /// **'PRATİK'**
  String get actionPractice;

  /// No description provided for @actionPracticeSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Pratik yap'**
  String get actionPracticeSpoken;

  /// No description provided for @pathDueBadge.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelime tekrar bekliyor'**
  String pathDueBadge(int count);

  /// No description provided for @pathSheetDeckWaiting.
  ///
  /// In tr, this message translates to:
  /// **'Bu destenin {count} yeni kelimesi seni bekliyor.'**
  String pathSheetDeckWaiting(int count);

  /// No description provided for @pathSheetUnitDone.
  ///
  /// In tr, this message translates to:
  /// **'Bu ünitenin desteleri bitti. Sıradaki ünite, kelimelerin %{percent}\'i pekişince açılır; tekrarlar onları pekiştiriyor.'**
  String pathSheetUnitDone(int percent);

  /// No description provided for @pathMoreWords.
  ///
  /// In tr, this message translates to:
  /// **'+{count} kelime daha'**
  String pathMoreWords(int count);

  /// No description provided for @pathOpensAfterDeck.
  ///
  /// In tr, this message translates to:
  /// **'Deste {deck} bitince açılır.'**
  String pathOpensAfterDeck(int deck);

  /// No description provided for @pathOpensAfterUnit.
  ///
  /// In tr, this message translates to:
  /// **'Önceki ünite bitince açılır.'**
  String get pathOpensAfterUnit;

  /// No description provided for @pathWordsToMeet.
  ///
  /// In tr, this message translates to:
  /// **'Tanışacağın {count} kelime'**
  String pathWordsToMeet(int count);

  /// No description provided for @pathSheetDoneSummary.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelimeyle tanıştın · {consolidated}{suffix} pekişti'**
  String pathSheetDoneSummary(int count, int consolidated, String suffix);

  /// No description provided for @pathSheetCurrentSummary.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{goal} yeni kelime · {reviews} tekrar'**
  String pathSheetCurrentSummary(int done, int goal, int reviews);

  /// No description provided for @wordStatusDue.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar zamanı'**
  String get wordStatusDue;

  /// No description provided for @wordStatusConsolidated.
  ///
  /// In tr, this message translates to:
  /// **'Pekişti'**
  String get wordStatusConsolidated;

  /// No description provided for @wordStatusLearning.
  ///
  /// In tr, this message translates to:
  /// **'Öğreniliyor'**
  String get wordStatusLearning;

  /// No description provided for @authEnterEmail.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresini gir.'**
  String get authEnterEmail;

  /// No description provided for @authInvalidEmail.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi gir.'**
  String get authInvalidEmail;

  /// No description provided for @authEnterPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifreni gir.'**
  String get authEnterPassword;

  /// No description provided for @authAppleLoginFailed.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile giriş yapılamadı. Tekrar dene.'**
  String get authAppleLoginFailed;

  /// No description provided for @authGoogleLoginFailed.
  ///
  /// In tr, this message translates to:
  /// **'Google ile giriş yapılamadı. Tekrar dene.'**
  String get authGoogleLoginFailed;

  /// No description provided for @authWrongCredentials.
  ///
  /// In tr, this message translates to:
  /// **'E-posta veya şifre hatalı.'**
  String get authWrongCredentials;

  /// No description provided for @authNoConnection.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı. İnternetini ve sunucuyu kontrol et.'**
  String get authNoConnection;

  /// No description provided for @authLoginUnavailable.
  ///
  /// In tr, this message translates to:
  /// **'Şu anda giriş yapılamıyor. Lütfen tekrar dene.'**
  String get authLoginUnavailable;

  /// No description provided for @authGoogleLoginCanceled.
  ///
  /// In tr, this message translates to:
  /// **'Google ile giriş iptal edildi.'**
  String get authGoogleLoginCanceled;

  /// No description provided for @authAppleLoginCanceled.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile giriş iptal edildi.'**
  String get authAppleLoginCanceled;

  /// No description provided for @authEmailHint.
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get authEmailHint;

  /// No description provided for @authPasswordHint.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get authPasswordHint;

  /// No description provided for @authSigningInGoogle.
  ///
  /// In tr, this message translates to:
  /// **'Google ile giriş yapılıyor...'**
  String get authSigningInGoogle;

  /// No description provided for @authSigningInApple.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile giriş yapılıyor...'**
  String get authSigningInApple;

  /// No description provided for @authSigningIn.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yapılıyor...'**
  String get authSigningIn;

  /// No description provided for @authForgotPassword.
  ///
  /// In tr, this message translates to:
  /// **'Parolamı unuttum'**
  String get authForgotPassword;

  /// No description provided for @authSignInApple.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile giriş yap'**
  String get authSignInApple;

  /// No description provided for @authSignInGoogle.
  ///
  /// In tr, this message translates to:
  /// **'Google ile giriş yap'**
  String get authSignInGoogle;

  /// No description provided for @authNoAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın yok mu? '**
  String get authNoAccount;

  /// No description provided for @authSignUp.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt ol'**
  String get authSignUp;

  /// No description provided for @authSignIn.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yap'**
  String get authSignIn;

  /// No description provided for @authFirstNameRequired.
  ///
  /// In tr, this message translates to:
  /// **'İsmini yazmalısın.'**
  String get authFirstNameRequired;

  /// No description provided for @authLastNameRequired.
  ///
  /// In tr, this message translates to:
  /// **'Soyismini yazmalısın.'**
  String get authLastNameRequired;

  /// No description provided for @authPasswordRule.
  ///
  /// In tr, this message translates to:
  /// **'Şifren en az 6 karakter ve bir rakam içermeli.'**
  String get authPasswordRule;

  /// No description provided for @authDuplicateEmail.
  ///
  /// In tr, this message translates to:
  /// **'Bu e-posta adresiyle zaten bir hesap var.'**
  String get authDuplicateEmail;

  /// No description provided for @authDuplicateName.
  ///
  /// In tr, this message translates to:
  /// **'Bu isimle hesap oluşturulamadı. Farklı bir ad veya soyad dene.'**
  String get authDuplicateName;

  /// No description provided for @authCheckDetails.
  ///
  /// In tr, this message translates to:
  /// **'Bilgileri kontrol edip tekrar dene.'**
  String get authCheckDetails;

  /// No description provided for @authSignUpUnavailable.
  ///
  /// In tr, this message translates to:
  /// **'Şu anda kayıt oluşturulamıyor. Lütfen tekrar dene.'**
  String get authSignUpUnavailable;

  /// No description provided for @authCreatedLoginFailed.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın oluşturuldu. Giriş yapılamadı; tekrar dene.'**
  String get authCreatedLoginFailed;

  /// No description provided for @authGoogleContinueCanceled.
  ///
  /// In tr, this message translates to:
  /// **'Google ile devam etme iptal edildi.'**
  String get authGoogleContinueCanceled;

  /// No description provided for @authGoogleContinueFailed.
  ///
  /// In tr, this message translates to:
  /// **'Google ile devam edilemedi. Tekrar dene.'**
  String get authGoogleContinueFailed;

  /// No description provided for @authAppleContinueCanceled.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile devam etme iptal edildi.'**
  String get authAppleContinueCanceled;

  /// No description provided for @authAppleContinueFailed.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile devam edilemedi. Tekrar dene.'**
  String get authAppleContinueFailed;

  /// No description provided for @authContinueApple.
  ///
  /// In tr, this message translates to:
  /// **'Apple ile devam et'**
  String get authContinueApple;

  /// No description provided for @authContinueGoogle.
  ///
  /// In tr, this message translates to:
  /// **'Google ile devam et'**
  String get authContinueGoogle;

  /// No description provided for @authHaveAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın var mı? '**
  String get authHaveAccount;

  /// No description provided for @authFirstNameHint.
  ///
  /// In tr, this message translates to:
  /// **'İsim'**
  String get authFirstNameHint;

  /// No description provided for @authLastNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Soyisim'**
  String get authLastNameHint;

  /// No description provided for @authCreateProfile.
  ///
  /// In tr, this message translates to:
  /// **'Profilini oluştur'**
  String get authCreateProfile;

  /// No description provided for @authOr.
  ///
  /// In tr, this message translates to:
  /// **'veya'**
  String get authOr;

  /// No description provided for @premiumChoosePlan.
  ///
  /// In tr, this message translates to:
  /// **'Planını seç'**
  String get premiumChoosePlan;

  /// No description provided for @premiumTrialDaysFree.
  ///
  /// In tr, this message translates to:
  /// **'{days} gün ücretsiz'**
  String premiumTrialDaysFree(int days);

  /// No description provided for @premiumYearly.
  ///
  /// In tr, this message translates to:
  /// **'Yıllık'**
  String get premiumYearly;

  /// No description provided for @premiumYearlyDetail.
  ///
  /// In tr, this message translates to:
  /// **'Ayda {perMonth} · %{percent} tasarruf'**
  String premiumYearlyDetail(String perMonth, int percent);

  /// No description provided for @premiumPerYear.
  ///
  /// In tr, this message translates to:
  /// **'/ yıl'**
  String get premiumPerYear;

  /// No description provided for @premiumRecommended.
  ///
  /// In tr, this message translates to:
  /// **'ÖNERİLEN'**
  String get premiumRecommended;

  /// No description provided for @premiumMonthly.
  ///
  /// In tr, this message translates to:
  /// **'Aylık'**
  String get premiumMonthly;

  /// No description provided for @premiumMonthlyDetail.
  ///
  /// In tr, this message translates to:
  /// **'Her ay yenilenir'**
  String get premiumMonthlyDetail;

  /// No description provided for @premiumPerMonth.
  ///
  /// In tr, this message translates to:
  /// **'/ ay'**
  String get premiumPerMonth;

  /// No description provided for @commonBack.
  ///
  /// In tr, this message translates to:
  /// **'Geri'**
  String get commonBack;

  /// No description provided for @premiumRenewalYearly.
  ///
  /// In tr, this message translates to:
  /// **'yıllık {price}'**
  String premiumRenewalYearly(String price);

  /// No description provided for @premiumRenewalMonthly.
  ///
  /// In tr, this message translates to:
  /// **'aylık {price}'**
  String premiumRenewalMonthly(String price);

  /// No description provided for @premiumCancelAnytime.
  ///
  /// In tr, this message translates to:
  /// **'{store} üzerinden her zaman iptal edilebilir.'**
  String premiumCancelAnytime(String store);

  /// No description provided for @premiumTryFree.
  ///
  /// In tr, this message translates to:
  /// **'{days} GÜN ÜCRETSİZ DENE'**
  String premiumTryFree(int days);

  /// No description provided for @premiumGoPremium.
  ///
  /// In tr, this message translates to:
  /// **'PREMIUM\'A GEÇ'**
  String get premiumGoPremium;

  /// No description provided for @premiumTermsTrial.
  ///
  /// In tr, this message translates to:
  /// **'Stelinda Premium: {days} gün ücretsiz, ardından {renewal}. Abonelik, deneme süresi ya da dönem bitmeden en az 24 saat önce iptal edilmezse '**
  String premiumTermsTrial(int days, String renewal);

  /// No description provided for @premiumTerms.
  ///
  /// In tr, this message translates to:
  /// **'Stelinda Premium: {renewal}. Abonelik, dönem bitmeden en az 24 saat önce iptal edilmezse '**
  String premiumTerms(String renewal);

  /// No description provided for @premiumAutoRenews.
  ///
  /// In tr, this message translates to:
  /// **'otomatik olarak yenilenir'**
  String get premiumAutoRenews;

  /// No description provided for @premiumTermsEnd.
  ///
  /// In tr, this message translates to:
  /// **'. İptal edildiğinde Premium, dönemin sonuna kadar kullanılabilir.'**
  String get premiumTermsEnd;

  /// No description provided for @premiumRestore.
  ///
  /// In tr, this message translates to:
  /// **'Geri yükle'**
  String get premiumRestore;

  /// No description provided for @legalTerms.
  ///
  /// In tr, this message translates to:
  /// **'Kullanım koşulları'**
  String get legalTerms;

  /// No description provided for @legalPrivacy.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik politikası'**
  String get legalPrivacy;

  /// No description provided for @premiumUnlimitedTickets.
  ///
  /// In tr, this message translates to:
  /// **'Sınırsız bilet'**
  String get premiumUnlimitedTickets;

  /// No description provided for @premiumWeeklyFreezes.
  ///
  /// In tr, this message translates to:
  /// **'Haftada 2 seri koruması'**
  String get premiumWeeklyFreezes;

  /// No description provided for @premiumAllContent.
  ///
  /// In tr, this message translates to:
  /// **'Tüm öğrenme içeriği'**
  String get premiumAllContent;

  /// No description provided for @premiumHeadlineStart.
  ///
  /// In tr, this message translates to:
  /// **'Almanca seviyeni\n'**
  String get premiumHeadlineStart;

  /// No description provided for @premiumHeadlineAccent.
  ///
  /// In tr, this message translates to:
  /// **'bulutların üstüne'**
  String get premiumHeadlineAccent;

  /// No description provided for @premiumHeadlineEnd.
  ///
  /// In tr, this message translates to:
  /// **' çıkar'**
  String get premiumHeadlineEnd;

  /// No description provided for @premiumSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sınırsız bilet ve seri korumasıyla kesintisiz öğren.'**
  String get premiumSubtitle;

  /// No description provided for @commonClose.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get commonClose;

  /// No description provided for @premiumFree.
  ///
  /// In tr, this message translates to:
  /// **'ÜCRETSİZ'**
  String get premiumFree;

  /// No description provided for @summaryPracticeDone.
  ///
  /// In tr, this message translates to:
  /// **'Pratik tamam!'**
  String get summaryPracticeDone;

  /// No description provided for @summaryReinforceDone.
  ///
  /// In tr, this message translates to:
  /// **'Pekiştirme tamam!'**
  String get summaryReinforceDone;

  /// No description provided for @summaryDeckDone.
  ///
  /// In tr, this message translates to:
  /// **'Deste {deck} tamam!'**
  String summaryDeckDone(int deck);

  /// No description provided for @summaryReviewDone.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar tamam!'**
  String get summaryReviewDone;

  /// No description provided for @summaryOneMoreRound.
  ///
  /// In tr, this message translates to:
  /// **'BİR TUR DAHA'**
  String get summaryOneMoreRound;

  /// No description provided for @summaryPractice.
  ///
  /// In tr, this message translates to:
  /// **'PRATİK YAP'**
  String get summaryPractice;

  /// No description provided for @summaryPracticedWords.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelimeyle pratik yaptın.\nKelimeler pekiştirmede pekişir.'**
  String summaryPracticedWords(int count);

  /// No description provided for @summaryConsolidated.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelime pekişti.'**
  String summaryConsolidated(int count);

  /// No description provided for @summaryNoneConsolidated.
  ///
  /// In tr, this message translates to:
  /// **'Bu turda pekişen kelime olmadı.'**
  String get summaryNoneConsolidated;

  /// No description provided for @summaryGoalLeft.
  ///
  /// In tr, this message translates to:
  /// **'{gained}\nHedefe {left} kelime kaldı.'**
  String summaryGoalLeft(String gained, int left);

  /// No description provided for @summaryGoalReached.
  ///
  /// In tr, this message translates to:
  /// **'{gained}\nHedefe ulaştın.'**
  String summaryGoalReached(String gained);

  /// No description provided for @summaryMetWords.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelimeyle tanıştın'**
  String summaryMetWords(int count);

  /// No description provided for @summaryReviewedWords.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelimeyi tekrar ettin'**
  String summaryReviewedWords(int count);

  /// No description provided for @summaryLearnedConsolidated.
  ///
  /// In tr, this message translates to:
  /// **'{learned}, {count} kelime pekişti.'**
  String summaryLearnedConsolidated(String learned, int count);

  /// No description provided for @summaryLearnedDeck.
  ///
  /// In tr, this message translates to:
  /// **'{learned}.\nDesteler bitince pekiştirme açılır.'**
  String summaryLearnedDeck(String learned);

  /// No description provided for @statPoints.
  ///
  /// In tr, this message translates to:
  /// **'PUAN'**
  String get statPoints;

  /// No description provided for @statCorrect.
  ///
  /// In tr, this message translates to:
  /// **'DOĞRU'**
  String get statCorrect;

  /// No description provided for @statRevenge.
  ///
  /// In tr, this message translates to:
  /// **'RÖVANŞ'**
  String get statRevenge;

  /// No description provided for @pointsCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} puan'**
  String pointsCount(int count);

  /// No description provided for @leaguePointsTo.
  ///
  /// In tr, this message translates to:
  /// **'{league} Ligi\'ne {points} kaldı'**
  String leaguePointsTo(String league, String points);

  /// No description provided for @questsTicketsFull.
  ///
  /// In tr, this message translates to:
  /// **'Biletlerin dolu. Biraz oyna, sonra ödülünü al — görev seni bekliyor.'**
  String get questsTicketsFull;

  /// No description provided for @questsFreezeCap.
  ///
  /// In tr, this message translates to:
  /// **'En fazla {cap} seri koruması tutulabilir.'**
  String questsFreezeCap(int cap);

  /// No description provided for @questsFreezeClaimed.
  ///
  /// In tr, this message translates to:
  /// **'Seri koruması alındı.'**
  String get questsFreezeClaimed;

  /// No description provided for @questsDemoTitle.
  ///
  /// In tr, this message translates to:
  /// **'3 günlük seriye ulaş'**
  String get questsDemoTitle;

  /// No description provided for @questsDaily.
  ///
  /// In tr, this message translates to:
  /// **'GÜNLÜK GÖREVLER'**
  String get questsDaily;

  /// No description provided for @questsAllDoneToday.
  ///
  /// In tr, this message translates to:
  /// **'Bugünün tüm görevlerini bitirdin.'**
  String get questsAllDoneToday;

  /// No description provided for @questsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Görevler'**
  String get questsTitle;

  /// No description provided for @questsProgress.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{total} görev'**
  String questsProgress(int done, int total);

  /// No description provided for @questsFreezeTaken.
  ///
  /// In tr, this message translates to:
  /// **'Seri koruması alındı'**
  String get questsFreezeTaken;

  /// No description provided for @questsRewardFreeze.
  ///
  /// In tr, this message translates to:
  /// **'{head} · ödül: seri koruması'**
  String questsRewardFreeze(String head);

  /// No description provided for @questsGoalLabel.
  ///
  /// In tr, this message translates to:
  /// **'BUGÜNÜN HEDEFİ'**
  String get questsGoalLabel;

  /// No description provided for @questsAllDone.
  ///
  /// In tr, this message translates to:
  /// **'Hepsini bitirdin!'**
  String get questsAllDone;

  /// No description provided for @questsFinishAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm görevleri bitir'**
  String get questsFinishAll;

  /// No description provided for @questsFreezeReadySpoken.
  ///
  /// In tr, this message translates to:
  /// **'Seri koruması hazır, al'**
  String get questsFreezeReadySpoken;

  /// No description provided for @questsFreezeReady.
  ///
  /// In tr, this message translates to:
  /// **'Seri koruması hazır'**
  String get questsFreezeReady;

  /// No description provided for @questsRefreshing.
  ///
  /// In tr, this message translates to:
  /// **'YENİLENİYOR'**
  String get questsRefreshing;

  /// No description provided for @questsHoursMinutesShort.
  ///
  /// In tr, this message translates to:
  /// **'{hours} SA {minutes} DK'**
  String questsHoursMinutesShort(int hours, int minutes);

  /// No description provided for @questsMinutesShort.
  ///
  /// In tr, this message translates to:
  /// **'{minutes} DK'**
  String questsMinutesShort(int minutes);

  /// No description provided for @questsRefreshingSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Görevler yenileniyor'**
  String get questsRefreshingSpoken;

  /// No description provided for @questsRefreshInHours.
  ///
  /// In tr, this message translates to:
  /// **'Görevler {hours} saat {minutes} dakika sonra yenilenir'**
  String questsRefreshInHours(int hours, int minutes);

  /// No description provided for @questsRefreshInMinutes.
  ///
  /// In tr, this message translates to:
  /// **'Görevler {minutes} dakika sonra yenilenir'**
  String questsRefreshInMinutes(int minutes);

  /// No description provided for @questsClaimReward.
  ///
  /// In tr, this message translates to:
  /// **'Ödülü al: {count} bilet'**
  String questsClaimReward(int count);

  /// No description provided for @questsFreezeTodayClaimed.
  ///
  /// In tr, this message translates to:
  /// **'Bugünün seri koruması alındı.'**
  String get questsFreezeTodayClaimed;

  /// No description provided for @questsFreezeAfterAll.
  ///
  /// In tr, this message translates to:
  /// **'Seri koruması tüm görevler bitince alınabilir.'**
  String get questsFreezeAfterAll;

  /// No description provided for @questsFreeze.
  ///
  /// In tr, this message translates to:
  /// **'Seri koruması'**
  String get questsFreeze;

  /// No description provided for @questsLoadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Görevler yüklenemedi.\nAşağı çekerek tekrar dene.'**
  String get questsLoadFailed;

  /// No description provided for @leagueMonthlySeason.
  ///
  /// In tr, this message translates to:
  /// **'Aylık sezon'**
  String get leagueMonthlySeason;

  /// No description provided for @leagueSeasonOf.
  ///
  /// In tr, this message translates to:
  /// **'{monthYear} sezonu'**
  String leagueSeasonOf(String monthYear);

  /// No description provided for @leagueSeasonRenewing.
  ///
  /// In tr, this message translates to:
  /// **'Sezon yenileniyor'**
  String get leagueSeasonRenewing;

  /// No description provided for @leagueSeasonEndsDays.
  ///
  /// In tr, this message translates to:
  /// **'Sezon bitimine {days} gün {hours} saat'**
  String leagueSeasonEndsDays(int days, int hours);

  /// No description provided for @leagueSeasonEndsHours.
  ///
  /// In tr, this message translates to:
  /// **'Sezon bitimine {hours} saat {minutes} dk'**
  String leagueSeasonEndsHours(int hours, int minutes);

  /// No description provided for @leagueSeasonEndsMinutes.
  ///
  /// In tr, this message translates to:
  /// **'Sezon bitimine {minutes} dk'**
  String leagueSeasonEndsMinutes(int minutes);

  /// No description provided for @leagueNamed.
  ///
  /// In tr, this message translates to:
  /// **'{name} Ligi'**
  String leagueNamed(String name);

  /// No description provided for @leagueYourPoints.
  ///
  /// In tr, this message translates to:
  /// **'Lig puanın'**
  String get leagueYourPoints;

  /// No description provided for @leagueNextThreshold.
  ///
  /// In tr, this message translates to:
  /// **'{league} için {threshold} puan · {left} puan kaldı'**
  String leagueNextThreshold(String league, int threshold, int left);

  /// No description provided for @leagueTopReached.
  ///
  /// In tr, this message translates to:
  /// **'En üst ligdesin'**
  String get leagueTopReached;

  /// No description provided for @leagueHowPointsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Puan nasıl kazanılır?'**
  String get leagueHowPointsTitle;

  /// No description provided for @leagueHowPointsBody.
  ///
  /// In tr, this message translates to:
  /// **'Karty’de doğru cevap +1, Boost ile doğru cevap +3 puan verir.'**
  String get leagueHowPointsBody;

  /// No description provided for @leagueNewSeasonTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yeni sezonda ne olur?'**
  String get leagueNewSeasonTitle;

  /// No description provided for @leagueNewSeasonBody.
  ///
  /// In tr, this message translates to:
  /// **'Her ay yeni sezon başlar. Son liginden bir kademe aşağıdan başlarsın; ara verdiğin her ek ay için bir kademe daha düşersin (en az Merkür).'**
  String get leagueNewSeasonBody;

  /// No description provided for @commonGotIt.
  ///
  /// In tr, this message translates to:
  /// **'ANLADIM'**
  String get commonGotIt;

  /// No description provided for @leagueInfoButton.
  ///
  /// In tr, this message translates to:
  /// **'Lig ve sezon bilgisi'**
  String get leagueInfoButton;

  /// No description provided for @countdownRenewing.
  ///
  /// In tr, this message translates to:
  /// **'Yenileniyor'**
  String get countdownRenewing;

  /// No description provided for @countdownDays.
  ///
  /// In tr, this message translates to:
  /// **'{days} gün'**
  String countdownDays(int days);

  /// No description provided for @countdownHours.
  ///
  /// In tr, this message translates to:
  /// **'{hours} sa'**
  String countdownHours(int hours);

  /// No description provided for @countdownMinutes.
  ///
  /// In tr, this message translates to:
  /// **'{minutes} dk'**
  String countdownMinutes(int minutes);

  /// No description provided for @leagueSeasonEndsIn.
  ///
  /// In tr, this message translates to:
  /// **'Sezonun bitmesine {value}'**
  String leagueSeasonEndsIn(String value);

  /// No description provided for @leagueSoloSceneLabel.
  ///
  /// In tr, this message translates to:
  /// **'Lig gezegenine bayrak diken maskot'**
  String get leagueSoloSceneLabel;

  /// No description provided for @leagueFirstToReach.
  ///
  /// In tr, this message translates to:
  /// **'{league} Ligi\'ne ilk sen ulaştın'**
  String leagueFirstToReach(String league);

  /// No description provided for @leagueRivalsComing.
  ///
  /// In tr, this message translates to:
  /// **'Yeni rakipler yolda.'**
  String get leagueRivalsComing;

  /// No description provided for @leagueEntryPoints.
  ///
  /// In tr, this message translates to:
  /// **'{count} Puan'**
  String leagueEntryPoints(int count);

  /// No description provided for @wordsLoadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Kelimeler yüklenemedi. Tekrar deneyebilirsin.'**
  String get wordsLoadFailed;

  /// No description provided for @wordsMoreFailed.
  ///
  /// In tr, this message translates to:
  /// **'Diğer kelimeler yüklenemedi.'**
  String get wordsMoreFailed;

  /// No description provided for @commonTryAgain.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene'**
  String get commonTryAgain;

  /// No description provided for @wordsSoundOff.
  ///
  /// In tr, this message translates to:
  /// **'Ses kapalı. Telaffuzu dinlemek için açabilirsin.'**
  String get wordsSoundOff;

  /// No description provided for @wordsTurnSoundOn.
  ///
  /// In tr, this message translates to:
  /// **'Sesi aç'**
  String get wordsTurnSoundOn;

  /// No description provided for @wordsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kelimelerim'**
  String get wordsTitle;

  /// No description provided for @wordsCollection.
  ///
  /// In tr, this message translates to:
  /// **'Kelime koleksiyonun'**
  String get wordsCollection;

  /// No description provided for @wordsMetCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelimeyle tanıştın'**
  String wordsMetCount(int count);

  /// No description provided for @wordsSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kelimelerine yeniden göz at, seslerini dinle.'**
  String get wordsSubtitle;

  /// No description provided for @wordsFilterAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get wordsFilterAll;

  /// No description provided for @wordsFilterNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni'**
  String get wordsFilterNew;

  /// No description provided for @wordsFilterDue.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar'**
  String get wordsFilterDue;

  /// No description provided for @wordsFilterArticle.
  ///
  /// In tr, this message translates to:
  /// **'Artikel'**
  String get wordsFilterArticle;

  /// No description provided for @wordsHeader.
  ///
  /// In tr, this message translates to:
  /// **'KELİMELER'**
  String get wordsHeader;

  /// No description provided for @wordsEmptyNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni tanıştığın kelime yok.'**
  String get wordsEmptyNew;

  /// No description provided for @wordsEmptyDue.
  ///
  /// In tr, this message translates to:
  /// **'Şu an tekrar zamanı gelen kelime yok.'**
  String get wordsEmptyDue;

  /// No description provided for @wordsEmptyArticle.
  ///
  /// In tr, this message translates to:
  /// **'Artikel çalışacak kelime yok.'**
  String get wordsEmptyArticle;

  /// No description provided for @wordsEmptyAll.
  ///
  /// In tr, this message translates to:
  /// **'Henüz bir kelimeyle tanışmadın.'**
  String get wordsEmptyAll;

  /// No description provided for @commonTryAgainCaps.
  ///
  /// In tr, this message translates to:
  /// **'TEKRAR DENE'**
  String get commonTryAgainCaps;

  /// No description provided for @wordStatusPracticeArticle.
  ///
  /// In tr, this message translates to:
  /// **'Artikel çalış'**
  String get wordStatusPracticeArticle;

  /// No description provided for @wordStatusNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni tanıştın'**
  String get wordStatusNew;

  /// No description provided for @wordStatusStudied.
  ///
  /// In tr, this message translates to:
  /// **'Çalışıldı'**
  String get wordStatusStudied;

  /// No description provided for @wordListenTo.
  ///
  /// In tr, this message translates to:
  /// **'{word} telaffuzunu dinle'**
  String wordListenTo(String word);

  /// No description provided for @wordListenHintMuted.
  ///
  /// In tr, this message translates to:
  /// **'Dinlemek için önce sesi aç'**
  String get wordListenHintMuted;

  /// No description provided for @wordListenHintReplay.
  ///
  /// In tr, this message translates to:
  /// **'Telaffuzu yeniden çal'**
  String get wordListenHintReplay;

  /// No description provided for @wordListenTipMuted.
  ///
  /// In tr, this message translates to:
  /// **'Sesi açıp dinle'**
  String get wordListenTipMuted;

  /// No description provided for @wordListenTip.
  ///
  /// In tr, this message translates to:
  /// **'Telaffuzu dinle'**
  String get wordListenTip;

  /// No description provided for @settingsVersion.
  ///
  /// In tr, this message translates to:
  /// **'Sürüm {version}'**
  String settingsVersion(String version);

  /// No description provided for @settingsSound.
  ///
  /// In tr, this message translates to:
  /// **'Ses'**
  String get settingsSound;

  /// No description provided for @settingsVibration.
  ///
  /// In tr, this message translates to:
  /// **'Titreşim'**
  String get settingsVibration;

  /// No description provided for @settingsManageSubscription.
  ///
  /// In tr, this message translates to:
  /// **'Aboneliği yönet'**
  String get settingsManageSubscription;

  /// No description provided for @settingsSignOut.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yap'**
  String get settingsSignOut;

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabı sil'**
  String get settingsDeleteAccount;

  /// No description provided for @settingsNoConnection.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı. İnternetini kontrol edip tekrar dene.'**
  String get settingsNoConnection;

  /// No description provided for @settingsDeleteFailed.
  ///
  /// In tr, this message translates to:
  /// **'Hesap silinemedi. Tekrar dene.'**
  String get settingsDeleteFailed;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın silinsin mi?'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountBody.
  ///
  /// In tr, this message translates to:
  /// **'Puanın, serin, öğrendiğin kelimeler ve lig sıralaman kalıcı olarak silinir. Bu işlem geri alınamaz.'**
  String get deleteAccountBody;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In tr, this message translates to:
  /// **'HESABIMI SİL'**
  String get deleteAccountConfirm;

  /// No description provided for @commonCancel.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get commonCancel;

  /// No description provided for @profileTopLeague.
  ///
  /// In tr, this message translates to:
  /// **'En üst lig'**
  String get profileTopLeague;

  /// No description provided for @profileNextLeague.
  ///
  /// In tr, this message translates to:
  /// **'Bir üst lig'**
  String get profileNextLeague;

  /// No description provided for @profileAtTop.
  ///
  /// In tr, this message translates to:
  /// **'Zirvedesin'**
  String get profileAtTop;

  /// No description provided for @profilePointsLeft.
  ///
  /// In tr, this message translates to:
  /// **'{count} puan kaldı'**
  String profilePointsLeft(int count);

  /// No description provided for @profileStreakBadge.
  ///
  /// In tr, this message translates to:
  /// **'{days} günlük rozet'**
  String profileStreakBadge(int days);

  /// No description provided for @profileDaysLeft.
  ///
  /// In tr, this message translates to:
  /// **'{count} gün kaldı'**
  String profileDaysLeft(int count);

  /// No description provided for @statWords.
  ///
  /// In tr, this message translates to:
  /// **'KELİME'**
  String get statWords;

  /// No description provided for @statArticles.
  ///
  /// In tr, this message translates to:
  /// **'ARTİKEL'**
  String get statArticles;

  /// No description provided for @statLeaderboard.
  ///
  /// In tr, this message translates to:
  /// **'LİDERLİK'**
  String get statLeaderboard;

  /// No description provided for @profileWordsOpen.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelime, Kelimelerim ekranını aç'**
  String profileWordsOpen(String count);

  /// No description provided for @profileRevengeWaiting.
  ///
  /// In tr, this message translates to:
  /// **'{count} rövanş kartı seni bekliyor'**
  String profileRevengeWaiting(int count);

  /// No description provided for @profileRevengeNone.
  ///
  /// In tr, this message translates to:
  /// **'Rövanş kartın yok'**
  String get profileRevengeNone;

  /// No description provided for @profileRevengeWin.
  ///
  /// In tr, this message translates to:
  /// **'Yanlış bildiklerini geri kazan'**
  String get profileRevengeWin;

  /// No description provided for @profileRevengeCollect.
  ///
  /// In tr, this message translates to:
  /// **'Yanlış cevapladıkların burada birikir'**
  String get profileRevengeCollect;

  /// No description provided for @profileDailyStreak.
  ///
  /// In tr, this message translates to:
  /// **'günlük seri'**
  String get profileDailyStreak;

  /// No description provided for @streakGalaxy.
  ///
  /// In tr, this message translates to:
  /// **'Galaksi seviyesindesin!'**
  String get streakGalaxy;

  /// No description provided for @streakKeepRhythm.
  ///
  /// In tr, this message translates to:
  /// **'Ritmi koru!'**
  String get streakKeepRhythm;

  /// No description provided for @streakGreat.
  ///
  /// In tr, this message translates to:
  /// **'Harika gidiyorsun!'**
  String get streakGreat;

  /// No description provided for @streakRiseUp.
  ///
  /// In tr, this message translates to:
  /// **'Haydi yüksel!'**
  String get streakRiseUp;

  /// No description provided for @streakStretch.
  ///
  /// In tr, this message translates to:
  /// **'Beyni esnetme zamanı!'**
  String get streakStretch;

  /// No description provided for @streakMedal.
  ///
  /// In tr, this message translates to:
  /// **'Madalyanı kazan!'**
  String get streakMedal;

  /// No description provided for @streakConsistency.
  ///
  /// In tr, this message translates to:
  /// **'İstikrarın seni güçlendiriyor!'**
  String get streakConsistency;

  /// No description provided for @streakMissedYou.
  ///
  /// In tr, this message translates to:
  /// **'Seni özledik!'**
  String get streakMissedYou;

  /// No description provided for @streakCatchWind.
  ///
  /// In tr, this message translates to:
  /// **'Rüzgarı yakala!'**
  String get streakCatchWind;

  /// No description provided for @streakProtected.
  ///
  /// In tr, this message translates to:
  /// **'Serin korundu!'**
  String get streakProtected;

  /// No description provided for @streakLongest.
  ///
  /// In tr, this message translates to:
  /// **'En uzun seridesin!'**
  String get streakLongest;

  /// No description provided for @streakContinues.
  ///
  /// In tr, this message translates to:
  /// **'Serin devam ediyor!'**
  String get streakContinues;

  /// No description provided for @streakComeBack.
  ///
  /// In tr, this message translates to:
  /// **'Bugün geri dön!'**
  String get streakComeBack;

  /// No description provided for @streakAtRiskTitle.
  ///
  /// In tr, this message translates to:
  /// **'{days} günlük serin tehlikede'**
  String streakAtRiskTitle(int days);

  /// No description provided for @streakFreezeKicked.
  ///
  /// In tr, this message translates to:
  /// **'{days, plural, =1{Bir gün ara verdin ama seri koruman devreye girdi.} other{{days} gün ara verdin ama seri koruman devreye girdi.}}'**
  String streakFreezeKicked(int days);

  /// No description provided for @streakFreezeAsk.
  ///
  /// In tr, this message translates to:
  /// **'{days, plural, =1{Bir gün ara verdin. Seri koruman kullanılsın mı?} other{{days} gün ara verdin. Seri koruman kullanılsın mı?}}'**
  String streakFreezeAsk(int days);

  /// No description provided for @streakFreezeCost.
  ///
  /// In tr, this message translates to:
  /// **'{spent} koruma harcanır, {left} kalır'**
  String streakFreezeCost(int spent, int left);

  /// No description provided for @streakDayStreakLabel.
  ///
  /// In tr, this message translates to:
  /// **'günlük seri'**
  String get streakDayStreakLabel;

  /// No description provided for @streakFreezesLeftLabel.
  ///
  /// In tr, this message translates to:
  /// **'koruma kaldı'**
  String get streakFreezesLeftLabel;

  /// No description provided for @streakUseFreeze.
  ///
  /// In tr, this message translates to:
  /// **'KORUMAYI KULLAN'**
  String get streakUseFreeze;

  /// No description provided for @streakDeclineFreeze.
  ///
  /// In tr, this message translates to:
  /// **'GEREK YOK, SERİ SIFIRLANSIN'**
  String get streakDeclineFreeze;

  /// No description provided for @articlePickSpoken.
  ///
  /// In tr, this message translates to:
  /// **'{article} seç'**
  String articlePickSpoken(String article);

  /// No description provided for @gameExit.
  ///
  /// In tr, this message translates to:
  /// **'Oyundan çık'**
  String get gameExit;

  /// No description provided for @articleCorrectFeedback.
  ///
  /// In tr, this message translates to:
  /// **'Doğru! {phrase}'**
  String articleCorrectFeedback(String phrase);

  /// No description provided for @articleAllDoneTitle.
  ///
  /// In tr, this message translates to:
  /// **'Harika iş!'**
  String get articleAllDoneTitle;

  /// No description provided for @articleAllDoneBody.
  ///
  /// In tr, this message translates to:
  /// **'Şimdilik çalışılacak artikel kartı kalmadı.'**
  String get articleAllDoneBody;

  /// No description provided for @actionMainMenu.
  ///
  /// In tr, this message translates to:
  /// **'ANA MENÜYE DÖN'**
  String get actionMainMenu;

  /// No description provided for @commonGoBackCaps.
  ///
  /// In tr, this message translates to:
  /// **'GERİ DÖN'**
  String get commonGoBackCaps;

  /// No description provided for @articleLockedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Artikel Pusulası hazırlanıyor'**
  String get articleLockedTitle;

  /// No description provided for @articleLockedBody.
  ///
  /// In tr, this message translates to:
  /// **'{count} farklı Karty öğrenince açılır'**
  String articleLockedBody(int count);

  /// No description provided for @actionPlayKarty.
  ///
  /// In tr, this message translates to:
  /// **'KARTY OYNA'**
  String get actionPlayKarty;

  /// No description provided for @reviewDoneTitle.
  ///
  /// In tr, this message translates to:
  /// **'Rövanşı tamamladın!'**
  String get reviewDoneTitle;

  /// No description provided for @reviewDoneBody.
  ///
  /// In tr, this message translates to:
  /// **'Karty\'lerle yeniden karşılaştın ve öğrendiklerini güçlendirdin.'**
  String get reviewDoneBody;

  /// No description provided for @reviewDoneTickets.
  ///
  /// In tr, this message translates to:
  /// **'+{count} bilet kazandın'**
  String reviewDoneTickets(int count);

  /// No description provided for @reviewDoneStronger.
  ///
  /// In tr, this message translates to:
  /// **'Bilgilerin güçlendi'**
  String get reviewDoneStronger;

  /// No description provided for @pauseSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Oyun duraklatıldı'**
  String get pauseSpoken;

  /// No description provided for @pauseTitle.
  ///
  /// In tr, this message translates to:
  /// **'Duraklatıldı'**
  String get pauseTitle;

  /// No description provided for @pauseCorrectStreak.
  ///
  /// In tr, this message translates to:
  /// **'Doğru serisi'**
  String get pauseCorrectStreak;

  /// No description provided for @reminderStreakTitle.
  ///
  /// In tr, this message translates to:
  /// **'{streak} günlük serin bekliyor'**
  String reminderStreakTitle(int streak);

  /// No description provided for @reminderStreakBody.
  ///
  /// In tr, this message translates to:
  /// **'Bugün bir oyun oyna, serin devam etsin.'**
  String get reminderStreakBody;

  /// No description provided for @reminderMissedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Seni özledik'**
  String get reminderMissedTitle;

  /// No description provided for @reminderMissedBody.
  ///
  /// In tr, this message translates to:
  /// **'Birkaç kelimeyle kaldığın yerden devam et.'**
  String get reminderMissedBody;

  /// No description provided for @reminderInviteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bugünün kelimeleri hazır'**
  String get reminderInviteTitle;

  /// No description provided for @reminderInviteBody.
  ///
  /// In tr, this message translates to:
  /// **'Günde birkaç dakika yeter.'**
  String get reminderInviteBody;

  /// No description provided for @reminderChannelName.
  ///
  /// In tr, this message translates to:
  /// **'Günlük hatırlatma'**
  String get reminderChannelName;

  /// No description provided for @reminderChannelDescription.
  ///
  /// In tr, this message translates to:
  /// **'Bugün oynamadıysan günde en çok bir kez hatırlatır.'**
  String get reminderChannelDescription;

  /// No description provided for @kartyLoadError.
  ///
  /// In tr, this message translates to:
  /// **'Karty yüklenirken bir hata oluştu.'**
  String get kartyLoadError;

  /// No description provided for @commonErrorRetry.
  ///
  /// In tr, this message translates to:
  /// **'Bir hata oluştu. Tekrar deneyin.'**
  String get commonErrorRetry;

  /// No description provided for @kartyPromptNewWord.
  ///
  /// In tr, this message translates to:
  /// **'Yeni kelime'**
  String get kartyPromptNewWord;

  /// No description provided for @kartyPromptPickImage.
  ///
  /// In tr, this message translates to:
  /// **'Görseli bul'**
  String get kartyPromptPickImage;

  /// No description provided for @kartyPromptPickArticle.
  ///
  /// In tr, this message translates to:
  /// **'Artikeli seç'**
  String get kartyPromptPickArticle;

  /// No description provided for @kartyPromptArrange.
  ///
  /// In tr, this message translates to:
  /// **'Harfleri diz'**
  String get kartyPromptArrange;

  /// No description provided for @kartyPromptListen.
  ///
  /// In tr, this message translates to:
  /// **'Duyduğunu bul'**
  String get kartyPromptListen;

  /// No description provided for @kartyTimeUp.
  ///
  /// In tr, this message translates to:
  /// **'Süre doldu'**
  String get kartyTimeUp;

  /// No description provided for @soundOffSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Telaffuz sesi kapalı'**
  String get soundOffSpoken;

  /// No description provided for @soundOnSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Telaffuz sesi açık'**
  String get soundOnSpoken;

  /// No description provided for @soundTurnOn.
  ///
  /// In tr, this message translates to:
  /// **'Sesi aç'**
  String get soundTurnOn;

  /// No description provided for @soundTurnOff.
  ///
  /// In tr, this message translates to:
  /// **'Sesi kapat'**
  String get soundTurnOff;

  /// No description provided for @gameResumeSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Oyuna devam et'**
  String get gameResumeSpoken;

  /// No description provided for @gamePauseSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Oyunu duraklat'**
  String get gamePauseSpoken;

  /// No description provided for @kartyImageOption.
  ///
  /// In tr, this message translates to:
  /// **'Görsel seçeneği'**
  String get kartyImageOption;

  /// No description provided for @kartyRemoveLetter.
  ///
  /// In tr, this message translates to:
  /// **'{letter} harfini geri al'**
  String kartyRemoveLetter(String letter);

  /// No description provided for @kartyListenWord.
  ///
  /// In tr, this message translates to:
  /// **'Kelimeyi dinle'**
  String get kartyListenWord;

  /// No description provided for @kartyListenSlow.
  ///
  /// In tr, this message translates to:
  /// **'Yavaş dinle'**
  String get kartyListenSlow;

  /// No description provided for @kartyLeaguePointsSpoken.
  ///
  /// In tr, this message translates to:
  /// **'{points} lig puanı'**
  String kartyLeaguePointsSpoken(int points);

  /// No description provided for @kartyLeaguePointsBoostSpoken.
  ///
  /// In tr, this message translates to:
  /// **'{points} lig puanı. Üç kat puan etkin.'**
  String kartyLeaguePointsBoostSpoken(int points);

  /// No description provided for @kartyBoostReadySpoken.
  ///
  /// In tr, this message translates to:
  /// **'Boost hazır. 20 saniye 3 kat lig puanı için etkinleştir'**
  String get kartyBoostReadySpoken;

  /// No description provided for @kartyBoostEnergySpoken.
  ///
  /// In tr, this message translates to:
  /// **'Boost enerjisi'**
  String get kartyBoostEnergySpoken;

  /// No description provided for @profileNextGoals.
  ///
  /// In tr, this message translates to:
  /// **'SIRADAKİ HEDEFLERİN'**
  String get profileNextGoals;

  /// No description provided for @profileToday.
  ///
  /// In tr, this message translates to:
  /// **'BUGÜN'**
  String get profileToday;

  /// No description provided for @profileTotal.
  ///
  /// In tr, this message translates to:
  /// **'TOPLAM'**
  String get profileTotal;

  /// No description provided for @profileWordsLink.
  ///
  /// In tr, this message translates to:
  /// **'KELİMELERİM  ›'**
  String get profileWordsLink;

  /// No description provided for @profileWordsLinkSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Kelimelerim ekranını aç'**
  String get profileWordsLinkSpoken;

  /// No description provided for @leagueSaveFailed.
  ///
  /// In tr, this message translates to:
  /// **'Lig bilgisi kaydedilemedi. Tekrar dene.'**
  String get leagueSaveFailed;

  /// No description provided for @leaguePromotedLabel.
  ///
  /// In tr, this message translates to:
  /// **'LİG ATLADIN'**
  String get leaguePromotedLabel;

  /// No description provided for @leaguePromotedFrom.
  ///
  /// In tr, this message translates to:
  /// **'{name} Ligi’nden yükseldin.'**
  String leaguePromotedFrom(String name);

  /// No description provided for @reviewStationSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Karty Rövanş'**
  String get reviewStationSpoken;

  /// No description provided for @pathLoadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Karty Yolu yüklenemedi.'**
  String get pathLoadFailed;

  /// No description provided for @welcomeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Almancayı oyunlarla öğren'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Günde birkaç dakika yeter.'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeStart.
  ///
  /// In tr, this message translates to:
  /// **'Ücretsiz başla'**
  String get welcomeStart;

  /// No description provided for @welcomeHaveAccount.
  ///
  /// In tr, this message translates to:
  /// **'Zaten hesabım var'**
  String get welcomeHaveAccount;

  /// No description provided for @unitSaveFailed.
  ///
  /// In tr, this message translates to:
  /// **'Ünite bilgisi kaydedilemedi. Tekrar dene.'**
  String get unitSaveFailed;

  /// No description provided for @unitUnlockedLabel.
  ///
  /// In tr, this message translates to:
  /// **'ÜNİTE {number} AÇILDI'**
  String unitUnlockedLabel(int number);

  /// No description provided for @unitNewWordsWaiting.
  ///
  /// In tr, this message translates to:
  /// **'{count} yeni kelime seni bekliyor.'**
  String unitNewWordsWaiting(int count);

  /// No description provided for @unitLabel.
  ///
  /// In tr, this message translates to:
  /// **'ÜNİTE {number}'**
  String unitLabel(int number);

  /// No description provided for @unitWordsWaiting.
  ///
  /// In tr, this message translates to:
  /// **'{count} kelime seni bekliyor'**
  String unitWordsWaiting(int count);

  /// No description provided for @unitWordsConsolidated.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{total} kelime pekişti'**
  String unitWordsConsolidated(int done, int total);

  /// No description provided for @streakDayNumber.
  ///
  /// In tr, this message translates to:
  /// **'{days, plural, =0{0 Gün} other{{days}. Gün}}'**
  String streakDayNumber(int days);

  /// No description provided for @questDoneTitle.
  ///
  /// In tr, this message translates to:
  /// **'Görev tamamlandı!'**
  String get questDoneTitle;

  /// No description provided for @questRewardTickets.
  ///
  /// In tr, this message translates to:
  /// **'+{count} bilet'**
  String questRewardTickets(int count);

  /// No description provided for @pronunciationOff.
  ///
  /// In tr, this message translates to:
  /// **'Telaffuz kapalı'**
  String get pronunciationOff;

  /// No description provided for @navHome.
  ///
  /// In tr, this message translates to:
  /// **'Ana sayfa'**
  String get navHome;

  /// No description provided for @navLeagues.
  ///
  /// In tr, this message translates to:
  /// **'Ligler'**
  String get navLeagues;

  /// No description provided for @navQuests.
  ///
  /// In tr, this message translates to:
  /// **'Görevler'**
  String get navQuests;

  /// No description provided for @navPremium.
  ///
  /// In tr, this message translates to:
  /// **'Premium'**
  String get navPremium;

  /// No description provided for @navProfile.
  ///
  /// In tr, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// No description provided for @subscriptionOpenFailed.
  ///
  /// In tr, this message translates to:
  /// **'Abonelik sayfası açılamadı. Tekrar dene.'**
  String get subscriptionOpenFailed;

  /// No description provided for @networkTimeout.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı zaman aşımına uğradı. Daha sonra tekrar deneyin.'**
  String get networkTimeout;

  /// No description provided for @signedOut.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yapıldı. Tekrar görüşmek üzere!'**
  String get signedOut;

  /// No description provided for @accountDeleted.
  ///
  /// In tr, this message translates to:
  /// **'Hesabın silindi.'**
  String get accountDeleted;

  /// No description provided for @questsCompleted.
  ///
  /// In tr, this message translates to:
  /// **'TAMAMLANANLAR'**
  String get questsCompleted;

  /// No description provided for @authEnterDetails.
  ///
  /// In tr, this message translates to:
  /// **'Bilgilerini gir'**
  String get authEnterDetails;

  /// No description provided for @gameOpenFailed.
  ///
  /// In tr, this message translates to:
  /// **'Oyun açılamadı. Daha sonra tekrar dene.'**
  String get gameOpenFailed;

  /// No description provided for @loadingSpoken.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor'**
  String get loadingSpoken;

  /// No description provided for @weekdaysShort.
  ///
  /// In tr, this message translates to:
  /// **'Pzt Sal Çar Per Cum Cmt Paz'**
  String get weekdaysShort;

  /// No description provided for @monthNames.
  ///
  /// In tr, this message translates to:
  /// **'Ocak Şubat Mart Nisan Mayıs Haziran Temmuz Ağustos Eylül Ekim Kasım Aralık'**
  String get monthNames;

  /// No description provided for @questsClaimShort.
  ///
  /// In tr, this message translates to:
  /// **'AL'**
  String get questsClaimShort;

  /// No description provided for @profileFreezeUnit.
  ///
  /// In tr, this message translates to:
  /// **'koruma'**
  String profileFreezeUnit(int count);

  /// No description provided for @rankOrdinal.
  ///
  /// In tr, this message translates to:
  /// **'{rank}.'**
  String rankOrdinal(int rank);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sq', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sq':
      return AppLocalizationsSq();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
