import 'package:flutter/material.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:handbook_ui/components/customTextField.dart';

class sellProduct extends StatefulWidget {
  const sellProduct({super.key});

  @override
  State<sellProduct> createState() => _sellProductState();
}

final productSaleName = TextEditingController();
final productSaleQuantity = TextEditingController();
final productSalePrice = TextEditingController();
final productDeliveryFee = TextEditingController();

int parseToInt(TextEditingController controller) {
  String text = controller.text;
  if (text == '') return 0;
  return int.parse(text);
}

int sellPrice = parseToInt(productSalePrice);
int deliveryFee = parseToInt(productDeliveryFee);
int sellQuantity = parseToInt(productSaleQuantity);

class _sellProductState extends State<sellProduct> {
  int _totalCost = 0;

  void calculateTotalCost() {
    // Parse text from controllers and calculate total cost
    final sellPrice = parseToInt(productSalePrice);
    final deliveryFee = parseToInt(productDeliveryFee);
    final sellQuantity = parseToInt(productSaleQuantity);

    final totalCost = (sellPrice * sellQuantity) + deliveryFee;

    setState(() {
      _totalCost = totalCost;
    });
  }

  @override
  void initState() {
    super.initState();
    productSaleQuantity.addListener(calculateTotalCost);
    productSalePrice.addListener(calculateTotalCost);
    productDeliveryFee.addListener(calculateTotalCost);
  }

  @override
  void dispose() {
    productSaleName.dispose();
    productSaleQuantity.dispose();
    productSalePrice.dispose();
    productDeliveryFee.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      //Appbar of the sell product page
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'পণ্যের নাম', controller: productSaleName),
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'পণ্যের পরিমাণ', controller: productSaleQuantity),
            const SizedBox(height: 20),
            CustomTextField(labelText: 'মূল্য', controller: productSalePrice),
            const SizedBox(height: 20),
            CustomTextField(
                labelText: 'ডেলিভারি ফি', controller: productDeliveryFee),
            const SizedBox(height: 20),

            //Horizontal Line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 1.5,
              width: double.infinity,
              color: Colors.amberAccent,
            ),

            //Finding the Final cost of the whole sell
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'সর্বমোট',
                  style: TextStyle(
                    fontFamily: 'TiroBangla',
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$_totalCost',
                  style: const TextStyle(
                    fontFamily: 'TiroBangla',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 276),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'পরবর্তী',
                  onPressed: () {},
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
    );
  }
}
