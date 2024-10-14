import 'dart:math' as math;

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/widgets/circle_avatar.dart';

class GridItem extends StatelessWidget {
  final String image;

  const GridItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: SizedBox(
        height: 200.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                fit: BoxFit.cover,
                image,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: BlurryContainer(
                  blur: 55,
                  height: 40.r,
                  width: double.maxFinite,
                  child: LayoutBuilder(
                    builder: (context, _) {
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              '25 Gladkova Street Yorshire, New York, London',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppStyle.body2.apply(color: Colors.black),
                            ),
                          ),
                          UniversalCircle(
                            size: 40.r,
                            backgroundColor: AppColor.tabBarIconColor,
                            child: const Icon(
                              Icons.chevron_right_outlined,
                              size: 15,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ).animate().scaleX(
                      delay: math.Random().nextInt(3).seconds,
                      duration: 0.9.seconds,
                      begin: -1,
                      alignment: Alignment.centerLeft,
                      curve: Curves.easeIn
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
