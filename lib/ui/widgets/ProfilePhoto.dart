import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stelinda/l10n/l10n.dart';
import 'package:stelinda/ui/app_typography.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stelinda/Utils/AppNotifier.dart';
import 'package:stelinda/services/FileService.dart';
import 'package:stelinda/ui/widgets/Buttons/depth_pressable_button.dart';
import 'package:provider/provider.dart';

import '../../models/User.dart';
import '../../providers/UserProvider.dart';
import '../../services/UserService.dart';

/// Kullanıcının fotoğrafı; yoksa baş harfleri. Düzenlenebilirse (profil
/// kartı) köşesinde kamera düğmesi var, fotoğrafın kendisine dokunmak da
/// galeriyi açar.
class ProfilePhotoWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool? editable;

  const ProfilePhotoWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.editable,
  });

  @override
  _ProfilePhotoWidgetState createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  late UserService _userService;
  late LocalFileService _localFileService;
  bool _uploading = false;

  bool get _editable => widget.editable ?? true;

  @override
  void initState() {
    super.initState();

    _userService = Provider.of<UserService>(context, listen: false);
    _localFileService = Provider.of<LocalFileService>(context, listen: false);
  }

  Future<void> _pickImageAndUpload() async {
    if (_uploading) return;
    final l10n = context.l10n;
    final XFile? picked;
    try {
      // Konum gibi üst veriler gerekmiyor; iOS fotoğraf erişimi izni sormaz,
      // seçici yalnız seçilen fotoğrafı verir. Sunucu en çok 5 MB alıyor:
      // fotoğraf yüklenmeden önce küçültülür.
      picked = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
    } catch (_) {
      AppNotifier.showMessage(l10n.profilePhotoFailed);
      return;
    }
    if (picked == null || !mounted) return;

    final userId = context.read<UserProvider>().user?.userId;
    setState(() => _uploading = true);
    try {
      final response =
          await _userService.updateProfilePhotoById(File(picked.path));
      final data = response.data;
      if (response.errorCode != null || data == null || userId == null) {
        AppNotifier.showMessage(l10n.profilePhotoFailed);
        return;
      }
      if (!mounted) return;
      await _localFileService.updateCachedProfilePhoto(
        data.signedUrl,
        userId,
        context,
      );
      AppNotifier.showMessage(
        l10n.profilePhotoUpdated,
        color: const Color(0xFF93D334),
      );
    } catch (_) {
      AppNotifier.showMessage(l10n.profilePhotoFailed);
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final photoWidth = widget.width ?? 70;
    final photoHeight = widget.height ?? 70;
    // Köşedeki düğme uygulamanın basılabilir düğmesi: alt katmana çöker.
    final badge = (photoWidth * 0.36).clamp(30.0, 44.0).toDouble();
    final depth = badge * 0.14;

    final photo = Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final photoPath = userProvider.user?.profilePhotoUrl;

        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
          // Fotoğraf yoksa ligdeki satırlar gibi baş harfler: eski
          // varsayılan görsel (bir memoji) kullanıcıyı temsil etmiyordu
          // (kullanıcı, 23 Kas 2026).
          child: photoPath == null || photoPath.isEmpty
              ? _Initials(
                  user: userProvider.user,
                  width: photoWidth,
                  height: photoHeight,
                )
              : Image.file(
                  File(photoPath),
                  width: photoWidth,
                  height: photoHeight,
                  fit: BoxFit.cover,
                  key: ValueKey('$photoPath#${userProvider.photoVersion}'),
                ),
        );
      },
    );

    if (!_editable) return photo;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(onTap: _pickImageAndUpload, child: photo),
        Positioned(
          right: -badge * 0.22,
          bottom: -badge * 0.22,
          child: Semantics(
            label: context.l10n.profilePhotoChange,
            button: true,
            child: DepthPressableButton(
              width: badge,
              height: badge - depth,
              radius: badge * 0.3,
              shadowOffset: depth,
              backgroundColor: const Color(0xFF1CB1F5),
              shadowColor: const Color(0xFF1B84B5),
              fontSize: badge * 0.4,
              enabled: !_uploading,
              onPressed: _pickImageAndUpload,
              child: _uploading
                  ? SizedBox(
                      width: badge * 0.42,
                      height: badge * 0.42,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      Icons.photo_camera_rounded,
                      size: badge * 0.52,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Fotoğrafı olmayan kullanıcının baş harfleri: ligdeki satırların
/// (`_RowAvatar`) renkleri ve oranı.
class _Initials extends StatelessWidget {
  const _Initials({
    required this.user,
    required this.width,
    required this.height,
  });

  final User? user;
  final double width;
  final double height;

  String get _letters {
    final full = [user?.firstName, user?.lastName]
        .whereType<String>()
        .where((part) => part.trim().isNotEmpty)
        .join(' ');
    final name = full.isNotEmpty
        ? full
        : (user?.displayName?.trim().isNotEmpty ?? false)
            ? user!.displayName!
            : (user?.userName ?? '');
    final parts =
        name.split(' ').where((part) => part.isNotEmpty).take(2).toList();
    if (parts.isEmpty) return '?';
    return parts.map((part) => part[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFE3EAF1),
      alignment: Alignment.center,
      child: Text(
        _letters,
        style: TextStyle(
          color: const Color(0xFF35424E),
          fontSize: width / 3,
          fontWeight: AppTypography.label,
          fontFamily: AppTypography.family,
        ),
      ),
    );
  }
}
