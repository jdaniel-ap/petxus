import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/components/terms/termsOfRegister.dart';
import 'package:pets/const/colors.dart';
import 'package:pets/controllers/pet_controller.dart';
import 'package:pets/database/db.dart';
import 'package:pets/models/strayPet.dart';
import 'package:pets/screens/preview_screen/preview_screen.dart';

class NewStrayPet extends StatefulWidget {
  const NewStrayPet({Key? key}) : super(key: key);

  @override
  State<NewStrayPet> createState() => _NewStrayPetState();
}

class _NewStrayPetState extends State<NewStrayPet> {
  bool acceptTerms = false;
  int isCreating = 0;
  final controller = Get.put(PetController());
  File? file;
  DateTime today = DateTime.now();
  final StrayPet _pet = StrayPet(
    name: '',
    age: 3,
    sex: 'M',
    status: 2,
    latitude: 0.0,
    longitude: 0.0,
    type: 0,
    color: '',
  );

  Future createStrayPet() async {
    setState(() => isCreating = 1);
    final geo = await controller.getPetPosition();
    FirebaseFirestore firestore = DB.get();
    final path = 'files/${DateTime.now().microsecondsSinceEpoch}';
    final selectedFile = File(file!.path);

    final ref = FirebaseStorage.instance.ref().child(path);

    final uploadTask = ref.putFile(selectedFile);

    final snapshot =
        await uploadTask!.whenComplete(() => {setState(() => isCreating = 2)});

    final url = await snapshot.ref.getDownloadURL();

    final data = {
      'name': _pet.name,
      'image': url,
      'position': {"geopoint": GeoPoint(geo[0], geo[1])},
      "sex": _pet.sex,
      "status": _pet.status,
      "created_at": DateTime.now(),
      "age": _pet.age,
      "color": _pet.color,
      "type": _pet.type,
    };

    await firestore.collection('stray_pet').add(data).whenComplete(() => {});

    await controller.loadPets();

    backToMap();

    setState(() => isCreating = 0);
  }

  backToMap() {
    Navigator.pop(context);
  }

  showPreview(selectedFile) async {
    selectedFile = await Get.to(() => PreviewScreen(file: selectedFile));

    if (selectedFile != null) {
      setState(() => file = selectedFile);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          !acceptTerms
              ? TermsOfRegister(
                  acceptTerms: () => setState(() {
                    acceptTerms = true;
                  }),
                )
              : Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 50.0, left: 22.0, right: 22.0),
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Formulario de Cadastro\nde pet vulneravel',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() =>
                              CameraCamera(onFile: (e) => showPreview(e))),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black54, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: file != null
                                ? Image.file(
                                    file!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.add_a_photo_rounded,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: const Text(
                            'Nome',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            onChanged: (e) {
                              setState(() {
                                _pet.name = e;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kMainColor, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 1.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'É um nome temporal',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: const Text(
                            'Especie',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black54, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Row(
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                items: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text('Gato'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Text('Cachorro'),
                                    ),
                                  ),
                                ],
                                value: _pet.type,
                                onChanged: (value) {
                                  setState(() {
                                    _pet.type = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: const Text(
                            'Cor',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            onChanged: (e) {
                              setState(() {
                                _pet.color = e;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kMainColor, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 1.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Cor principal do animal',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: const Text(
                            'Idade',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black54, width: 1),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Row(
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                items: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child:
                                          const Text('Neonatal: 0 - 12 dias'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child:
                                          const Text('Transição: 13 - 20 dias'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child:
                                          const Text('Infância: 3 - 4 semanas'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 3,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Text(
                                          'Juvenil: 3 meses - 1 ano'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 4,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child:
                                          const Text('Fase adulta: 1 - 7 anos'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 5,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Text(
                                          'Velhice: maior de 7 anos'),
                                    ),
                                  ),
                                ],
                                value: _pet.age,
                                onChanged: (value) {
                                  setState(() {
                                    _pet.age = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: const Text(
                            'Sexo',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black54, width: 1),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Row(
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                items: [
                                  DropdownMenuItem(
                                    value: 'M',
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text('M'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'F',
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Text('F'),
                                    ),
                                  ),
                                ],
                                value: _pet.sex,
                                onChanged: (value) {
                                  setState(() {
                                    _pet.sex = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: const Text(
                            'Saude',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black54, width: 1),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Row(
                            children: [
                              DropdownButton(
                                underline: const SizedBox(),
                                items: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text('Critico'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Text('Doente'),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Text('Saludavel'),
                                    ),
                                  ),
                                ],
                                value: _pet.status,
                                onChanged: (value) {
                                  setState(() {
                                    _pet.status = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
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
                              width: 30,
                            ),
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  color: isCreating > 0
                                      ? kMainColor.withOpacity(0.8)
                                      : kMainColor,
                                ),
                                child: MaterialButton(
                                  onPressed:
                                      isCreating > 0 ? null : createStrayPet,
                                  child: Text(
                                    isCreating == 1
                                        ? 'Salvando image...'
                                        : isCreating == 2
                                            ? 'Cadastrando pet...'
                                            : 'Cadastrar',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    isCreating >= 1
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: kMainColor,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      isCreating == 1
                                          ? 'Salvando image...'
                                          : 'Cadastrando pet...',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
        ],
      ),
    );
  }
}
