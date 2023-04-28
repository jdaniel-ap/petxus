import 'package:flutter/material.dart';
import 'package:pets/components/section_header/section_header.dart';

class CampaingsCarrousel extends StatelessWidget {
  const CampaingsCarrousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Campanhas atuais', action: 'Criar nova'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            child: Text(
                              'Prevenção de pulgas e carrapatos em cães e gatos',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Satoshi'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/post_5.png',
                        width: 150,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 25),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            child: Text(
                              'Canil clandestino, saiba como denunciar',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Satoshi'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/post_4.png',
                        width: 150,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 25),
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            child: Text(
                              'Por que adotar um animal de estimação é uma ótima escolha',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Satoshi'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/post_3.png',
                        width: 150,
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
