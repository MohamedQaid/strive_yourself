import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/provider/adhkar_provider.dart';

import '../../../models/adhkar_model.dart';
import '../../../provider/font_app_provider.dart';

class CustomButtonCopyDhkar extends StatelessWidget {
  const CustomButtonCopyDhkar({
    super.key,
    required this.providerAdhkar,
    required this.dhkar,
  });

  final AdhkarProvider providerAdhkar;
  final AdhkarModel dhkar;

  @override
  Widget build(BuildContext context) {
    final fontProvider = context.watch<FontAppProvider>();

    return GestureDetector(
      onTap: () {
        providerAdhkar.copyDhkar(dhkar.dhikr);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            showCloseIcon: true,
            backgroundColor: Colors.cyan,
            content: Text(
                style: TextStyle(fontFamily: fontProvider.selectedFont),
                'تم نسخ الذكر')));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(16)),
        child: const Icon(
          Icons.copy_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
