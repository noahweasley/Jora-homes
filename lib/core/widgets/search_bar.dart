import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/widgets/universal_circle.dart';

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
              horizontal: Dimensions.space2.w,
              vertical: Dimensions.space1.h,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.borderRadius6),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                ),
                Dimensions.space1.horizontalSpace,
                const Text('Saint Petersburg')
              ],
            ),
          ).animate().scale(duration: duration),
        ),
        Dimensions.space1.horizontalSpace,
        // TODO: Replace with icon
        UniversalCircle(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.tune,
            size: Dimensions.iconSize3,
          ),
        ).animate().scale(duration: duration),
      ],
    );
  }
}
