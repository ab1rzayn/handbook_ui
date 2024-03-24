import 'package:flutter/material.dart';
import 'package:handbook_ui/pages/addProductPage.dart';
import 'package:handbook_ui/pages/homePage.dart';
import 'package:handbook_ui/pages/navigationPage.dart';
import 'package:handbook_ui/pages/profilePage.dart';
import 'package:handbook_ui/pages/sellProduct.dart';
import 'package:handbook_ui/pages/addCustomerInformation.dart';
import 'package:handbook_ui/pages/sellReportGenerate.dart';
import 'package:handbook_ui/pages/stockPage.dart';
import 'package:handbook_ui/pages/suppliedReportGenerate.dart';
import 'package:handbook_ui/pages/supplierDetails.dart';
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
      routes: {
        '/homePage': (context) => const HomePage(),
        '/': (context) => const NavigationPage(),
        '/stockPage': (context) => const stockPage(),
        '/sellProduct': (context) => const sellProduct(),
        '/addProduct': (context) => const addProduct(),
        '/customerInfo': (context) => const customerInfo(),
        '/profilePage': (context) => const profilePage(),
        '/sellReportGenerate': (context) => const sellReportGenerate(),
        '/supplierDetails': (context) => const supplierDetails(),
        '/suppliedReportGenerate': (context) => const suppliedReportGenerate(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
