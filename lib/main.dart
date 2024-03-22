import 'package:flutter/material.dart';
import 'package:handbook_ui/pages/homePage.dart';
import 'package:handbook_ui/pages/navigationPage.dart';
import 'package:handbook_ui/pages/stockPage.dart';
import 'package:handbook_ui/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
