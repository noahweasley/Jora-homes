import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_homes/controllers/main_controller.dart';
import 'package:jora_homes/core/constants/app_style.dart';
import 'package:jora_homes/core/constants/assets.dart';
import 'package:jora_homes/core/constants/dimensions.dart';
import 'package:jora_homes/core/constants/strings.dart';
import 'package:jora_homes/core/widgets/app_bar.dart';
import 'package:jora_homes/core/widgets/app_button.dart';

class IntroScreen extends GetView<MainController> {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          Strings.appName,
          style: AppStyle.title,
        ),
      ),
      body: Column(
        children: [
          Image.asset(Assets.peopleWaving),
          Padding(
            padding: const EdgeInsets.all(Dimensions.space2),
            child: AppButton(
              width: Dimensions.navigateBtnWidth,
              text: 'Start exploring',
              onTap: controller.goToMainScreen,
            ),
          ),
        ],
      ),
    );
  }
}
