import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IconsaxPakage extends StatelessWidget {
  const IconsaxPakage({super.key, required this.icon, required this.iconSize});
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: iconSize,
    );
  }

  static IconData get eye => Iconsax.eye;
  static IconData get eyeSlash => Iconsax.eye_slash;
  static IconData get add => Iconsax.add;
}
