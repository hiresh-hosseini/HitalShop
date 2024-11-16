import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPakage extends StatelessWidget {
  const LoadingPakage({
    super.key,
    required this.color,
    required this.size,
  });
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: size,
    );
  }
}
