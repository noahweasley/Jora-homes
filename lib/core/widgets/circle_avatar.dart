import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCircleAvatar extends StatelessWidget {
  final Color? backgroundColor;
  final double? size;
  final Widget? child;
  final bool isRect;
  
  const MyCircleAvatar({
    super.key,
    this.backgroundColor,
    this.size,
    this.isRect = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: AnimatedContainer(
        duration: 0.6.seconds,
        width: isRect ? null : (size ?? 45).r,
        height: (size ?? 45).r,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: isRect ? BoxShape.rectangle : BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}