import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Slide extends StatelessWidget {
  final bool nextButton;
  final String message;
  final String image;
  const Slide({
    Key? key,
    required this.message,
    required this.image,
    this.nextButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 30.0),
              child: Image.asset(
                image,
              ),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
