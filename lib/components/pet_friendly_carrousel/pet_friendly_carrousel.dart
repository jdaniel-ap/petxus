import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:pets/components/section_header/section_header.dart';

class PetFriendlyCarrousel extends StatelessWidget {
  const PetFriendlyCarrousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Pet Friendly'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image.asset(
                        'assets/images/place_2.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  )),
                              child: const Center(
                                child: Icon(
                                  PhosphorIcons.circle_wavy_check_fill,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Marco Zero',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Satoshi'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image.asset(
                        'assets/images/place_1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  )),
                              child: const Center(
                                child: Icon(
                                  PhosphorIcons.circle_wavy_check_fill,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Rio Mar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Satoshi'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image.asset(
                        'assets/images/place_3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  )),
                              child: const Center(
                                child: Icon(
                                  PhosphorIcons.circle_wavy_check_fill,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'P. de armas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Satoshi'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
