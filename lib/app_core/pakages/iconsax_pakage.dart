import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class IconsaxPakage extends StatelessWidget {
  const IconsaxPakage(
      {super.key, required this.icon, required this.iconSize, this.color});
  final IconData icon;
  final double iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: iconSize,
      color: color,
    );
  }

  static IconData get eye => Iconsax.eye;
  static IconData get eyeSlash => Iconsax.eye_slash;
  static IconData get add => Iconsax.add;
  static IconData get searchNormal => Iconsax.search_normal;
  static IconData get bag_2 => Iconsax.bag_2;
  static IconData get element_3 => Iconsax.element_3;
  static IconData get shoppingCart => Iconsax.shopping_cart;
  static IconData get heart => Iconsax.heart;
  static IconData get user => Iconsax.user;
  static IconData get home_2 => Iconsax.home_2;
  static IconData get arrowLeft2 => Iconsax.arrow_left_2;
  static IconData get searchNormal_1 => Iconsax.search_normal_1;
  static IconData get sort => Iconsax.sort;
  static IconData get arrowLeft_24 => Iconsax.arrow_left_24;
  static IconData get messageText_1 => Iconsax.message_text_1;
  static IconData get trash => Iconsax.trash;
  static IconData get minus => Iconsax.minus;
  static IconData get start1 => Iconsax.star1;
  static IconData get arrowLeft => Iconsax.arrow_left;
  static IconData get map => Iconsax.map;
  static IconData get truckFast => Iconsax.truck_fast;
}
