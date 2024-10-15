import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jora_homes/bindings/main_binding.dart';
import 'package:jora_homes/core/constants/assets.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/widgets/grid_item.dart';
import 'package:jora_homes/core/widgets/offer_count.dart';
import 'package:jora_homes/screens/landing_page.dart';

import '../util.dart';

void main() {
  final home = ScreenUtilInit(
    designSize: const Size(Dimensions.designWidth, Dimensions.designHeight),
    minTextAdapt: true,
    builder: (context, child) {
      return GetMaterialApp(
        home: const LandingPageScreen(),
        initialBinding: MainBinding(),
      );
    },
  );

  testWidgets('LandingPageScreen renders correctly', (WidgetTester tester) async {
    initializeScreen(tester);
    await tester.pumpWidget(home);
    await tester.pumpAndSettle();
 
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text(Strings.userLocation), findsOneWidget);
    expect(find.text(Strings.greeting), findsOneWidget);
    expect(find.text(Strings.selectDate), findsOneWidget);
    expect(find.byType(OfferCount), findsNWidgets(2));
    expect(find.byType(GridItem), findsNWidgets(6));
  });

  testWidgets('Check if the Location and Avatar are displayed correctly', (WidgetTester tester) async {
    initializeScreen(tester);
    await tester.pumpWidget(home);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.location_on), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.image(const AssetImage(Assets.profile)), findsOneWidget);
  });
}
