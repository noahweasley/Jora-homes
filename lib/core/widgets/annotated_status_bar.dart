import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jora_homes/core/constants/colors.dart';

class AnnotatedStatusBar extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Brightness? brightness;

  const AnnotatedStatusBar({
    super.key,
    required this.child,
    this.color,
    this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color ?? AppColor.systemOverlayColor,
        statusBarBrightness: brightness ?? Brightness.dark, // For iOS
        statusBarIconBrightness: brightness ?? Brightness.dark, // For Android
        systemNavigationBarColor: color ?? AppColor.systemOverlayColor,
        systemNavigationBarIconBrightness: brightness ?? Brightness.dark,
      ),
      child: child,
    );
  }
}
