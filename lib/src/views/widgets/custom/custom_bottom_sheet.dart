import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/provider/font_app_provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final fontProvider = context.watch<FontAppProvider>();
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('اختار نوع الخط'),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                    itemCount: fontProvider.nameFontsList.length,
                    itemBuilder: (context, index) {
                      final nameFont = fontProvider.nameFontsList[index];
                      return ListTile(
                        title: Text(
                          'هاذا نص تجريبي',
                          style: TextStyle(fontFamily: nameFont),
                        ),
                        trailing: fontProvider.selectedFont == nameFont
                            ? const Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.green,
                              )
                            : const Icon(Icons.highlight_off_rounded),
                            onTap: () =>  fontProvider.changeFont(nameFont),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
