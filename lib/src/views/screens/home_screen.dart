import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/provider/adhkar_provider.dart';
import '../../models/adhkar_model.dart';
import '../widgets/w_background.dart';
import '../widgets/wc_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.nameFileAdhkarJson = 'adhkar_sabah'});
  final String nameFileAdhkarJson;
  @override
  Widget build(BuildContext context) {
    final provAdhkar = Provider.of<AdhkarProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'جاهد نفسك',
      ),
      body: Stack(children: [
        const Background(),
        FutureBuilder(
          future: provAdhkar.loadAdhkar(nameFileAdhkarJson),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const CustomCircularProgressIndicator();
            } else {
              final adhkarList = provAdhkar.adhkar;
              return CardAdhkar(adhkarList: adhkarList);
            }
          },
        )
      ]),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CardAdhkar extends StatelessWidget {
  const CardAdhkar({super.key, required this.adhkarList});
  final List<AdhkarModel> adhkarList;
  @override
  Widget build(BuildContext context) {
    final providerAdhkar = Provider.of<AdhkarProvider>(context, listen: false);

    return SizedBox(
      child: ListView.builder(
        itemCount: adhkarList.length,
        itemBuilder: (context, index) {
          final dhkar = adhkarList[index];
          return Container(
            child: Text(dhkar.dhikr),
          );
        },
      ),
    );
  }
}
