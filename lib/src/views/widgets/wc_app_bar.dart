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
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) {
                  return DraggableScrollableSheet(
                      initialChildSize: 0.3,
                      minChildSize: 0.2,
                      maxChildSize: 0.9,
                      expand: false,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return CustomBottomSheet(
                          scrollController: scrollController,
                        );
                      });
                },
              );
            },
            icon: const Icon(Icons.text_fields_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
