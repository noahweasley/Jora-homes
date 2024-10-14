import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jora_homes/core/constants/dimensions.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final Widget? title;
  final bool noTitle;
  final Widget? leadingIcon;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onNavigateUp;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;

  const MyAppBar({
    super.key,
    this.leadingIcon,
    this.title,
    this.noTitle = false,
    this.centerTitle = true,
    this.bottom,
    this.actions,
    this.backgroundColor,
    this.onNavigateUp,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(Dimensions.toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android
        statusBarBrightness: Brightness.dark, // For iOS
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottom: bottom,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: !automaticallyImplyLeading
          ? null
          : InkWell(
              onTap: onNavigateUp ?? Get.back,
              customBorder: const CircleBorder(),
              child: leadingIcon ??
                  InkWell(
                    onTap: onNavigateUp,
                    customBorder: const CircleBorder(),
                    child: leadingIcon ??
                        const Icon(
                          Icons.close,
                          size: 24,
                          color: Colors.white,
                        ),
                  ),
            ),
      centerTitle: centerTitle,
      title: title,
    );
  }
}
