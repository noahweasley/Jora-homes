import 'package:flutter/material.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/time.dart';

class UniversalCircle extends StatelessWidget {
  final Color? backgroundColor;
  final double? size;
  final Widget? child;
  final bool isRect;

  const UniversalCircle({
    super.key,
    this.backgroundColor,
    this.size,
    this.isRect = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
      child: AnimatedContainer(
        duration: Time.animationDuration1,
        width: isRect ? null : (size ?? Dimensions.iconSize2),
        height: (size ?? Dimensions.iconSize2),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: isRect ? BoxShape.rectangle : BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
