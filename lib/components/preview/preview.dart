import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/const/colors.dart';

class Preview extends StatelessWidget {
  final String name;
  final String image;
  final int age;
  final int status;
  final String sex;
  final DateTime seen;

  const Preview(
      {Key? key,
      required this.name,
      required this.image,
      required this.age,
      required this.sex,
      required this.status,
      required this.seen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double gridWitdh = (width / 1.2) / 4;

    const ageObj = {
      0: "Neonatal",
      1: "Transição",
      3: "Infância",
      4: "Juvenil",
      5: "Adulta",
      6: "Velhice",
    };

    const statusObj = {
      0: "Critico",
      1: "Doente",
      2: "Saludavel",
    };
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            clipBehavior: Clip.hardEdge,
            height: 360,
            width: width / 1.2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: width / 1.2,
                  height: 90,
                  child: Image.asset(
                    'assets/images/preview-wall.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    width: width / 1.2,
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(999.0)),
                          ),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                  'assets/images/cat-and-dog.png');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          name,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF001219),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: width / 1.2,
                      child: Center(
                        child: Wrap(
                          spacing: 20, // gap between adjacent chips
                          runSpacing: 15.0,

                          children: [
                            Container(
                              width: gridWitdh,
                              child: Column(
                                children: [
                                  Text(
                                    'Cor',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Caramelo'),
                                ],
                              ),
                            ),
                            Container(
                              width: gridWitdh,
                              child: Column(
                                children: [
                                  Text(
                                    'Idade',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('${ageObj[age]}'),
                                ],
                              ),
                            ),
                            Container(
                              width: gridWitdh,
                              child: Column(
                                children: [
                                  Text(
                                    'Especie',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Cachorro'),
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                              width: gridWitdh,
                              child: Column(
                                children: [
                                  Text(
                                    'Sexo',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(sex),
                                ],
                              ),
                            ),
                            Container(
                              width: gridWitdh,
                              child: Column(
                                children: [
                                  Text(
                                    'Avistado',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                      '${seen.day}-${seen.month}-${seen.year}'),
                                ],
                              ),
                            ),
                            Container(
                              width: gridWitdh,
                              child: Column(
                                children: [
                                  Text(
                                    'Estado',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('${statusObj[status]}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.only(top: 15.0),
            decoration: BoxDecoration(
              color: kMainColor.withOpacity(0.9),
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.close_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
