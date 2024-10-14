import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/widgets/circle_avatar.dart';

class CustomTabBar extends StatefulWidget {
  final void Function(int) onChanged;
  final int currentIndex;

  const CustomTabBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: ShapeDecoration(
        color: AppColor.tabBarBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomBarIcon(
            icon: Icons.search,
            index: 0,
            currentIndex: currentIndex,
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              widget.onChanged(index);
            },
          ),
          const SizedBox(width: 8),
          BottomBarIcon(
            icon: Icons.chat,
            index: 1,
            currentIndex: currentIndex,
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              widget.onChanged(index);
            },
          ),
          const SizedBox(width: 8),
          BottomBarIcon(
            icon: Icons.home_filled,
            index: 2,
            currentIndex: currentIndex,
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              widget.onChanged(index);
            },
          ),
          const SizedBox(width: 8),
          BottomBarIcon(
            icon: Icons.favorite,
            index: 3,
            currentIndex: currentIndex,
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              widget.onChanged(index);
            },
          ),
          SizedBox(width: 8.horizontalSpace.width),
          BottomBarIcon(
            icon: Icons.person,
            index: 4,
            currentIndex: currentIndex,
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              widget.onChanged(index);
            },
          ),
        ],
      ),
    ).animate().moveY(
          begin: 100,
          delay: 0.5.seconds,
          duration: 0.7.seconds,
        );
  }
}

class BottomBarIcon extends StatelessWidget {
  final int index;
  final int currentIndex;
  final void Function(int) onChanged;
  final IconData icon;

  const BottomBarIcon({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onChanged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(index),
      child: UniversalCircle(
        backgroundColor: currentIndex == index ? AppColor.primary : AppColor.tabBarSelectedBackground,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
