import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapMarkers extends StatelessWidget {
  final bool isClicked;
  final int quantity;
  final List<Offset> offsetList;

  const MapMarkers({
    super.key,
    required this.isClicked,
    required this.quantity,
    required this.offsetList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        quantity,
        (i) => Positioned(
          left: offsetList[i].dx,
          top: offsetList[i].dy,
          child: AnimatedContainer(
            duration: 0.7.seconds,
            width: isClicked ? 90.w : 45.w,
            height: 45.w,
            padding: EdgeInsets.all(10.r),
            decoration: ShapeDecoration(
              color: const Color.fromRGBO(252, 157, 17, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
            ),
            child: isClicked
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${Random().nextInt(300)} mn P',
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.apartment,
                    color: Colors.white,
                  ),
          ).animate().scale(
                delay: 0.4.seconds,
                duration: 0.5.seconds,
              ),
        ),
      ),
    );
  }
}
