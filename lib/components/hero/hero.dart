import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class HeroPet extends StatelessWidget {
  const HeroPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueries = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: mediaQueries.width,
          height: 300,
          child: Image.network(
            'https://p2.trrsf.com/image/fget/cf/1200/1200/middle/images.terra.com/2022/12/18/1070249539-pets-verao-cuidados.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 300,
          color: Colors.black54.withOpacity(0.4),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'PetxUs',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const SizedBox(
                          width: 50,
                          child: Center(
                            child: Icon(Icons.search),
                          )),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 32,
                        minWidth: 32,
                      ),
                      hintText: 'O que seu pet precisa',
                      alignLabelWithHint: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  PhosphorIcons.list,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const Icon(
                PhosphorIcons.bell_fill,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
