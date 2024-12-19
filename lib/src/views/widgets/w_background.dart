import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  const Background({super.key, this.color = Colors.transparent});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: color,
      height: size.height,
      width: size.width,
      child: Image.asset(
        'assets/images/background/background.png',
        color: Colors.brown.withOpacity(0.06),
        fit: BoxFit.cover,
        height: size.height,
      ),
    );
  }
}
