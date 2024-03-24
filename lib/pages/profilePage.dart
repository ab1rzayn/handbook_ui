import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:handbook_ui/pages/homePage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/customTextField.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final _formKey = GlobalKey<FormState>(); // for form validation
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _referralCodeController = TextEditingController();
  final _gmailController = TextEditingController();

  bool _nameValid = true;
  bool _addressValid = true;
  bool _gmailValid = true;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _referralCodeController.dispose();
    _gmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The AppBar of profile will be empty
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        //A form will be in work as validation is require
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const Text(
                'স্বাগতম জানাই আপনাকে Handbook আপে',
                style: TextStyle(
                  fontFamily: 'TiroBangla',
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //The TextFields of profile name
              SizedBox(
                width: 360,
                child: CustomTextField(
                  labelText: ' প্রতিষ্ঠানের নাম (*) ',
                  errorText:
                      _nameValid ? null : 'দয়া করে প্রতিষ্ঠানের নাম লিখুন ',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 3) {
                      setState(() => _nameValid = false);
                      return ' দয়া করে প্রতিষ্ঠানের নাম লিখুন ';
                    }
                    setState(() => _nameValid = true);
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30.0),

              SizedBox(
                width: 360,
                child: CustomTextField(
                  controller: _referralCodeController,
                  labelText: 'রেফার কোড (যদি থাকে)',
                ),
              ),

              const SizedBox(height: 30.0),

              SizedBox(
                width: 360,
                child: CustomTextField(
                  controller: _gmailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'জিমেইল একাউন্ট (*)',
                  errorText:
                      _gmailValid ? null : 'দয়া করে জিমেইল একাউন্টটি দিবেন  ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() => _gmailValid = false);
                      return 'দয়া করে জিমেইল একাউন্টটি দিবেন  ';
                    }
                    // Basic email validation (can be improved)
                    if (!value.contains('@') || !value.contains('.')) {
                      setState(() => _gmailValid = false);
                      return 'দয়া করে জিমেইল একাউন্টটি দিবেন  ';
                    }
                    setState(() => _gmailValid = true);
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 50.0),

              SizedBox(
                width: 360.0,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with data storage (Firebase/sqflite)
                      // You'll need to implement the logic to store data in your chosen storage solution
                      print('Name: ${_nameController.text}');
                      print('Address: ${_addressController.text}');
                      print('Referral Code: ${_referralCodeController.text}');
                      print('Gmail Account: ${_gmailController.text}');

                      Navigator.pushNamed(context, '/homePage',
                          arguments: _nameController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? HexColor('#fd6800')
                              : HexColor('#04b1bb'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    'সেইভ করুন ',
                    style: TextStyle(
                      fontFamily: 'TiroBangla',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
