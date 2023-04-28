import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/const/colors.dart';
import 'package:pets/screens/intro/slides.dart';

final slides = [
  {
    'message': 'Uma nova forma de descobrir\n  sa nas hgal a ',
    'image': 'assets/images/paw.png'
  },
  {
    'message': 'Encontre serviços veterinários de\npara cuidar',
    'image': 'assets/images/veterinary.png'
  },
  {
    'message': 'Apoie as ONGs que trabalham\nem prol do bem-estar animal',
    'image': 'assets/images/shelter.png'
  },
  {
    'message': 'hola que tal, soy el chico de las\npoeias tu efiel admirad',
    'image': 'assets/images/cat-and-dog.png'
  },
];

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _currentSlide = 0;
  Widget _bottomElement = Indicators(slides: slides.length, index: 0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: PageController(),
          onPageChanged: (e) {
            setState(() {
              _currentSlide = e;
            });
            setState(() {
              _bottomElement = _currentSlide == 3
                  ? const StartButton()
                  : Indicators(
                      index: _currentSlide,
                      slides: slides.length,
                    );
            });
          },
          children: slides.map((slide) {
            return Slide(
              nextButton: _currentSlide == 3,
              message: slide['message'] ?? '',
              image: slide['image'] ?? '',
            );
          }).toList(),
        ),
        Positioned(
          bottom: 100.0,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _bottomElement)),
        )
      ],
    );
  }
}

class Indicators extends StatelessWidget {
  final int slides;
  final int index;

  const Indicators({
    super.key,
    required this.slides,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < slides; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.only(right: 10.0),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color:
                    i == index ? Colors.black : Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 150.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INICIAR',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
