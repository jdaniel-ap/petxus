import 'package:flutter/material.dart';
import 'package:pets/components/campaings_carrousel/campaings_carrousel.dart';
import 'package:pets/components/general_data/general_data.dart';
import 'package:pets/components/hero/hero.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeroPet(),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 10,
            ),
            GeneralData(),
            SizedBox(
              height: 10,
            ),
            CampaingsCarrousel(),
          ],
        ),
      ),
    );
  }
}
