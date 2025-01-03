
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/provider/adhkar_provider.dart';

import '../../../models/adhkar_model.dart';
import '../../../provider/font_app_provider.dart';

class CustomButtonCountDhkar extends StatelessWidget {
  const CustomButtonCountDhkar({
    super.key,
    required this.dhkar,
  });

  final AdhkarModel dhkar;

  @override
  Widget build(BuildContext context) {
    final providerAdhkar = context.watch<AdhkarProvider>();
        final fontProvider = context.watch<FontAppProvider>();

    return GestureDetector(
      onTap: () {
        providerAdhkar.decreaseCount(dhkar.id);
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        height: 50,
        alignment: Alignment.center,
        // width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(16)),
        child: Consumer<AdhkarProvider>(
            builder: (context, value, child) =>
                Text(dhkar.remainingCount.toString()
                , style: TextStyle(fontFamily: fontProvider.selectedFont),
                )
                
                ),
      ),
    );
  }
}
