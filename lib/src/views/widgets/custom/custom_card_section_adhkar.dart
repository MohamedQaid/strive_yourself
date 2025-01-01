import 'package:flutter/material.dart';

import '../../screens/view_dhkar_screen.dart';

class CustomCardSectionAdhkar extends StatelessWidget {
  const CustomCardSectionAdhkar({
    super.key,
    this.title = 'أذكار الصباح',
    this.nameFileAdhkar = 'adhkar_sabah',
    this.image = 'assets/images/Error.png',
  });

  final String title;
  final String nameFileAdhkar;
  final String image;

  @override
  Widget build(BuildContext context) {
    // final fontProvider = context.watch<FontAppProvider>();

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewDhkarScreen(
                      nameFileAdhkar: nameFileAdhkar,
                    )));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                // fontFamily: fontProvider.selectedFont,
                shadows: [
                  BoxShadow(
                    offset: const Offset(-2.0, 2.0),
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.7),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
