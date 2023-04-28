import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:pets/components/section_header/section_header.dart';
import 'package:pets/models/strayPet.dart';

class AdoptionCarrousel extends StatelessWidget {
  AdoptionCarrousel({Key? key}) : super(key: key);

  List<Image> petImages = [
    Image.asset(
      'assets/images/pet_1.jpg',
      fit: BoxFit.fitWidth,
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

  List<StrayPet> pets = [
    StrayPet(
      name: 'Fofinho',
      age: 2,
      sex: 'M',
      status: 2,
      latitude: 0.0,
      longitude: 0.0,
      type: 1,
      color: 'Branco',
      nature: 'calm',
    ),
    StrayPet(
      name: 'Platon',
      age: 2,
      sex: 'M',
      status: 2,
      latitude: 0.0,
      longitude: 0.0,
      type: 1,
      color: 'Branco',
      nature: 'active',
    ),
    StrayPet(
      name: 'Socrates',
      age: 2,
      sex: 'M',
      status: 2,
      latitude: 0.0,
      longitude: 0.0,
      type: 1,
      color: 'Branco',
      nature: 'quiet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Pets para adocão'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                ...pets.asMap().entries.map((entry) {
                  final pet = entry.value;
                  final index = entry.key;
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(right: 20),
                    width: 200,
                    height: 240,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                height: 120,
                                width: 200,
                                child: petImages[index]),
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade300,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Adulto',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Satoshi',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade300,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Calma',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Satoshi',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5.0,
                          ),
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Fofinho',
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        PhosphorIcons.map_pin_fill,
                                        color: Colors.black54,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Varzea',
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                'O ${pet.name} é um adorável cachorro que está à procura de um lar amoroso e divertido.',
                                style:
                                    const TextStyle(fontSize: 12, height: 1.5),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
