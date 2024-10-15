import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jora_homes/controllers/main_controller.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/assets.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/constants/time.dart';
import 'package:jora_homes/core/widgets/grid_item.dart';
import 'package:jora_homes/core/widgets/offer_count.dart';
import 'package:jora_homes/core/widgets/universal_circle.dart';

class LandingPageScreen extends GetView<MainController> {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColor.gradient,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: Dimensions.space6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.space2.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimensions.borderRadius1),
                            ),
                          ),
                          padding: EdgeInsets.all(Dimensions.space1.r),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColor.text1,
                                  size: Dimensions.iconSize1.sp,
                                ),
                                Dimensions.minSpace.horizontalSpace,
                                Text(
                                  Strings.userLocation,
                                  style: AppStyle.title.apply(color: AppColor.text1),
                                )
                              ],
                            ),
                          ),
                        ).animate().slideX(begin: -1),
                        // TODO: Remove
                        UniversalCircle(
                          backgroundColor: AppColor.primary,
                          child: Image.asset(
                            Assets.profile,
                            fit: BoxFit.scaleDown,
                          ),
                        ).animate().scale()
                      ],
                    ),
                    Dimensions.space2.verticalSpace,
                    Text(
                      Strings.greeting,
                      style: AppStyle.body1.apply(color: AppColor.text1),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (7 / 10),
                      child: Text(
                        Strings.selectDate,
                        style: AppStyle.headline4.apply(color: AppColor.text4),
                      ),
                    ).animate().slideY(begin: 0.5),
                    Dimensions.space4.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: LayoutBuilder(builder: (context, constraints) {
                            return OfferCount(
                              text: Strings.buy,
                              shape: BoxShape.circle,
                              height: constraints.maxWidth,
                              backgroundColor: AppColor.primary,
                              textColor: AppColor.text5,
                            );
                          }),
                        ),
                        Dimensions.space1.horizontalSpace,
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return OfferCount(
                                textColor: AppColor.text1,
                                text: Strings.rent,
                                shape: BoxShape.rectangle,
                                height: constraints.maxWidth,
                                backgroundColor: AppColor.background2,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Dimensions.space4.verticalSpace,
              Container(
                padding: EdgeInsets.all(Dimensions.space1.r),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w + 8.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: const [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: GridItem(image: Assets.room),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: GridItem(image: Assets.kitchen),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: GridItem(image: Assets.kitchen2),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: GridItem(image: Assets.room),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: GridItem(image: Assets.kitchen),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: GridItem(image: Assets.kitchen2),
                      ),
                    ],
                  ),
                ),
              ).animate().moveY(
                    begin: 400,
                    duration: Time.animationDuration1,
                    delay: Time.animationDelayLong,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
