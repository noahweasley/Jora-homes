import 'package:flutter/material.dart';
import 'package:jora_homes/core/widgets/custom_tabbar.dart';

class BottomNavigation extends StatefulWidget {
  final List<Widget> children;

  const BottomNavigation({super.key, required this.children});

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<StatefulWidget> with TickerProviderStateMixin {
  late final ValueNotifier<int> index;

  @override
  void initState() {
    super.initState();
    index = ValueNotifier(2);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, index, _) {
        return Stack(
          children: [
            IndexedStack(
              index: index,
              children: (widget as BottomNavigation).children,
            ),
            Align(
              alignment: const Alignment(0, 0.93),
              child: CustomTabBar(
                currentIndex: index,
                onChanged: (value) => this.index.value = value,
              ),
            )
          ],
        );
      },
    );
  }
}
