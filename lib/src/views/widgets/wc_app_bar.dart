import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  // final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title = 'no',
    // this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$title"),
      // actions: actions,
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
