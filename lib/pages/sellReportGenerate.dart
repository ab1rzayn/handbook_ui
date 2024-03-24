import 'package:flutter/material.dart';
import 'package:handbook_ui/components/ReportGenerateRowResult.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:intl/intl.dart';

class sellReportGenerate extends StatefulWidget {
  const sellReportGenerate({super.key});

  @override
  State<sellReportGenerate> createState() => _sellReportGenerateState();
}

class _sellReportGenerateState extends State<sellReportGenerate> {
  // Current date time format in dd-MM-yyyy via intl packages
  String todaysDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    //Retrieving the data from the addCustomerPage
    final _customerName = args['customerName'];
    final _customerPhone = args['customerPhone'];
    final _customerAddress = args['customerAddress'];
    final _totalCost = args['totalCost'];
    final _productSellName = args['productSellName'];
    final _productQuantity = args['productQuantity'];
    final _productSellPrice = args['productSellPrice'];
    final _productDeliveryFee = args['productDeliveryCharge'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'হোম/সবশেষ বিবরণ',
          style: TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 16,
            color: txtColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Successful message
            const Text(
              'সফল হয়েছে',
              style: TextStyle(
                fontFamily: 'TiroBangla',
                fontSize: 25,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),

            //Following here the The Final Sell report will generate
            ReportGenerateRowResult(
              label: 'গ্রাহকের নাম',
              value: _customerName,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'গ্রাহকের মোবাইল',
              value: _customerPhone,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'গ্রাহকের ঠিকানা',
              value: _customerAddress,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'তারিখের সময়',
              value: todaysDate,
              textColor: txtColor,
            ),

            //Horizontal Line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 1.5,
              width: double.infinity,
              color: Colors.amberAccent,
            ),
            const SizedBox(height: 20),
            ReportGenerateRowResult(
              label: 'পণ্যের নাম',
              value: _productSellName,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'পণ্যের পরিমাণ',
              value: _productQuantity,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'পণ্যের মূল্য',
              value: _productSellPrice,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'ডেলিভারি ফি',
              value: _productDeliveryFee,
              textColor: txtColor,
            ),
            const SizedBox(height: 10),
            //Horizontal Line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 1.5,
              width: double.infinity,
              color: Colors.amberAccent,
            ),
            const SizedBox(height: 10),
            ReportGenerateRowResult(
              label: 'সর্বমোট খরচ',
              value: _totalCost.toString(),
              textColor: txtColor,
            ),
            const SizedBox(height: 30),

            //Bottom Navigation Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'হোমপেজ',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/homePage',
                    );
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
    );
  }
}
