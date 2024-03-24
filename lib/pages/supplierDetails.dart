// ignore_for_file: no_leading_underscores_for_local_identifiers, camel_case_types

import 'package:flutter/material.dart';

import '../components/customButtonComponent.dart';
import '../components/customImageBtnWidget.dart';
import '../components/customTextField.dart';

class supplierDetails extends StatefulWidget {
  const supplierDetails({super.key});

  @override
  State<supplierDetails> createState() => _supplierDetailsState();
}

class _supplierDetailsState extends State<supplierDetails> {
  final _userformKey = GlobalKey<FormState>(); // for form validation
  final _supplierName = TextEditingController();
  final _supplierPhone = TextEditingController();
  final _supplierAddress = TextEditingController();

  bool _supplierNameValid = true;
  bool _supplierPhoneValid = true;
  bool _supplierAddressValid = true;

  @override
  void dispose() {
    _supplierName.dispose();
    _supplierPhone.dispose();
    _supplierAddress.dispose();
    super.dispose();
  }

  final list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
  //
  @override
  Widget build(BuildContext context) {
    //This will get the data from the addProductPage as Map
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    //Retriving the data from the addProductPage
    final _productName = args['product_name'];
    final _productQuantity = args['product_quantity'];
    final _purchasingPrice = args['purchasing_price'];
    final _productSellPrice = args['selling_price'];
    final _finalcost = args['final_cost'];
    final _selected_item_unit = args['selected_item_unit'];
    final _selected_item_category = args['selected_item_category'];
    final _discount = args['discount'];
    final _deliveryFee = args['delivery_fee'];
    final _total_profit = args['total_profit'];

    //Determining the theme and based on the theme text color will be black or white
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('হোম/সাপ্লাইয়ার তথ্য',
            style: TextStyle(
              fontFamily: 'TiroBangla',
              fontSize: 16,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              //This Row will have the total amount of sell has generated
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'সর্বমোট',
                    style: TextStyle(
                      fontFamily: 'TiroBangla',
                      fontSize: 20,
                      color: txtColor,
                    ),
                  ),
                  Text(
                    _finalcost.toString(),
                    style: TextStyle(
                      fontFamily: 'TiroBangla',
                      fontSize: 20,
                      color: txtColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'সর্বমোট লাভ',
                    style: TextStyle(
                      fontFamily: 'TiroBangla',
                      fontSize: 20,
                      color: txtColor,
                    ),
                  ),
                  Text(
                    _total_profit.toString(),
                    style: TextStyle(
                      fontFamily: 'TiroBangla',
                      fontSize: 20,
                      color: txtColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Text(
                'সরবরাহকারীর প্রয়োজনীয় তথ্য',
                style: TextStyle(
                  fontFamily: 'TiroBangla',
                  fontSize: 20,
                  color: txtColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _userformKey,
                child: Column(
                  children: [
                    //Input the name of the supplier
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        labelText: 'সরবরাহকারীর নাম(*)',
                        errorText: _supplierNameValid
                            ? null
                            : 'দয়া করে সরবরাহকারীর নাম লিখুন ',
                        controller: _supplierName,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            setState(() => _supplierNameValid = false);
                            return ' দয়া করে সরবরাহকারীর নাম লিখুন ';
                          }
                          setState(() => _supplierNameValid = true);
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //This TextField will have the supplier phone
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        labelText: 'সরবরাহকারীর মোবাইল(*)',
                        errorText: _supplierPhoneValid
                            ? null
                            : 'দয়া করে সরবরাহকারীর মোবাইল নাম্বার লিখুন ',
                        controller: _supplierPhone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 11 ||
                              value.contains(list as Pattern) ||
                              value.length >= 12) {
                            setState(() => _supplierNameValid = false);
                            return ' দয়া করে সরবরাহকারীর মোবাইল নাম্বার লিখুন ';
                          }
                          setState(() => _supplierNameValid = true);
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //This TextField will have the supplier address
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        labelText: 'সরবরাহকারীর ঠিকানা(*)',
                        errorText: _supplierAddressValid
                            ? null
                            : 'দয়া করে গ্রাহকের ঠিকানা লিখুন ',
                        controller: _supplierAddress,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            setState(() => _supplierAddressValid = false);
                            return ' দয়া করে ্গ্রাহকের ঠিকানা লিখুন ';
                          }
                          setState(() => _supplierAddressValid = true);
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // Customer payment Policy Choice
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageButtonWithText(
                          imagePath: 'assets/images/onHome/expense.png',
                          text: 'নগদ ক্যাশ/ টাকা',
                          onPressed: () {},
                        ),
                        ImageButtonWithText(
                          imagePath: 'assets/images/onHome/message.png',
                          text: 'বাকি রাখবে',
                          onPressed: () {},
                        ),
                        ImageButtonWithText(
                          imagePath: 'assets/images/onHome/customers.png',
                          text: 'মোবাইল পেমেন্ট',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 220),
                    //Bottom Navigation Page to go the final Page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'পরবর্তী',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/suppliedReportGenerate',
                                arguments: {
                                  '_productName': _productName,
                                  '_productQuantity': _productQuantity,
                                  '_purchasingPrice': _purchasingPrice,
                                  '_productSellPrice': _productSellPrice,
                                  '_finalcost': _finalcost,
                                  '_selected_item_unit': _selected_item_unit,
                                  '_selected_item_category':
                                      _selected_item_category,
                                  '_discount': _discount,
                                  '_deliveryFee': _deliveryFee,
                                  '_total_profit': _total_profit,
                                  '_supplierName': _supplierName.text,
                                  '_supplierPhone': _supplierPhone.text,
                                  '_supplierAddress': _supplierAddress.text,
                                });
                          },
                          width: 204,
                          height: 80,
                          borderRadius: 0,
                        ),
                        CustomButton(
                          text: 'টিউটোরিয়াল',
                          onPressed: () {},
                          width: 205,
                          height: 80,
                          borderRadius: 0,
                          secondary: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
