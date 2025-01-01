import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

import '../../models/adhkar_model.dart';
import '../../provider/adhkar_provider.dart';
import '../widgets/w_background.dart';
import '../widgets/w_custom_circular_progress_indicator.dart';
import '../widgets/wc_app_bar.dart';
// import '../../provider/adhkar_provider.dart';

class ViewDhkarScreen extends StatelessWidget {
  const ViewDhkarScreen({
    super.key,
    this.nameFileAdhkar = "adhkar_sabah",
  });

  final String nameFileAdhkar;
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
          future: provAdhkar.loadAdhkar(nameFileAdhkar),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const CustomCircularProgressIndicator();
            } else {
              final adhkarList = provAdhkar.adhkar;
              return CardAdhkar(
                adhkarList: adhkarList,
              );
            }
          },
        )
      ]),
    );
  }
}

class CardAdhkar extends StatelessWidget {
  const CardAdhkar({super.key, required this.adhkarList});
  final List<AdhkarModel> adhkarList;
  @override
  Widget build(BuildContext context) {
    // final providerAdhkar = Provider.of<ProviderAdhkar>(context, listen: false);

    return SizedBox(
      height: double.infinity,
      child: ListView.builder(
        itemCount: adhkarList.length,
        itemBuilder: (BuildContext context, int index) {
          final dhkar = adhkarList[index];
          return Card(
            child: Text(dhkar.dhikr),
          );
        },
      ),
    );
  }
}
