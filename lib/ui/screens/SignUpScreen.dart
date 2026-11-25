import 'package:stelinda/l10n/l10n.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stelinda/models/Requests/SignUpRequest.dart';
import 'package:stelinda/ui/widgets/Buttons/app_icon_control_button.dart';
import 'package:stelinda/ui/widgets/Buttons/auth_back_button.dart';
import 'package:stelinda/ui/widgets/Buttons/auth_social_button.dart';
import 'package:stelinda/ui/widgets/Buttons/depth_pressable_button.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    show SignInWithAppleException;
import '../../services/AuthenticationService.dart';

class _RegistrationFailure {
  const _RegistrationFailure(this.message, {this.field});

  final String message;
  final String? field;
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _googleLoading = false;
  bool _appleLoading = false;
  bool _accountCreated = false;
  SignUpRequest? _submittedRequest;
  String? _formError;

  final Map<String, String?> _errors = {
    'firstName': null,
    'lastName': null,
    'email': null,
    'password': null,
  };

  // Renkler §2.2'ye çekildi — giriş ekranıyla aynı revizyon. Ekranın kendi
  // paleti vardı ve uygulamanın hiçbir yerinde karşılığı yoktu.
  static const _backgroundColor = Color(0xFF041227);
  static const _titleColor = Color(0xFFE9EEF5);
  static const _mutedColor = Color(0xFF8FA0B5);
  static const _accentColor = Color(0xFF1CB1F5);
  static const _inputFillColor = Color(0xFF0C2244);
  static const _inputBorderColor = Color(0xFF163258);
  static const _buttonColor = Color(0xFF98DE25);
  static const _buttonShadowColor = Color(0xFF6EA51C);
  static const _dividerColor = Color(0xFF0B2143);
  static const _warningColor = Color(0xFFFF4D5E);
  static const _warningBackgroundColor = Color(0xFF102948);

  bool get _isBusy => _isLoading || _googleLoading || _appleLoading;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateAll() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final newErrors = <String, String?>{
      'firstName':
          firstName.isEmpty ? context.l10n.authFirstNameRequired : null,
      'lastName': lastName.isEmpty ? context.l10n.authLastNameRequired : null,
      'email': RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)
          ? null
          : context.l10n.authInvalidEmail,
      'password': password.isEmpty
          ? context.l10n.authEnterPassword
          : password.length < 6 || !RegExp(r'\d').hasMatch(password)
              ? context.l10n.authPasswordRule
              : null,
    };

    setState(() {
      _errors
        ..clear()
        ..addAll(newErrors);
      _formError = null;
    });

    return newErrors.values.every((e) => e == null);
  }

  void _clearFieldError(String field) {
    if (_errors[field] == null && _formError == null) return;
    setState(() {
      _errors[field] = null;
      _formError = null;
    });
  }

  String? get _visibleErrorMessage {
    for (final key in ['firstName', 'lastName', 'email', 'password']) {
      final error = _errors[key];
      if (error != null) {
        return error;
      }
    }

    return _formError;
  }

  _RegistrationFailure _registrationFailure(Object error) {
    final l10n = context.l10n;
    if (error is DioError) {
      final body = error.response?.data;
      final errorList = body is Map ? body['errorList'] : null;
      final codes = errorList is Map ? errorList['errorCode'] : null;
      final identityCodes =
          codes is List ? codes.whereType<String>() : <String>[];

      if (identityCodes.contains('DuplicateEmail')) {
        return _RegistrationFailure(
          l10n.authDuplicateEmail,
          field: 'email',
        );
      }
      if (identityCodes.contains('DuplicateUserName')) {
        return _RegistrationFailure(
          l10n.authDuplicateName,
          field: 'firstName',
        );
      }
      if (identityCodes.any((code) => code.startsWith('Password'))) {
        return _RegistrationFailure(
          l10n.authPasswordRule,
          field: 'password',
        );
      }
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.other) {
        return _RegistrationFailure(l10n.authNoConnection);
      }
      if (error.response?.statusCode == 400) {
        return _RegistrationFailure(l10n.authCheckDetails);
      }
    }

    return _RegistrationFailure(l10n.authSignUpUnavailable);
  }

  Future<void> _signUp() async {
    if (_isBusy) return;
    if (!_accountCreated && !_validateAll()) return;

    final authService = Provider.of<AuthService>(context, listen: false);
    final request = _submittedRequest ??
        SignUpRequest(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

    setState(() {
      _isLoading = true;
      _formError = null;
    });

    try {
      if (!_accountCreated) {
        final response = await authService.signUp(request, context);
        if (!mounted) return;
        if (response.errorCode != null || response.data == null) {
          setState(() => _formError = context.l10n.authSignUpUnavailable);
          return;
        }
        setState(() {
          _accountCreated = true;
          _submittedRequest = request;
        });
      }

      final loginResponse =
          await authService.signIn(request.email, request.password, context);
      if (!mounted) return;
      if (loginResponse.errorCode == null && loginResponse.data != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() => _formError = context.l10n.authCreatedLoginFailed);
      }
    } catch (error) {
      if (!mounted) return;
      if (_accountCreated) {
        setState(() => _formError = context.l10n.authCreatedLoginFailed);
      } else {
        final failure = _registrationFailure(error);
        setState(() {
          _formError = failure.field == null ? failure.message : null;
          if (failure.field != null) _errors[failure.field!] = failure.message;
        });
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _continueWithGoogle() async {
    if (_isBusy || _accountCreated) return;
    final authService = Provider.of<AuthService>(context, listen: false);
    setState(() {
      _googleLoading = true;
      _errors.updateAll((key, value) => null);
      _formError = null;
    });

    try {
      final response = await authService.signInWithGoogle(context);
      if (!mounted) return;
      if (response.errorCode == null && response.data != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() => _formError = response.errorCode == 'İşlem iptal edildi!'
            ? context.l10n.authGoogleContinueCanceled
            : context.l10n.authGoogleContinueFailed);
      }
    } catch (error) {
      if (!mounted) return;
      final connectionError = error is DioError &&
          (error.type == DioErrorType.connectTimeout ||
              error.type == DioErrorType.sendTimeout ||
              error.type == DioErrorType.receiveTimeout ||
              error.type == DioErrorType.other);
      setState(() => _formError = connectionError
          ? context.l10n.authNoConnection
          : context.l10n.authGoogleContinueFailed);
    } finally {
      if (mounted) setState(() => _googleLoading = false);
    }
  }

  /// Apple ile devam: hesap yoksa sunucu açar, varsa giriş yapılır.
  Future<void> _continueWithApple() async {
    if (_isBusy || _accountCreated) return;
    final authService = Provider.of<AuthService>(context, listen: false);
    setState(() {
      _appleLoading = true;
      _errors.updateAll((key, value) => null);
      _formError = null;
    });

    try {
      final response = await authService.signInWithApple(context);
      if (!mounted) return;
      if (response.errorCode == null && response.data != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() => _formError = response.errorCode == 'İşlem iptal edildi!'
            ? context.l10n.authAppleContinueCanceled
            : context.l10n.authAppleContinueFailed);
      }
    } catch (error) {
      if (!mounted) return;
      final connectionError = error is! SignInWithAppleException &&
          error is DioError &&
          (error.type == DioErrorType.connectTimeout ||
              error.type == DioErrorType.sendTimeout ||
              error.type == DioErrorType.receiveTimeout ||
              error.type == DioErrorType.other);
      setState(() => _formError = connectionError
          ? context.l10n.authNoConnection
          : context.l10n.authAppleContinueFailed);
    } finally {
      if (mounted) setState(() => _appleLoading = false);
    }
  }

  Widget _dividerLine(double scale) => Container(
        height: 5 * scale,
        decoration: BoxDecoration(
          color: _dividerColor,
          borderRadius: BorderRadius.circular(4 * scale),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / 750;
          final canvasHeight = 1624 * scale;
          final height = canvasHeight > constraints.maxHeight
              ? canvasHeight
              : constraints.maxHeight;
          final errorMessage = _visibleErrorMessage;
          final errorOffset = errorMessage == null ? 0.0 : 82 * scale;

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: height,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 140 * scale,
                      child: _SignUpHeader(
                        scale: scale,
                        titleColor: _titleColor,
                        onBack: () => Navigator.pop(context),
                      ),
                    ),
                    Positioned(
                      left: 32 * scale,
                      top: 300 * scale,
                      child: _SignUpInput(
                        controller: _firstNameController,
                        hint: context.l10n.authFirstNameHint,
                        width: 335 * scale,
                        height: 112 * scale,
                        radius: 26 * scale,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26 * scale),
                          bottomLeft: Radius.circular(26 * scale),
                          topRight: Radius.circular(8 * scale),
                          bottomRight: Radius.circular(8 * scale),
                        ),
                        borderWidth: 3.5 * scale,
                        fontSize: 30 * scale,
                        hasError: _errors['firstName'] != null,
                        keyboardType: TextInputType.name,
                        readOnly: _isBusy || _accountCreated,
                        onChanged: (_) => _clearFieldError('firstName'),
                      ),
                    ),
                    Positioned(
                      left: 382 * scale,
                      top: 300 * scale,
                      child: _SignUpInput(
                        controller: _lastNameController,
                        hint: context.l10n.authLastNameHint,
                        width: 336 * scale,
                        height: 112 * scale,
                        radius: 26 * scale,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8 * scale),
                          bottomLeft: Radius.circular(8 * scale),
                          topRight: Radius.circular(26 * scale),
                          bottomRight: Radius.circular(26 * scale),
                        ),
                        borderWidth: 3.5 * scale,
                        fontSize: 30 * scale,
                        hasError: _errors['lastName'] != null,
                        keyboardType: TextInputType.name,
                        readOnly: _isBusy || _accountCreated,
                        onChanged: (_) => _clearFieldError('lastName'),
                      ),
                    ),
                    Positioned(
                      left: 32 * scale,
                      top: 430 * scale,
                      child: _SignUpInput(
                        controller: _emailController,
                        hint: context.l10n.authEmailHint,
                        width: 686 * scale,
                        height: 112 * scale,
                        radius: 26 * scale,
                        borderWidth: 3.5 * scale,
                        fontSize: 30 * scale,
                        hasError: _errors['email'] != null,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: _isBusy || _accountCreated,
                        onChanged: (_) => _clearFieldError('email'),
                      ),
                    ),
                    Positioned(
                      left: 32 * scale,
                      top: 560 * scale,
                      child: _SignUpInput(
                        controller: _passwordController,
                        hint: context.l10n.authPasswordHint,
                        width: 686 * scale,
                        height: 112 * scale,
                        radius: 26 * scale,
                        borderWidth: 3.5 * scale,
                        fontSize: 30 * scale,
                        hasError: _errors['password'] != null,
                        obscureText: true,
                        readOnly: _isBusy || _accountCreated,
                        onChanged: (_) => _clearFieldError('password'),
                      ),
                    ),
                    if (errorMessage != null)
                      Positioned(
                        left: 40 * scale,
                        top: 686 * scale,
                        child: Semantics(
                          liveRegion: true,
                          child: _FormWarning(
                            message: errorMessage,
                            width: 670 * scale,
                            height: 58 * scale,
                            radius: 20 * scale,
                            fontSize: 22 * scale,
                          ),
                        ),
                      ),
                    Positioned(
                      left: 32 * scale,
                      top: 706 * scale + errorOffset,
                      child: _PrimarySignUpButton(
                        width: 686 * scale,
                        height: 96 * scale,
                        radius: 26 * scale,
                        shadowOffset: 10 * scale,
                        fontSize: 28 * scale,
                        enabled: !_isBusy,
                        isLoading: _isLoading,
                        text: _accountCreated
                            ? context.l10n.authSignIn
                            : context.l10n.authSignUp,
                        onPressed: _signUp,
                      ),
                    ),
                    // Çıplak çizgi neyi ayırdığını söylemiyordu; "veya"
                    // gelince alttaki sosyal girişler alternatif olarak
                    // okunuyor.
                    Positioned(
                      left: 106 * scale,
                      top: 940 * scale + errorOffset,
                      child: SizedBox(
                        width: 508 * scale,
                        child: Row(
                          children: [
                            Expanded(child: _dividerLine(scale)),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 24 * scale),
                              child: Text(
                                context.l10n.authOr,
                                style: TextStyle(
                                  color: _mutedColor,
                                  fontSize: 26 * scale,
                                  fontWeight: AppTypography.caption,
                                  fontFamily: AppTypography.family,
                                ),
                              ),
                            ),
                            Expanded(child: _dividerLine(scale)),
                          ],
                        ),
                      ),
                    ),
                    // Sosyal girişler tam genişlik, birincil düğmeyle aynı
                    // boyda ve alt alta (24 Kas 2026).
                    for (final (i, provider) in shownSocialProviders.indexed)
                      Positioned(
                        left: 32 * scale,
                        top: (1030 + i * kSocialButtonStep) * scale +
                            errorOffset,
                        child: AuthSocialButton(
                          provider: provider,
                          label: provider == AuthSocialProvider.apple
                              ? context.l10n.authContinueApple
                              : context.l10n.authContinueGoogle,
                          width: 686 * scale,
                          height: 96 * scale,
                          radius: 26 * scale,
                          depth: 10 * scale,
                          fontSize: kSocialButtonFont * scale,
                          enabled: !_isBusy && !_accountCreated,
                          isLoading: provider == AuthSocialProvider.apple
                              ? _appleLoading
                              : _googleLoading,
                          onPressed: provider == AuthSocialProvider.apple
                              ? _continueWithApple
                              : _continueWithGoogle,
                        ),
                      ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 1460 * scale,
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: context.l10n.authHaveAccount,
                          style: TextStyle(
                            fontSize: 30 * scale,
                            fontWeight: AppTypography.body,
                            color: _mutedColor,
                            fontFamily: AppTypography.family,
                          ),
                          children: [
                            TextSpan(
                              // Altı çizili gri yerine accent mavi: cümlenin
                              // tıklanabilir kısmı renkle ayrılıyor, "Parolamı
                              // unuttum" ile aynı dil.
                              text: context.l10n.authSignIn,
                              style: TextStyle(
                                fontSize: 30 * scale,
                                fontWeight: AppTypography.action,
                                color: _accentColor,
                                fontFamily: AppTypography.family,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, "/signin");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SignUpInput extends StatelessWidget {
  const _SignUpInput({
    required this.controller,
    required this.hint,
    required this.width,
    required this.height,
    required this.radius,
    required this.borderWidth,
    required this.fontSize,
    required this.onChanged,
    this.borderRadius,
    this.hasError = false,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String hint;
  final double width;
  final double height;
  final double radius;
  final double borderWidth;
  final double fontSize;
  final BorderRadius? borderRadius;
  final bool hasError;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final scale = height / 145;

    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: _SignUpScreenState._inputFillColor,
              borderRadius: borderRadius ?? BorderRadius.circular(radius),
              border: Border.all(
                color: hasError
                    ? _SignUpScreenState._warningColor
                    : _SignUpScreenState._inputBorderColor,
                width: borderWidth,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 56 * scale),
            alignment: Alignment.centerLeft,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              readOnly: readOnly,
              onChanged: onChanged,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: AppTypography.body,
                fontFamily: AppTypography.family,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                hintText: hint,
                // Beyazdı — yani ipucu ile girilen değer aynı renkteydi ve
                // kutunun dolu mu boş mu olduğu anlaşılmıyordu.
                hintStyle: TextStyle(
                  color: _SignUpScreenState._mutedColor,
                  fontSize: fontSize,
                  fontWeight: AppTypography.body,
                  fontFamily: AppTypography.family,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormWarning extends StatelessWidget {
  const _FormWarning({
    required this.message,
    required this.width,
    required this.height,
    required this.radius,
    required this.fontSize,
  });

  final String message;
  final double width;
  final double height;
  final double radius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final scale = height / 58;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 22 * scale),
      decoration: BoxDecoration(
        color: _SignUpScreenState._warningBackgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: _SignUpScreenState._warningColor,
          width: 3 * scale,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24 * scale,
            height: 24 * scale,
            decoration: const BoxDecoration(
              color: _SignUpScreenState._warningColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '!',
              style: TextStyle(
                color: _SignUpScreenState._backgroundColor,
                fontSize: 17 * scale,
                fontWeight: AppTypography.label,
                fontFamily: AppTypography.family,
              ),
            ),
          ),
          SizedBox(width: 14 * scale),
          Expanded(
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: _SignUpScreenState._warningColor,
                fontSize: fontSize,
                fontWeight: AppTypography.caption,
                fontFamily: AppTypography.family,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpHeader extends StatelessWidget {
  const _SignUpHeader({
    required this.scale,
    required this.titleColor,
    required this.onBack,
  });

  final double scale;
  final Color titleColor;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppIconControlButton.outerHeightForScale(scale),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20 * scale,
            child: AuthBackButton(
              scale: scale,
              onPressed: onBack,
            ),
          ),
          Text(
            context.l10n.authCreateProfile,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: titleColor,
              fontSize: 45 * scale,
              fontWeight: AppTypography.heading,
              fontFamily: AppTypography.displayFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimarySignUpButton extends StatelessWidget {
  const _PrimarySignUpButton({
    required this.width,
    required this.height,
    required this.radius,
    required this.shadowOffset,
    required this.fontSize,
    required this.onPressed,
    required this.enabled,
    required this.isLoading,
    required this.text,
  });

  final double width;
  final double height;
  final double radius;
  final double shadowOffset;
  final double fontSize;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DepthPressableButton(
      width: width,
      height: height,
      radius: radius,
      shadowOffset: shadowOffset,
      backgroundColor: _SignUpScreenState._buttonColor,
      shadowColor: _SignUpScreenState._buttonShadowColor,
      fontSize: fontSize,
      enabled: enabled,
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: fontSize * 1.1,
              height: fontSize * 1.1,
              child: const CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: AppTypography.action,
                fontFamily: AppTypography.family,
              ),
            ),
    );
  }
}
