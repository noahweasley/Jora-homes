import 'package:get/get.dart';
import 'package:jora_homes/core/navigation/app_routes.dart';

class MainController extends GetxController {
  void goToMainScreen() {
    Get.toNamed(Routes.home);
  }
}
