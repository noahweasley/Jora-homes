import 'dart:math' as math;

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/constants/time.dart';

class GridItem extends StatelessWidget {
  final String image;

  const GridItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
      child: SizedBox(
        height: Dimensions.gridItemHeight,
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
                padding: EdgeInsets.all(Dimensions.space1.r),
                child: BlurryContainer(
                  blur: 55,
                  height: Dimensions.slideBarHeight,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          Strings.gridText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.body2.apply(color: Colors.black),
                        ),
                      ),
                      Material(
                        color: AppColor.tabBarIconColor,
                        borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
                        child: InkWell(
                          onTap: () {},
                          customBorder: const CircleBorder(),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: Dimensions.iconSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().scaleX(
                    begin: -1,
                    delay: math.Random().nextInt(3).seconds,
                    duration: Time.animationDurationLong,
                    alignment: Alignment.centerLeft,
                    curve: Curves.easeIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}
