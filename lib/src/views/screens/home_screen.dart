import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/provider/adhkar_provider.dart';
import 'package:strive_yourself/src/views/screens/view_dhkar_screen.dart';
import '../../models/adhkar_model.dart';
import '../widgets/custom/custom_card_section_adhkar.dart';
import '../widgets/w_background.dart';
import '../widgets/w_custom_circular_progress_indicator.dart';
import '../widgets/wc_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adhkarCategory = [
      {
        "title": "أذكار الصباح",
        "nameFile": "adhkar_sabah",
        "imageSrc": "assets/images/background/adhkarSabah.jpg",
      },
      {
        "title": "أذكار المساء",
        "nameFile": "adhkar_massa",
        "imageSrc": "assets/images/background/adhkarMassa.jpg",
      },
      {
        "title": "أذكار بعد الصلاة",
        "nameFile": "adhkar_after_prayer",
        "imageSrc": "assets/images/background/adhkarPray.jpg",
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          const Background(),
          Column(
            children: [
              // const CustomCardQuoteText(),
              // const Divider(),
              Expanded(
                child: ListView.builder(
                    itemCount: adhkarCategory.length,
                    itemBuilder: (context, index) {
                      final adhkarTitle = adhkarCategory[index];
                      return CustomCardSectionAdhkar(
                        title: adhkarTitle['title']!,
                        nameFileAdhkar: adhkarTitle['nameFile']!,
                        image: adhkarTitle['imageSrc']!,
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key, this.nameFileAdhkarJson = 'adhkar_sabah'});
//   final String nameFileAdhkarJson;
//   @override
//   Widget build(BuildContext context) {
//     final provAdhkar = Provider.of<AdhkarProvider>(context);

//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'جاهد نفسك',
//       ),
//       body: Stack(children: [
//         const Background(),
//         FutureBuilder(
//           future: provAdhkar.loadAdhkar(nameFileAdhkarJson),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return const CustomCircularProgressIndicator();
//             } else {
//               final adhkarList = provAdhkar.adhkar;
//               return ViewDhkarScreen(adhkarList: adhkarList);
//             }
//           },
//         )
//       ]),
//     );
//   }
// }
