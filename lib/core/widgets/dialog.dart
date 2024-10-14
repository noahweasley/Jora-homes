import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-.85.w, 0.3.h),
      child: Material(
        color: const Color.fromRGBO(251, 245, 235, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
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
          duration: const Duration(milliseconds: 100),
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
      height: 42.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected ? const Color.fromRGBO(251, 171, 64, 1) : const Color.fromRGBO(140, 137, 132, 1),
          ),
          8.horizontalSpace,
          Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
              color: selected ? const Color.fromRGBO(251, 171, 64, 1) : const Color.fromRGBO(140, 137, 132, 1),
            ),
          ),
        ],
      ),
    );
  }
}
