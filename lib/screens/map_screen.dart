import 'package:flutter/material.dart';
import 'package:jora_homes/core/constants/app_style.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Maps',
        style: AppStyle.headline3,
      ),
    );
  }
}
