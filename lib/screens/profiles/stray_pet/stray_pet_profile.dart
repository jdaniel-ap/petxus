import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class StrayPetProfile extends StatefulWidget {
  final int index;
  const StrayPetProfile({Key? key, required this.index}) : super(key: key);

  @override
  State<StrayPetProfile> createState() => _StrayPetProfileState();
}

class _StrayPetProfileState extends State<StrayPetProfile> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Hero(
              tag: 'pet-${widget.index}',
              child: Container(
                width: size.width,
                height: size.height / 2.1,
                child: Image.asset(
                  'assets/images/pet_1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
              margin: EdgeInsets.only(top: size.height / 2.3),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: const [
                              Text(
                                'Fofinha',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                PhosphorIcons.gender_female_fill,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.star_fill,
                                color: Colors.yellow.shade700,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Vacinas ao dia',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Saudável',
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.green.shade400,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Satoshi'),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Estado atual',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    spacing: 60,
                    direction: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          tab = 0;
                        }),
                        child: Column(
                          children: [
                            Text(
                              'Resume',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: tab == 0
                                    ? Colors.green.shade400
                                    : Colors.black54,
                              ),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: tab == 0
                                    ? Colors.green.shade400
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          tab = 1;
                        }),
                        child: Column(
                          children: [
                            Text(
                              'Historia',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: tab == 1
                                    ? Colors.green.shade400
                                    : Colors.black54,
                              ),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: tab == 1
                                    ? Colors.green.shade400
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          tab = 2;
                        }),
                        child: Column(
                          children: [
                            Text(
                              'Acões',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: tab == 2
                                    ? Colors.green.shade400
                                    : Colors.black54,
                              ),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: tab == 2
                                    ? Colors.green.shade400
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  tab == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Idade',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Altura',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '35cm',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Peso',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '20kg',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Especie',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Icon(
                                        PhosphorIcons.dog_fill,
                                        color: Colors.black54,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Caráter',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Calma',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Castrado',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Não',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Observações',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Hachiko foi um cão da raça Akita que nasceu em 1923, no Japão. Ele foi criado como um cão de companhia e, desde cedo, demonstrou um temperamento amigável e leal.\n\nHachiko foi presenteado ao professor universitário Hidesaburo Ueno e os dois desenvolveram uma forte relação de afeto e amizade. Hachiko gostava de acompanhar o seu dono até a estação de trem todos os dias e, à tarde, retornava para encontrá-lo. Mesmo após a morte repentina do seu dono, Hachiko continuou indo diariamente à estação de trem esperando o retorno do professor.\n\nEssa rotina durou quase 10 anos, até a morte de Hachiko em 1935. A história de Hachiko é conhecida mundialmente por sua lealdade e amor incondicional ao seu dono, que inspirou muitas pessoas e se tornou um símbolo de devoção. A natureza gentil e leal de Hachiko é um exemplo para muitos de como os cães são capazes de amar incondicionalmente e se tornar parte de nossas vidas.',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        )
                      : tab == 1
                          ? Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Acão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Chequeo',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Geral',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        PhosphorIcons.caret_right,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Intervencão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '25 May 2023',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Acão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Vacinacão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Raiva',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        PhosphorIcons.caret_right,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Intervencão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '25 May 2023',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Acão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Vacinacão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'V10',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        PhosphorIcons.caret_right,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Intervencão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '05 Jan 2023',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Acão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Vacinacão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Tosse canis',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        PhosphorIcons.caret_right,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Intervencão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '05 Jan 2023',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Acão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Castracão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        PhosphorIcons.caret_right,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Intervencão',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '01 Dez 2022',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              direction: Axis.horizontal,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.syringe_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Vacinar',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.first_aid_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Check',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.pill_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Castrar',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.paw_print_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Adoção',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.house_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Refugio',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.file_text_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Observacão',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.first_aid_kit_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Internacão',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade300,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.warning_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Maus tratos',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 10,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                PhosphorIcons.caret_left_bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
