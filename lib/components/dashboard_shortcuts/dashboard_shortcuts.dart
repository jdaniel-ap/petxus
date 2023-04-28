import 'package:flutter/material.dart';
import 'package:pets/screens/profiles/stray_pet/stray_pet_profile.dart';

class DashboardShortcuts extends StatelessWidget {
  DashboardShortcuts({Key? key}) : super(key: key);

  double _optionSize = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StrayPetProfile(index: 1),
                  ),
                ),
                child: Container(
                  width: _optionSize,
                  height: _optionSize,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade400,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Procurar')
            ],
          ),
          Column(
            children: [
              Container(
                width: _optionSize,
                height: _optionSize,
                decoration: BoxDecoration(
                  color: Colors.purple.shade400,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Cadastrar')
            ],
          ),
          Column(
            children: [
              Container(
                width: _optionSize,
                height: _optionSize,
                decoration: BoxDecoration(
                  color: Colors.purple.shade400,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Icon(
                  Icons.warning_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Denunciar')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _optionSize,
                height: _optionSize,
                decoration: BoxDecoration(
                  color: Colors.purple.shade400,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Icon(
                  Icons.add_alert,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Alerta')
            ],
          )
        ],
      ),
    );
  }
}
