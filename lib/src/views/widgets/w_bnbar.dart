import 'package:flutter/material.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/provider/bnbar_provider.dart';
import 'package:strive_yourself/src/provider/font_app_provider.dart';
import 'package:strive_yourself/src/views/screens/home_screen.dart';
import 'package:strive_yourself/src/views/screens/view_dhkar_screen.dart';

class WBNBar extends StatelessWidget {
  const WBNBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provBNB = context.watch<BNBarProvider>();

    return Scaffold(
      body: IndexedStack(
        index: provBNB.currentIndexScreen,
        children: const [HomeScreen(), ViewDhkarScreen()],
      ),
      bottomNavigationBar: NavigationView(
          onChangePage: (p0) {
            context.read<BNBarProvider>().changScreen(p0);
          },
          items: [
            ItemNavigationView(
                childAfter: const CustomBNBarTextItem(
                  theText: 'الاذكار',
                ),
                childBefore: const Icon(Icons.ac_unit)),
            ItemNavigationView(
                childAfter: const CustomBNBarTextItem(
                  theText: 'تسبيح',
                ),
                childBefore: const Icon(Icons.control_point_outlined)),
            ItemNavigationView(
                childAfter: const CustomBNBarTextItem(
                  theText: 'الاعدادات',
                ),
                childBefore: const Icon(Icons.settings)),
          ]),
    );
  }
}

class CustomBNBarTextItem extends StatelessWidget {
  const CustomBNBarTextItem({
    super.key,
    required this.theText,
  });

  final String theText;

  @override
  Widget build(BuildContext context) {
    final provFont = context.watch<FontAppProvider>();
    return Text(
      theText,
      style: TextStyle(fontFamily: provFont.selectedFont),
    );
  }
}
