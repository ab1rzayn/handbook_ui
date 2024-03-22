import 'package:flutter/material.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:handbook_ui/components/customDropDownTextField.dart';
import 'package:handbook_ui/components/customTextField.dart';

class addProduct extends StatefulWidget {
  const addProduct({super.key});

  @override
  State<addProduct> createState() => _addProductState();
}

final itemCategoryList = [
  'শাকসবজি',
  'শুকনাবাজার',
  'কাঁচা বাজার',
  'ওষুধ ',
  'ফলসমগ্রী',
  'ড্রিংকস',
  'খেলার সামগ্রী',
  'স্টেশনারী',
  'কাগজপত্র',
  'ইলেক্ট্রনিকস',
  'ইলেক্ট্রনিকস',
  'গবাদি প্রাণী',
  'প্যাকেট পণ্য',
  'তেল',
  'রড-সিমেন্ট-বালি'
];

final itemUnitList = [
  'কেজি',
  'প্যাকেট',
  'সিঙ্গেল পিস',
  'টন',
  'লিটার',
  'ডজন',
  'মিটার',
  'সেন্টিমিটার',
  'ফুট',
  'ফিট',
  'কাটুন'
];

class _addProductState extends State<addProduct> {
  var productName = TextEditingController();
  var productStored = TextEditingController();
  var purchasingPrice = TextEditingController();
  var sellingPrice = TextEditingController();
  var product_category = TextEditingController();
  var product_unit = TextEditingController();
  var discount = TextEditingController();
  var addPhoto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'হোম/পন্য যুক্ত করুন',
          style: TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 16,
            color: txtColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            CustomTextField(labelText: 'পণ্যের নাম', controller: productName),
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'এখনের মজুদ সংখ্যা', controller: productStored),
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'ক্রয় মূল্য', controller: purchasingPrice),
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'বিক্রয় মূল্য', controller: sellingPrice),
            const SizedBox(height: 20),

            //Adding Category
            DropdownTextField(
              dropdownItems: itemCategoryList,
              labelText: 'পণ্যের ক্যাটাগরি',
            ),
            const SizedBox(height: 20),

            DropdownTextField(
              dropdownItems: itemUnitList,
              labelText: 'পণ্যের ইউনিট',
            ),

            const SizedBox(height: 20),
            CustomTextField(labelText: 'পণ্যের একক', controller: product_unit),
            const SizedBox(height: 20),
            CustomTextField(labelText: 'ডিসকাউন্ট', controller: discount),
            const SizedBox(height: 20),

            //Add Photo Field Hasn't been implemented
            CustomTextField(labelText: 'ছবি যুক্ত করুন', controller: addPhoto),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                      text: 'সেইভ করুন',
                      onPressed: (){},
                      width: 204,
                      height: 80,
                      borderRadius: 0,
                  ),
                CustomButton(
                    text: 'টিউটোরিয়াল',
                    onPressed: (){},
                    width: 205,
                    height: 80,
                    borderRadius: 0,
                    secondary: Colors.amber,
                ),

              ],
            )
            
          ],
        )),
      ),
    );
  }
}
