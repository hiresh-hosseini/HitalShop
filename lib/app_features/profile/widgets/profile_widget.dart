import 'package:flutter/material.dart';
import 'package:shop/app_core/pakages/iconsax_pakage.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 14),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff14489e).withOpacity(0.15),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 26,
          ),
          const SizedBox(width: 14),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          IconsaxPakage(
            icon: IconsaxPakage.arrowLeft2,
            iconSize: 26,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
