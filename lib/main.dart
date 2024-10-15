import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jora_homes/bindings/main_binding.dart';
import 'package:jora_homes/core/app_init.dart';
import 'package:jora_homes/core/constants/app_theme.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/navigation/app_router.dart';
import 'package:jora_homes/core/navigation/app_routes.dart';

void main() async {
  await AppInitialization.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(Dimensions.designWidth, Dimensions.designHeight),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: MainBinding(),
          initialRoute: Routes.extra,
          getPages: AppRouter.pages,
          title: Strings.appName,
          theme: Themes.getTheme(Themes.lightThemeCode),
        );
      },
    );
  }
}
