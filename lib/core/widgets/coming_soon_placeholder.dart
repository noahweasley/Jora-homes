import 'package:flutter/material.dart';
import 'package:jora_homes/core/constants/assets.dart';

class ComingSoonPlaceholder extends StatelessWidget {
  const ComingSoonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Assets.placeholder),
    );
  }
}
