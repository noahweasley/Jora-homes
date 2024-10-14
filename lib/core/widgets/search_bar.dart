import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/widgets/circle_avatar.dart';

class AnimatedSearchBar extends StatelessWidget {
  final Duration duration;

  const AnimatedSearchBar({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 12.h,
            ),
            decoration: ShapeDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                ),
                10.horizontalSpace,
                const Text('Saint Petersburg')
              ],
            ),
          ).animate().scale(duration: duration),
        ),
        8.horizontalSpace,
        UniversalCircle(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.tune,
            size: 18.sp,
          ),
        ).animate().scale(duration: duration),
      ],
    );
  }
}
