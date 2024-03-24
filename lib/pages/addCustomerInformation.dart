import 'package:flutter/material.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:handbook_ui/components/customImageBtnWidget.dart';
import 'package:handbook_ui/components/customTextField.dart';

class customerInfo extends StatefulWidget {
  const customerInfo({super.key});

  @override
  State<customerInfo> createState() => _customerInfo();
}

class _customerInfo extends State<customerInfo> {
  final _userformKey = GlobalKey<FormState>(); // for form validation
  final _customerName = TextEditingController();
  final _customerPhone = TextEditingController();
  final _customerNote = TextEditingController();
  final _customerAddress = TextEditingController();

  bool _customerNameValid = true;
  bool _customerPhoneValid = true;
  bool _customerAddressValid = true;

  @override
  void dispose() {
    _customerName.dispose();
    _customerPhone.dispose();
    _customerAddress.dispose();
    super.dispose();
  }

  final list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    //Retrieving the data from the sellProductPrice
    final _productSellName = args['productSellName'];
    final _productQuantity = args['productQuantity'];
    final _productSellPrice = args['productSellPrice'];
    final _productDeliveryFee = args['productDeliveryCharge'];
    final _totalCost = args['totalCost'];

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'হোম/বিক্রি করুন',
          style: TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 16,
            color: txtColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              //This following row will have the text of Sub Total and the total Value
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
                    _totalCost.toString(),
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
                'গ্রাহকের প্রয়োজনীয় তথ্য',
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
                    //This TextField will have the customer name
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        labelText: 'গ্রাহকের নাম(*)',
                        errorText: _customerNameValid
                            ? null
                            : 'দয়া করে গ্রাহকের নাম লিখুন ',
                        controller: _customerName,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            setState(() => _customerNameValid = false);
                            return ' দয়া করে ্গ্রাহকের নাম লিখুন ';
                          }
                          setState(() => _customerNameValid = true);
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //This TextField will have the customer phone
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        labelText: 'গ্রাহকের মোবাইল(*)',
                        errorText: _customerPhoneValid
                            ? null
                            : 'দয়া করে গ্রাহকের মোবাইল নাম্বার লিখুন ',
                        controller: _customerPhone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 11 ||
                              value.contains(list as Pattern) ||
                              value.length >= 12) {
                            setState(() => _customerPhoneValid = false);
                            return ' দয়া করে ্গ্রাহকের মোবাইল নাম্বার লিখুন ';
                          }
                          setState(() => _customerPhoneValid = true);
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //This TextField will have the customer address
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        labelText: 'গ্রাহকের ঠিকানা(*)',
                        errorText: _customerAddressValid
                            ? null
                            : 'দয়া করে গ্রাহকের ঠিকানা লিখুন ',
                        controller: _customerAddress,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            setState(() => _customerAddressValid = false);
                            return ' দয়া করে ্গ্রাহকের ঠিকানা লিখুন ';
                          }
                          setState(() => _customerAddressValid = true);
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 360,
                      child: CustomTextField(
                        controller: _customerNote,
                        labelText: 'রেফার কোড (যদি থাকে)',
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                    const SizedBox(height: 276),

                    //Bottom Navigation Page to go the final Page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'পরবর্তী',
                          onPressed: () {
                            Navigator.pushNamed(context, '/sellReportGenerate',
                                arguments: {
                                  'customerName': _customerName.text,
                                  'customerPhone': _customerPhone.text,
                                  'customerAddress': _customerAddress.text,
                                  'customerNote': _customerNote.text,
                                  'productSellName': _productSellName,
                                  'productQuantity': _productQuantity,
                                  'productSellPrice': _productSellPrice,
                                  'productDeliveryCharge': _productDeliveryFee,
                                  'totalCost': _totalCost
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
