import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jora_homes/bindings/main_binding.dart';
import 'package:jora_homes/controllers/main_controller.dart';
import 'package:jora_homes/core/constants/assets.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/navigation/navigation.dart';
import 'package:jora_homes/screens/intro_screen.dart';
import 'package:jora_homes/screens/main_screen.dart';

import '../util.dart';

void main() {
  final home = ScreenUtilInit(
      designSize: const Size(Dimensions.designWidth, Dimensions.designHeight),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          home: const IntroScreen(),
          initialBinding: MainBinding(),
          initialRoute: Routes.extra,
          getPages: AppRouter.pages,
        );
      });

  testWidgets('IntroScreen displays AppBar with correct title', (WidgetTester tester) async {
    initializeScreen(tester);
    await tester.pumpWidget(home);
    // Verify that AppBar is present and the title is correct
    expect(find.text(Strings.appName), findsOneWidget);
  });

  testWidgets('IntroScreen displays image and button', (WidgetTester tester) async {
    initializeScreen(tester);
    await tester.pumpWidget(home);
    // Verify the image is displayed
    expect(find.byType(Image), findsOneWidget);

    const peopleWaving = AssetImage(Assets.peopleWaving);

    expect(
      find.byWidgetPredicate((widget) => widget is Image && widget.image == peopleWaving),
      findsOneWidget,
    );

    // Verify the button is displayed and has correct text
    expect(find.text('Start exploring'), findsOneWidget);
  });

  testWidgets('Start exploring button tap navigates to main screen', (WidgetTester tester) async {
    initializeScreen(tester);
    final mainController = MainController();
    Get.put(mainController);

    await tester.pumpWidget(home);

    expect(find.byType(IntroScreen), findsOneWidget);
    expect(find.byType(MainScreen), findsNothing);

    await tester.tap(find.text('Start exploring'));
    await tester.pumpAndSettle();

    expect(find.byType(MainScreen), findsOneWidget);
    expect(find.byType(IntroScreen), findsNothing);
  });
}
