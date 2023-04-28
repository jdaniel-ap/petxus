import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PetProfile extends StatefulWidget {
  final int index;
  const PetProfile({Key? key, required this.index}) : super(key: key);

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
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
                            'Saludavel',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'Reportar',
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
                    height: 30,
                  ),
                  tab == 0
                      ? Column(
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
                            SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Hachiko foi um cão da raça Akita que nasceu em 1923, no Japão. Ele foi criado como um cão de companhia e, desde cedo, demonstrou um temperamento amigável e leal.\n\nHachiko foi presenteado ao professor universitário Hidesaburo Ueno e os dois desenvolveram uma forte relação de afeto e amizade. Hachiko gostava de acompanhar o seu dono até a estação de trem todos os dias e, à tarde, retornava para encontrá-lo. Mesmo após a morte repentina do seu dono, Hachiko continuou indo diariamente à estação de trem esperando o retorno do professor.\n\nEssa rotina durou quase 10 anos, até a morte de Hachiko em 1935. A história de Hachiko é conhecida mundialmente por sua lealdade e amor incondicional ao seu dono, que inspirou muitas pessoas e se tornou um símbolo de devoção. A natureza gentil e leal de Hachiko é um exemplo para muitos de como os cães são capazes de amar incondicionalmente e se tornar parte de nossas vidas.',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const Text(
                              'A funcionalidade "reportar" no perfil do seu animal de estimação é uma ferramenta muito útil para ajudar a localizar e se reunir com seu animal de estimação perdido. Se você usar essa funcionalidade, aqui estão cinco etapas importantes que serão seguidas para tentar encontrar seu animal de estimação perdido:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '1) Seu relatório será automaticamente enviado às autoridades responsáveis pela busca de animais perdidos em sua área.\n\n2) As autoridades receberão as informações que você forneceu em seu relatório, como a descrição física do seu animal de estimação, sua idade e sua última localização conhecida.\n\n3) As autoridades podem publicar um alerta para proprietários de animais de estimação e veterinários em sua área para ajudar a encontrar seu animal de estimação perdido.\n\n4) Se alguém encontrar seu animal de estimação, as autoridades podem verificar se corresponde à descrição que você forneceu e entrar em contato com você usando as informações de contato que você forneceu em seu relatório.\n\n5) Se seu animal de estimação for encontrado, as autoridades podem ajudá-lo a se reunir com ele e, se necessário, fornecer atendimento médico ou abrigo temporário.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Fazer reporte',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
