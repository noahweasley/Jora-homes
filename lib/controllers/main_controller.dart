import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jora_homes/core/navigation/app_routes.dart';
import 'package:jora_homes/core/widgets/dialog.dart';

class MainController extends GetxController {
  final _isDialogOpened = false.obs;
  get isDialogOpened => _isDialogOpened.value;
  set isDialogOpened(flag) => _isDialogOpened.value = flag;

  final duration = const Duration(milliseconds: 300);
  late List<Offset> offsetList;
  final makerQty = 10;

  @override
  void onInit() {
    super.onInit();
    offsetList = getListOfPosition();
  }

  Offset getMarkerPosition() {
    final Random random = Random();
    final dx = random.nextDouble() * ScreenUtil.defaultSize.width;
    final dy = random.nextDouble() * ScreenUtil.defaultSize.height;
    return Offset(dx, dy);
  }

  List<Offset> getListOfPosition() {
    return List.generate(makerQty, (i) => getMarkerPosition());
  }

  void goToMainScreen() {
    Get.toNamed(Routes.home);
  }

  void showModal() async {
    toggle();
    await Get.dialog(
      const DialogContent(),
      barrierColor: Colors.transparent,
      barrierDismissible: true,
    );
    toggle();
  }

  void toggle() {
    isDialogOpened = !isDialogOpened;
  }
}
