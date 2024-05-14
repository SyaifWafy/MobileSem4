import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projekmobile_sem4/authentication/login_screen.dart';
import 'package:projekmobile_sem4/pages/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
      home: WelcomePage(),
    );
  }
}
