import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets/controllers/pet_controller.dart';
import 'package:pets/screens/stray_pet/new/new_stray_pet.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PetController());

    return Stack(
      children: [
        GetBuilder<PetController>(
          init: controller,
          builder: (value) => GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            initialCameraPosition:
                CameraPosition(target: controller.position, zoom: 13),
            onMapCreated: controller.onMapCreated,
            myLocationEnabled: true,
            markers: controller.markers,
          ),
        ),
        Positioned(
          top: 60,
          right: 14,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        height: 200,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      PhosphorIcons.warning_fill,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    Text(
                                      'Denunciar\nabuso',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Satoshi',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const NewStrayPet()))
                                  .then((value) => Navigator.pop(context)),
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.green.shade300,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        PhosphorIcons.map_pin_fill,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      Text(
                                        'Cadastrar\npet vulneravel',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Satoshi',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ));
                  });
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.warning_rounded,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
