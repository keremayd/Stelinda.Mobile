import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    show AppleLogoPainter;
import 'package:stelinda/ui/app_typography.dart';
import 'package:stelinda/ui/widgets/Buttons/depth_pressable_button.dart';

enum AuthSocialProvider { google, apple }

/// Apple ile giriş yalnız iOS'ta: Android'de Apple'ın web akışı ve ayrı
/// sunucu ayarı gerekiyor, App Store şartı da iOS için.
bool get appleSignInShown => defaultTargetPlatform == TargetPlatform.iOS;

/// Google Cloud'daki iOS OAuth istemcisinin kimliği (proje `stelinda`,
/// 24 Kas 2026). iOS'ta Google ile giriş bu kimlikle çalışır; Info.plist'te
/// tersine çevrilmiş hâli URL şeması olarak duruyor, sunucu da bu kimliği
/// `Google:ClientIds`'te kabul ediyor. Boşken iOS'ta Google düğmesi
/// gösterilmez: yarım kalmış bir giriş yolu App Store incelemesinde takılır.
const kGoogleIosClientId =
    '723796932192-6vcrbp536g3rd7innlpsfju7gb9fh60s.apps.googleusercontent.com';

bool get googleSignInShown =>
    defaultTargetPlatform != TargetPlatform.iOS || kGoogleIosClientId.isNotEmpty;

/// Ekranda gösterilen sosyal girişler, sırasıyla: Google üstte, Apple altta
/// (24 Kas 2026, kullanıcı). Apple'ın kılavuzu sıra koymuyor; düğmenin
/// öbürlerinden küçük olmamasını ve kaydırmadan görünmesini istiyor.
List<AuthSocialProvider> get shownSocialProviders => [
      if (googleSignInShown) AuthSocialProvider.google,
      if (appleSignInShown) AuthSocialProvider.apple,
    ];

/// Giriş ve kayıt ekranında iki sosyal düğme arası (yüz 96 + dudak 10 +
/// boşluk 24), tasarım birimi.
const double kSocialButtonStep = 130;

/// Düğme yazısı, tasarım birimi: "Giriş yap" düğmesinin yazısıyla (28) aynı
/// ağırlıkta. Apple'ın kılavuzu sistem düğmesinin oranını öneriyor (yazı
/// yüksekliğin %43'ü, burada 41); o boyda alternatif giriş birincil
/// düğmeden yüksek sesle konuşuyordu. Duolingo da o oranı kullanmıyor.
const double kSocialButtonFont = 30;

/// Google ve Apple ile giriş düğmesi: tam genişlik, logo ve yazı (24 Kas
/// 2026, kullanıcı: Duolingo'daki gibi yazılı). Önceden yalnız logo vardı;
/// Apple'ın kılavuzu yazılı düğmeye de izin veriyor.
///
/// Apple'ın özel düğme kuralları (Human Interface Guidelines, "Creating a
/// custom Sign in with Apple button"):
/// - yazı yalnız "Sign in / Sign up / Continue with Apple" karşılığı,
/// - logo ve yazı ikisi de beyaz (ya da ikisi de siyah); kenar çizgisi ve
///   gölge serbest,
/// - logo Apple'ın çizimi: paketin `AppleLogoPainter`'ı, çizimden
///   üretilmiş vektör,
/// - düğme öbür giriş düğmelerinden küçük olamaz: yükseklik "Giriş yap"
///   düğmesiyle aynı.
///
/// Zemin uygulamanın ikincil düğmesi ("Zaten hesabım var"): `0C2244` yüz,
/// `07182F` dudak; basınca yüz dudağa çöker (§2.4). Kılavuz özel düğmede
/// zeminin genel renginin siyah ya da beyaz kalmasını istiyor; kullanıcı
/// konseptin lacivertini seçti (24 Kas 2026; Duolingo da koyu gri zemin
/// kullanıyor). App Review özel düğmeleri ayrıca değerlendiriyor: ret
/// gelirse ilk bakılacak yer burası. Google düğmesi aynı malzemede.
class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({
    super.key,
    required this.provider,
    required this.label,
    required this.width,
    required this.height,
    required this.radius,
    required this.depth,
    required this.fontSize,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
  });

  final AuthSocialProvider provider;

  /// Düğmede yazan ve ekran okuyucunun okuduğu metin.
  final String label;
  final double width;

  /// Yüzün yüksekliği; dudak altına eklenir.
  final double height;
  final double radius;
  final double depth;
  final double fontSize;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isLoading;

  static const _face = Color(0xFF0C2244);
  static const _lip = Color(0xFF07182F);
  static const _ink = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final apple = provider == AuthSocialProvider.apple;
    final logoHeight = fontSize * 1.2;

    final Widget logo = isLoading
        ? SizedBox.square(
            dimension: logoHeight,
            child: const CircularProgressIndicator(
              strokeWidth: 2.5,
              color: _ink,
            ),
          )
        : apple
            // Paketteki oranlar: logo yazı boyunda, eni boyunun 25/31'i.
            ? SizedBox(
                width: logoHeight * 25 / 31,
                height: logoHeight,
                child: const CustomPaint(
                  painter: AppleLogoPainter(color: _ink),
                ),
              )
            : Image.asset(
                'assets/icons/google-logo.png',
                width: logoHeight,
                height: logoHeight,
                fit: BoxFit.contain,
              );

    return Semantics(
      label: label,
      button: true,
      excludeSemantics: true,
      child: DepthPressableButton(
        width: width,
        height: height,
        radius: radius,
        shadowOffset: depth,
        backgroundColor: _face,
        shadowColor: _lip,
        fontSize: 0,
        enabled: enabled,
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              logo,
              SizedBox(width: fontSize * 0.55),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _ink,
                    fontSize: fontSize,
                    fontWeight: AppTypography.action,
                    fontFamily: AppTypography.family,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
