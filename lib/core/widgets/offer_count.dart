import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/constants/time.dart';

class OfferCount extends StatefulWidget {
  final double height;
  final BoxShape shape;
  final String text;
  final Color backgroundColor;

  final Color textColor;

  const OfferCount({
    super.key,
    required this.height,
    required this.shape,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
  });

  @override
  State<OfferCount> createState() => _OfferCountState();
}

class _OfferCountState extends State<OfferCount> with SingleTickerProviderStateMixin {
  late int rand;
  late AnimationController _animationController;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    rand = Random().nextInt(9999);
    _animationController = AnimationController(
      vsync: this,
      duration: Time.animationDurationLonger,
      reverseDuration: Time.animationDurationLonger,
    )..addListener(() {
        setState(() {});
      });
    _animation = IntTween(begin: 1, end: rand).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        shape: widget.shape,
        borderRadius: widget.shape == BoxShape.rectangle ? BorderRadius.circular(Dimensions.borderRadius5) : null,
        color: widget.backgroundColor,
      ),
      child: Column(
        children: [
          Dimensions.space2.verticalSpace,
          Expanded(
            flex: 1,
            child: Text(
              widget.text,
              style: AppStyle.title.apply(color: widget.textColor),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    return Text(
                      _animation.value.toString(),
                      style: AppStyle.headline4.bold.apply(color: widget.textColor),
                    );
                  },
                ),
                Text(
                  Strings.offers,
                  style: AppStyle.title.apply(
                    color: widget.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().scale(duration: Time.animationDuration0);
  }
}
