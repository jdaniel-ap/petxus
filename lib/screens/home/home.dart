import 'package:flutter/material.dart';
import 'package:pets/components/adoption_carrousel/adoption_carrousel.dart';
import 'package:pets/components/blog_carrousel/blog_carrousel.dart';
import 'package:pets/components/hero/hero.dart';
import 'package:pets/components/pet_friendly_carrousel/pet_friendly_carrousel.dart';
import 'package:pets/components/pets_carrousel/pets_carrousel.dart';
import 'package:pets/components/veterinary_carrousel/veterinary_carrousel.dart';
import 'package:pets/const/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> petImages = [
      Image.asset(
        'assets/images/pet_1.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/pet_2.jpg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/pet_3.jpg',
        fit: BoxFit.cover,
      )
    ];

    final mediaQueries = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeroPet(),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: mediaQueries.width,
                  height: 160,
                  decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Vacinacão cães e gatos',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Satoshi',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              'Em 30 pontos da cidade\nneste final de semana',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Satoshi',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Ver mais',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Satoshi',
                                    color: kMainColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Transform.scale(
                          scaleX: -1,
                          child: Image.asset(
                            'assets/images/banner_1.png',
                            width: 160,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PetsCarrousel(),
              const SizedBox(
                height: 20,
              ),
              const BlogCarrousel(),
              const SizedBox(
                height: 20,
              ),
              AdoptionCarrousel(),
              const SizedBox(
                height: 20,
              ),
              VeterinaryCarrousel(),
              const SizedBox(
                height: 20,
              ),
              PetFriendlyCarrousel(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
