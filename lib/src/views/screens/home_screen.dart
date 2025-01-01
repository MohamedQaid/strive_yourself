import 'package:flutter/material.dart';
import '../widgets/w_background.dart';
import '../widgets/wc_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'جاهد نفسك',
      ),
      body: Stack(children: [
        Background(),
        Center(
          child: Text('home screen '),
        ),
      ]),
    );
  }
}
