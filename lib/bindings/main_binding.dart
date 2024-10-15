import 'package:get/get.dart';
import 'package:jora_homes/controllers/main_controller.dart';
import 'package:jora_homes/controllers/map_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => MapController());
  }
}
