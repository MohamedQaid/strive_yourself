// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextDhkar extends StatelessWidget {
  const CustomTextDhkar({
    super.key,
    required this.textString,
    this.fontSize = 15.0,
    this.colorText = Colors.white,
  });
  final String textString;
  final double fontSize;
  final Color colorText;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text(
        textString,
        textAlign: TextAlign.center,
        strutStyle: const StrutStyle(leading: 1),
        textScaler: const TextScaler.linear(1.2),
        style: TextStyle(
            color: colorText,
            fontSize: fontSize,
    ),
      ),
    );
  }
}
