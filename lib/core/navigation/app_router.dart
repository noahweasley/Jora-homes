import 'package:get/get.dart';
import 'package:jora_homes/bindings/main_binding.dart';
import 'package:jora_homes/core/navigation/app_routes.dart';
import 'package:jora_homes/screens/main_screen.dart';

class AppRouter {
  static final pages = [
    GetPage(
      name: Routes.home,
      binding: MainBinding(),
      transition: Transition.fade,
      page: () => const MainScreen(),
    ),
  ];
}