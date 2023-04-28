import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pets/components/wrapper/wrapper.dart';
import 'package:pets/const/colors.dart';
import 'package:pets/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pets',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        colorScheme: ColorScheme.light().copyWith(
          primary: kMainColor,
        ),
        primaryColor: kMainColor,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Satoshi'),
      ),
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
