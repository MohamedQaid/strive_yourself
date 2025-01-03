import 'package:flutter/material.dart';
import 'package:strive_yourself/src/views/widgets/custom/custom_bottom_sheet.dart';

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
      actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DraggableScrollableSheet(
                        initialChildSize: 0.3,
                        minChildSize: 0.2,
                        maxChildSize: 0.8,
                        expand: false,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return const CustomBottomSheet();
                        });
                  },
                  isScrollControlled: true);
            },
            icon: const Icon(Icons.text_fields_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
