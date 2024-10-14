import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jora_homes/core/constants/colors.dart';

class AnnotatedStatusBar extends StatelessWidget {
  final Widget child;
  final Color? color;

  const AnnotatedStatusBar({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color ?? AppColor.systemOverlayColor,
        statusBarBrightness: Brightness.dark, // For iOS
        statusBarIconBrightness: Brightness.dark, // For Android
        systemNavigationBarColor: color ??  AppColor.systemOverlayColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: child,
    );
  }
}
