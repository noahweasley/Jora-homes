import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jora_homes/controllers/main_controller.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/assets.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/widgets/annotated_status_bar.dart';
import 'package:jora_homes/core/widgets/circle_avatar.dart';
import 'package:jora_homes/core/widgets/map_markers.dart';
import 'package:jora_homes/core/widgets/search_bar.dart';

class MapScreen extends GetView<MainController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedStatusBar(
      color: Colors.black,
      brightness: Brightness.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                Assets.mapPlaceholder,
              ),
            ),
          ),
          child: Stack(
            children: [
              Obx(() {
                return MapMarkers(
                  quantity: controller.makerQty,
                  offsetList: controller.offsetList,
                  isClicked: controller.isDialogOpened,
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: AnimatedSearchBar(
                        duration: controller.duration,
                      ),
                    ),
                    BottomActions(
                      onTap: controller.showModal,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomActions extends StatelessWidget {
  final VoidCallback onTap;

  const BottomActions({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Align(
      alignment: const Alignment(0, 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            overlayColor: WidgetStateColor.resolveWith(
              (states) => Colors.transparent,
            ),
            child: const UniversalCircle(
              backgroundColor: Color.fromRGBO(116, 116, 116, 0.7),
              child: Center(
                child: Icon(
                  Icons.more_vert_rounded,
                  color: AppColor.tabBarIconColor,
                ),
              ),
            ).animate().scale(duration: duration),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UniversalCircle(
                backgroundColor: Color.fromRGBO(116, 116, 116, 0.7),
                child: Icon(
                  Icons.near_me_outlined,
                  color: AppColor.tabBarIconColor,
                ),
              ).animate().scale(duration: duration),
              UniversalCircle(
                backgroundColor: const Color.fromRGBO(116, 116, 116, 1),
                isRect: true,
                child: Row(
                  children: [
                    12.horizontalSpace,
                    const Icon(
                      Icons.sort,
                      color: Colors.white54,
                    ),
                    8.horizontalSpace,
                    Text(
                      'List of variations',
                      style: AppStyle.body1.apply(color: Colors.white),
                    ),
                    12.horizontalSpace,
                  ],
                ),
              ).animate().scale(duration: const Duration(milliseconds: 300)),
            ],
          ),
        ],
      ),
    );
  }
}
