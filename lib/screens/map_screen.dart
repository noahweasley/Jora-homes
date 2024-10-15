import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jora_homes/controllers/map_controller.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/assets.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/constants/time.dart';
import 'package:jora_homes/core/widgets/annotated_status_bar.dart';
import 'package:jora_homes/core/widgets/map_markers.dart';
import 'package:jora_homes/core/widgets/search_bar.dart';

class MapScreen extends GetView<MapController> {
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
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space2),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.space7),
                      child: AnimatedSearchBar(
                        duration: Time.animationDurationShort,
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
    return Align(
      alignment: const Alignment(0, 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: AppColor.circle2,
            borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(Dimensions.space1),
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ).animate().scale(duration: Time.animationDurationShort),
          Dimensions.space1.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: AppColor.circle2,
                borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
                child: InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.space1),
                    child: const Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ).animate().scale(duration: Time.animationDurationShort),
              Material(
                color: AppColor.circle2,
                borderRadius: BorderRadius.circular(Dimensions.borderRadiusLarge),
                child: InkWell(
                  onTap: () {},
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusLarge,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.space8),
                    child: Row(
                      children: [
                        Dimensions.space1.horizontalSpace,
                        const Icon(
                          Icons.sort,
                          color: Colors.white,
                        ),
                        Dimensions.space1.horizontalSpace,
                        Text(
                          Strings.variations,
                          style: AppStyle.body1.apply(color: Colors.white),
                        ),
                        Dimensions.space1.horizontalSpace,
                      ],
                    ),
                  ),
                ),
              ).animate().scale(duration: Time.animationDurationShort),
            ],
          ),
        ],
      ),
    );
  }
}
