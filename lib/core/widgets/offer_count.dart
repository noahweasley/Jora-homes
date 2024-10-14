import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/app_style.dart';

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
  late int number;
  late AnimationController _animationController;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    number = Random().nextInt(9999);
    _animationController = AnimationController(
      vsync: this,
      duration: 1.5.seconds,
      reverseDuration: 1.5.seconds,
    )..addListener(() {
        setState(() {});
      });
    _animation = IntTween(begin: 1, end: number).animate(_animationController);
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
        borderRadius: widget.shape == BoxShape.rectangle ? BorderRadius.circular(20.r) : null,
        color: widget.backgroundColor,
      ),
      child: Column(
        children: [
          20.verticalSpace,
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
                    final number = _animation.value;
                    return Text(
                      number.toString(),
                      style: AppStyle.headline4.bold.apply(color: widget.textColor),
                    );
                  },
                ),
                Text(
                  'offers',
                  style: AppStyle.title.apply(
                    color: widget.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().scale(duration: 0.5.seconds);
  }
}
