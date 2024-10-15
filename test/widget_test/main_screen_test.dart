import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jora_homes/bindings/main_binding.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/navigation/navigation.dart';
import 'package:jora_homes/core/widgets/annotated_status_bar.dart';
import 'package:jora_homes/core/widgets/bottom_navigation.dart';
import 'package:jora_homes/core/widgets/coming_soon_placeholder.dart';
import 'package:jora_homes/screens/landing_page.dart';
import 'package:jora_homes/screens/main_screen.dart';
import 'package:jora_homes/screens/map_screen.dart';

import '../util.dart';

void main() {
  final home = ScreenUtilInit(
      designSize: const Size(Dimensions.designWidth, Dimensions.designHeight),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          home: const MainScreen(),
          initialBinding: MainBinding(),
          initialRoute: Routes.home,
          getPages: AppRouter.pages,
        );
      });

  testWidgets('MainScreen renders correctly', (WidgetTester tester) async {
    initializeScreen(tester);
    await tester.pumpWidget(home);
    await tester.pumpAndSettle();

    expect(find.byType(AnnotatedStatusBar), findsOneWidget);
    expect(find.byType(Scaffold), findsNWidgets(2));
    expect(find.byType(BottomNavigation), findsOneWidget);
  });

}
