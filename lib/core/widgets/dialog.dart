import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/time.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-.85.w, 0.3.h),
      child: Material(
        color: AppColor.dialogBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.space2.w,
            vertical: Dimensions.space1.h,
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DialogBoxText(
                text: 'Cosy areas',
                icon: Icons.verified_user_outlined,
              ),
              DialogBoxText(
                selected: true,
                text: 'Price',
                icon: Icons.wallet,
              ),
              DialogBoxText(
                text: 'Infrastructure',
                icon: Icons.store_mall_directory_outlined,
              ),
              DialogBoxText(
                text: 'Without any layer',
                icon: Icons.layers_outlined,
              ),
            ],
          ),
        ),
      ),
    ).animate().scale(
          alignment: const Alignment(-1, 1),
          duration: Time.animationDurationMin,
        );
  }
}

class DialogBoxText extends StatelessWidget {
  final String text;
  final bool selected;
  final IconData icon;

  const DialogBoxText({
    super.key,
    required this.text,
    this.selected = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.dialogBoxTextHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected ? AppColor.itemSelected : AppColor.itemUnSelected,
          ),
          Dimensions.space1.horizontalSpace,
          Text(text,
              style: AppStyle.button.apply(
                color: selected ? AppColor.itemSelected : AppColor.itemUnSelected,
              )),
        ],
      ),
    );
  }
}
