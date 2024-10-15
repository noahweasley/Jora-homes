import 'package:flutter/material.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/constants/dimensions.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final double? width;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final bool hasBorder;
  final Color borderColor;
  final double? fontSize;
  final Widget? child;
  final Widget? icon;
  final bool enabled;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.height,
    this.width,
    this.child,
    this.borderColor = AppColor.primary,
    this.buttonColor = AppColor.primary,
    this.textColor = Colors.white,
    this.enabled = true,
    this.fontSize = 17,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? Dimensions.buttonSize,
      child: Material(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          side: hasBorder ? BorderSide(color: borderColor) : BorderSide.none,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(Dimensions.borderRadius3),
            bottomLeft: Radius.circular(Dimensions.borderRadius3),
            bottomRight: Radius.circular(Dimensions.borderRadius3),
          ),
        ),
        child: InkWell(
          onTap: enabled ? onTap : null,
          customBorder: RoundedRectangleBorder(
            side: hasBorder ? BorderSide(color: borderColor) : BorderSide.none,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(Dimensions.borderRadius3),
              bottomLeft: Radius.circular(Dimensions.borderRadius3),
              bottomRight: Radius.circular(Dimensions.borderRadius3),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppStyle.button.apply(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
