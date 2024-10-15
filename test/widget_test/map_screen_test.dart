import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jora_homes/bindings/main_binding.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/widgets/annotated_status_bar.dart';
import 'package:jora_homes/core/widgets/dialog.dart';
import 'package:jora_homes/core/widgets/map_markers.dart';
import 'package:jora_homes/core/widgets/search_bar.dart';
import 'package:jora_homes/screens/map_screen.dart';

void main() {
  final home = ScreenUtilInit(
    designSize: const Size(Dimensions.designWidth, Dimensions.designHeight),
    minTextAdapt: true,
    builder: (context, child) {
      return GetMaterialApp(
        home: const MapScreen(),
        initialBinding: MainBinding(),
      );
    },
  );

  testWidgets('MapScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(home);
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AnnotatedStatusBar), findsOneWidget);
    expect(find.byType(MapMarkers), findsOneWidget);
    expect(find.byType(AnimatedSearchBar), findsOneWidget);
    expect(find.byType(BottomActions), findsOneWidget);
  });

  testWidgets('Tapping on more vertical icon opens up dialog', (WidgetTester tester) async {
    await tester.pumpWidget(home);
    await tester.pumpAndSettle();

    final moreOptionsButton = find.byIcon(Icons.more_vert_rounded);
    expect(moreOptionsButton, findsOneWidget);

    await tester.tap(moreOptionsButton);
    await tester.pumpAndSettle();
    expect(find.byType(DialogContent), findsOneWidget);
  });
}
