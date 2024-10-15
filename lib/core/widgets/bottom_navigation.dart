import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/time.dart';

class BottomNavigation extends StatefulWidget {
  final List<Widget> children;

  const BottomNavigation({super.key, required this.children});

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<StatefulWidget> {
  late final ValueNotifier<int> index;

  @override
  void initState() {
    super.initState();
    index = ValueNotifier(2);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, index, _) {
        return Stack(
          children: [
            IndexedStack(
              index: index,
              children: (widget as BottomNavigation).children,
            ),
            Align(
              alignment: const Alignment(0, 0.93),
              child: CustomTabBar(
                currentIndex: index,
                onChanged: (value) => this.index.value = value,
              ),
            )
          ],
        );
      },
    );
  }
}

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
      padding: EdgeInsets.all(Dimensions.space1),
      decoration: ShapeDecoration(
        color: AppColor.tabBarBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
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
          Dimensions.space1.horizontalSpace,
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
          Dimensions.space1.horizontalSpace,
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
          Dimensions.space1.horizontalSpace,
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
          Dimensions.space1.horizontalSpace,
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
          delay: Time.animationDelayMid,
          duration: Time.animationDuration2,
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
    return BottomNavIconContainer(
      onTap: () => onChanged(index),
      backgroundColor: currentIndex == index ? AppColor.primary : AppColor.tabBarSelectedBackground,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class BottomNavIconContainer extends StatelessWidget {
  final Color? backgroundColor;
  final double? size;
  final Widget? child;
  final VoidCallback onTap;

  const BottomNavIconContainer({
    super.key,
    this.backgroundColor,
    this.size,
    this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
        child: AnimatedContainer(
          duration: Time.animationDuration1,
          width: size ?? Dimensions.iconSize2,
          height: size ?? Dimensions.iconSize2,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape:  BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}
