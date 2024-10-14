import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jora_homes/controllers/main_controller.dart';
import 'package:jora_homes/core/constants/colors.dart';
import 'package:jora_homes/core/widgets/annotated_status_bar.dart';
import 'package:jora_homes/core/widgets/bottom_navigation.dart';
import 'package:jora_homes/core/widgets/coming_soon_placeholder.dart';
import 'package:jora_homes/screens/landing_page.dart';
import 'package:jora_homes/screens/map_screen.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedStatusBar(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: BottomNavigation(
          children: <Widget>[
            MapScreen(),
            ComingSoonPlaceholder(),
            LandingPageScreen(),
            ComingSoonPlaceholder(),
            ComingSoonPlaceholder(),
          ],
        ),
      ),
    );
  }
}
