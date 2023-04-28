import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:pets/components/section_header/section_header.dart';

class VeterinaryCarrousel extends StatelessWidget {
  VeterinaryCarrousel({Key? key}) : super(key: key);

  List<Image> vetImages = [
    Image.asset(
      'assets/images/vet_1.jpg',
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      'assets/images/vet_2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/vet_3.jpg',
      fit: BoxFit.cover,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Veterinários'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                ...vetImages
                    .map(
                      (e) => Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.only(right: 20),
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
                            SizedBox(height: 120, child: e),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5.0,
                              ),
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nome do Prof',
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        PhosphorIcons.graduation_cap_fill,
                                        size: 15,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'UFPE',
                                        style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            PhosphorIcons.map_pin_fill,
                                            color: Colors.black54,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Varzea',
                                            style: TextStyle(
                                              fontFamily: 'Satoshi',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            '4.4',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            PhosphorIcons.star_fill,
                                            size: 15,
                                            color: Colors.yellow.shade700,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
