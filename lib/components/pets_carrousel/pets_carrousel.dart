import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:pets/screens/petProfile/pet_profile.dart';

class PetsCarrousel extends StatelessWidget {
  PetsCarrousel({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Seus pets',
            style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Icon(
                  PhosphorIcons.plus,
                  size: 20,
                ),
              ),
              ...petImages.map(
                (image) {
                  final index = petImages.indexOf(image);
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PetProfile(
                              index: index,
                            ),
                          ),
                        ),
                        child: Hero(
                          tag: 'pet-$index',
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            clipBehavior: Clip.hardEdge,
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                            child: image,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList()
            ],
          ),
        ),
      ],
    );
  }
}
