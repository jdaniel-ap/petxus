import 'package:flutter/material.dart';
import 'package:pets/components/section_header/section_header.dart';

class GeneralData extends StatelessWidget {
  const GeneralData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Estadisticas',
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  clipBehavior: Clip.hardEdge,
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Animais Cadastrados',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        ),
                        Text(
                          '3434',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  clipBehavior: Clip.hardEdge,
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Animais Adotados',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        ),
                        Text(
                          '244',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  clipBehavior: Clip.hardEdge,
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Denuncias de Maltrato',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  clipBehavior: Clip.hardEdge,
                  width: 200,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Animais vacinados',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        ),
                        Text(
                          '18%',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Satoshi',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
