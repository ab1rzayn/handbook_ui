import 'package:flutter/material.dart';
import 'package:handbook_ui/pages/profilePage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/customButtonComponent.dart';
import '../components/customTextComponents.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Images on the verification Screen
            Flexible(
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/logos/logo_white.png'
                    : 'assets/images/logos/logo_black.png',
                width: 200,
                height: 200,
              ),
            ),

            const CustomText(
              "ব্যবহার শুরু করুন ",
              style: TextStyle(
                fontFamily: 'TiroBangla',
                fontSize: 20,
                color: Colors.black,
              ),
            ),

            //Phone Number Text Field
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefix: const Text("+880"),
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'মোবাইল নাম্বারটি দিবেন ',
                  labelStyle: TextStyle(
                    fontFamily: 'TiroBangla',
                    fontSize: 18,
                    color: Colors.grey[700]!,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            CustomButton(
              text: "এগিয়ে যান",
              onPressed: () {
                Navigator.pushNamed(context, '/profilePage');
              },
              width: 300,
              height: 58,
            ),
          ],
        ),
      ),
    );
  }
}
