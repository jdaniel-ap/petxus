import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:pets/const/colors.dart';
import 'package:pets/screens/dashboard_screen/dashboard.dart';
import 'package:pets/screens/home/home.dart';
import 'package:pets/screens/map/map.dart';
import 'package:pets/screens/profiles/stray_pet/stray_pet_profile.dart';
import 'package:pets/screens/stray_pet/new/new_stray_pet.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _pageIndex = 0;

  double _iconContainerSize = 70;

  final List<Widget> _bodyWidgets = [
    const Dashboard(),
    const MapScreen(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(70),
                    ),
                  ),
                  child: Image.network(
                    'https://yt3.googleusercontent.com/X6YbPtqWTgXMNO8gWgvEk1j5zNrHmVzyqUY57icInLco2nVJukA3JDAc4AemTaNyz4AuKHojlA=s900-c-k-c0x00ffffff-no-rj',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Leandro Reis',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Secretaria Executiva dos\nDireitos dos Animais',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black38,
          ),
          GestureDetector(
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StrayPetProfile(index: 1),
                  ))
            },
            child: const ListTile(
              title: Text('Pesquisar'),
              leading: Icon(PhosphorIcons.magnifying_glass),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NewStrayPet(),
                  ))
            },
            child: const ListTile(
              title: Text('Cadastrar'),
              leading: Icon(PhosphorIcons.plus),
            ),
          ),
          const ListTile(
            title: Text('Denunciar'),
            leading: Icon(PhosphorIcons.warning),
          ),
          const ListTile(
            title: Text('Notificar'),
            leading: Icon(PhosphorIcons.bell_ringing),
          ),
          const ListTile(
            title: Text('Criar campanha'),
            leading: Icon(PhosphorIcons.folder_plus),
          ),
          const ListTile(
            title: Text('Certificar ONG'),
            leading: Icon(PhosphorIcons.check_circle),
          ),
          const ListTile(
            title: Text('Validacão PetFriendly'),
            leading: Icon(PhosphorIcons.circle_wavy_check),
          ),
        ],
      ),
      body: _bodyWidgets[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: SizedBox(
              height: _iconContainerSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _pageIndex == 0
                      ? const Icon(
                          PhosphorIcons.paw_print_fill,
                          size: 30,
                        )
                      : const Icon(
                          PhosphorIcons.paw_print,
                          size: 30,
                        ),
                  Positioned(
                      top: -6,
                      child: Container(
                        height: 10,
                        width: 30,
                        decoration: BoxDecoration(
                            color: _pageIndex == 0
                                ? kMainColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ))
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: SizedBox(
              height: _iconContainerSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _pageIndex == 1
                      ? const Icon(
                          PhosphorIcons.compass_fill,
                          size: 30,
                        )
                      : const Icon(
                          PhosphorIcons.compass,
                          size: 30,
                        ),
                  Positioned(
                      top: -6,
                      child: Container(
                        height: 10,
                        width: 30,
                        decoration: BoxDecoration(
                            color: _pageIndex == 1
                                ? kMainColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ))
                ],
              ),
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: SizedBox(
              height: _iconContainerSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _pageIndex == 2
                      ? const Icon(
                          PhosphorIcons.user_fill,
                          size: 30,
                        )
                      : const Icon(
                          PhosphorIcons.user,
                          size: 30,
                        ),
                  Positioned(
                      top: -6,
                      child: Container(
                        height: 10,
                        width: 30,
                        decoration: BoxDecoration(
                            color: _pageIndex == 2
                                ? kMainColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ))
                ],
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: kMainColor,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
