import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/widgets/map_markers.dart';

import '../util.dart';

void main() {
  testWidgets('MapMarkers generates the correct quantity', (WidgetTester tester) async {
    initializeScreen(tester);
    const int quantity = 5;
    final List<Offset> offsetList = List.generate(quantity, (index) => Offset(index * 50.0, index * 50.0));

    await tester.pumpWidget(
      ScreenUtilInit(
          designSize: const Size(Dimensions.designWidth, Dimensions.designHeight),
          minTextAdapt: true,
          builder: (context, child) {
            return GetMaterialApp(
              home: Scaffold(
                body: MapMarkers(
                  isClicked: false,
                  quantity: quantity,
                  offsetList: offsetList,
                ),
              ),
            );
          }),
    );

    await tester.pumpAndSettle();
    expect(find.byType(Positioned), findsNWidgets(quantity));
  });
}
