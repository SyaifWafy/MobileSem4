import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projekmobile_sem4/models/wisata_model.dart';
import 'package:projekmobile_sem4/pages/event.dart';
import 'package:projekmobile_sem4/pages/welcome_page.dart';
import 'package:projekmobile_sem4/pages/wisata.dart';
import 'package:projekmobile_sem4/pages/wisata.dart';
import 'package:projekmobile_sem4/pages/event.dart';
import 'package:projekmobile_sem4/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jember Wonder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/wisata', page: () => WisataPage()),
        GetPage(name: '/event', page: () => EventPage(wisataId: '',)),
      ],
    );
  }
}
