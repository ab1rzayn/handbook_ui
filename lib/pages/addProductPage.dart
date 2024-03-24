import 'package:flutter/material.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:handbook_ui/components/customDropDownTextField.dart';
import 'package:handbook_ui/components/customTextField.dart';

class addProduct extends StatefulWidget {
  const addProduct({super.key});

  @override
  State<addProduct> createState() => _addProductState();
}

final productName = TextEditingController();
final productStored = TextEditingController();
final purchasingPrice = TextEditingController();
final sellingPrice = TextEditingController();
final product_category = TextEditingController();
final product_unit = TextEditingController();
final discount = TextEditingController();
final addPhoto = TextEditingController();
final deliveryCharge = TextEditingController();

int parseToInt(TextEditingController controller) {
  String text = controller.text;
  if (text == '') return 0;
  return int.parse(text);
}

//*Converting the TextEditingController data in int format

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
  'ঘরের পরিষ্কার সামগ্রী',
  'গবাদি প্রাণী',
  'প্যাকেট পণ্য',
  'তেল',
  'সাবান/লোশন/শেম্পু'
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
  int _finalCost = 0;
  int _profit = 0;
  String _selectedCategory = '';
  String _seletedItemUnit = '';

  //Calculating the Final Cost
  //Parse text from controllers and calculate total cost
  void calculateTotalCost() {
    final purchasePrice = parseToInt(purchasingPrice);
    final deliveryfee = parseToInt(deliveryCharge);
    final sellPrice = parseToInt(sellingPrice);
    final totalDiscount = parseToInt(discount);
    final productQuantity = parseToInt(productStored);

    final finalCost =
        ((purchasePrice * productQuantity) + deliveryfee) - totalDiscount;

    final profit = (sellPrice * productQuantity) - (finalCost + totalDiscount);

    setState(() {
      _finalCost = finalCost;
      _profit = profit;
    });
  }

  @override
  void initState() {
    super.initState();
    productStored.addListener(calculateTotalCost);
    purchasingPrice.addListener(calculateTotalCost);
    deliveryCharge.addListener(calculateTotalCost);
    sellingPrice.addListener(calculateTotalCost);
    discount.addListener(calculateTotalCost);
  }

  @override
  void dispose() {
    productName.dispose();
    productStored.dispose();
    purchasingPrice.dispose();
    deliveryCharge.dispose();
    sellingPrice.dispose();
    discount.dispose();
    super.dispose();
  }

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
                labelText: 'এখনের মজুদ সংখ্যা',
                controller: productStored,
                keyboardType: TextInputType.phone),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'ক্রয় মূল্য',
              controller: purchasingPrice,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'বিক্রয় মূল্য',
              controller: sellingPrice,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            //Adding Category
            DropdownTextField(
                dropdownItems: itemCategoryList,
                labelText: 'পণ্যের ক্যাটাগরি',
                itemHaveSelected: (selectedItem) {
                  print('Selected Item: $selectedItem');
                  _selectedCategory = selectedItem;
                }),
            const SizedBox(height: 20),

            DropdownTextField(
                dropdownItems: itemUnitList,
                labelText: 'পণ্যের ইউনিট',
                itemHaveSelected: (selectedItem) {
                  print('Selected Item: $selectedItem');
                  _seletedItemUnit = selectedItem;
                }),

            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'ডিসকাউন্ট(সংখ্যায়)', controller: discount),
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'ডেলিভারি ফি', controller: deliveryCharge),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'সেইভ করুন',
                  onPressed: () {
                    Navigator.pushNamed(context, '/supplierDetails',
                        arguments: {
                          'product_name': productName.text,
                          'product_quantity': productStored.text,
                          'purchasing_price': purchasingPrice.text,
                          'selling_price': sellingPrice.text,
                          'product_category': product_category.text,
                          'discount': discount.text,
                          'delivery_fee': deliveryCharge.text,
                          'final_cost': _finalCost,
                          'total_profit': _profit,
                          'selected_item_unit': _seletedItemUnit,
                          'selected_item_category': _selectedCategory,
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
        )),
      ),
    );
  }
}
