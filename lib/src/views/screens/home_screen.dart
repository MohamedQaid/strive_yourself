import 'package:flutter/material.dart';
import '../widgets/wc_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'AppBar',
      ),
      body: Center(
        child: Text('home screen '),
      ),
    );
  }
}
