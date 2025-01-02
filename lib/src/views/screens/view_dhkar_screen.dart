import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_yourself/src/views/widgets/custom/custom_Text_dhkar.dart';
// import 'package:provider/provider.dart';

import '../../models/adhkar_model.dart';
import '../../provider/adhkar_provider.dart';
import '../widgets/custom/custom_button_copy_dhkar.dart';
import '../widgets/custom/custom_button_count_dhkar.dart';
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
    final provAdhkar = Provider.of<AdhkarProvider>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'جاهد نفسك',
      ),
      body: Stack(children: [
        const Background(),
        FutureBuilder(
          future: provAdhkar.loadAdhkar(nameFileAdhkar),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
    final providerAdhkar = Provider.of<AdhkarProvider>(context, listen: false);

    return SizedBox(
      height: double.infinity,
      child: CarouselSlider.builder(
        itemCount: adhkarList.length,
        options: CarouselOptions(
          scrollDirection: Axis.vertical,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          final dhkar = adhkarList[index];
          return Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            decoration: BoxDecoration(
                color: const Color(0xff051519),
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Expanded(
                    child: CustomTextDhkar(
                  fontSize: 14,
                  textString: dhkar.dhikr,
                )),
                // !
                CustomTextDhkar(
                    fontSize: 8,
                    colorText: const Color(0xffD4AF37),
                    textString: 'المصدر : ${dhkar.reference}'),
                //!
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                      color: Color(0xff082026),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(25))),
                  child: CustomTextDhkar(
                    textString: 'الفضل : ${dhkar.description}  ',
                    fontSize: 12,
                  ),
                ),
//!
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomButtonCountDhkar(dhkar: dhkar),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButtonCopyDhkar(
                        dhkar: dhkar,
                        providerAdhkar: providerAdhkar,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
