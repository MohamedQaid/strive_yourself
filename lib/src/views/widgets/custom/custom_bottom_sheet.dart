import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: Colors.blueAccent,
          ),
          child: const Column(
            children: [
              Text('أختار نوع الخط'),
            ],
          ),
        );
      },
    );
  }
}
