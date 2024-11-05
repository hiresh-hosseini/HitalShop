import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImagePakage extends StatelessWidget {
  const CachedNetworkImagePakage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
  });

  final double? height;
  final double? width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
    );
  }
}
