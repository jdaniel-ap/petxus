import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/const/colors.dart';

class TermsOfRegister extends StatelessWidget {
  final Function acceptTerms;
  const TermsOfRegister({Key? key, required this.acceptTerms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
              top: 50.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Link pet',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.qr_code_2,
                    size: 300,
                    color: Colors.grey,
                  ),
                ],
              ),
              Text(
                'Antes de começarmos, é importante que você saiba que a funcionalidade que vai usar tem uma finalidade muito importante: cadastrar cachorros em situação de vulnerabilidade. Sabemos que é uma causa nobre e que certamente você está motivado a ajudar esses animais.\n\nNo entanto, é preciso que você utilize essa ferramenta com responsabilidade e cuidado.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => acceptTerms(),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: kMainColor, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            color: kMainColor),
                        child: const Center(
                          child: Text(
                            'Conectar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
