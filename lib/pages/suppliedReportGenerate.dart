import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/ReportGenerateRowResult.dart';
import '../components/customButtonComponent.dart';

class suppliedReportGenerate extends StatefulWidget {
  const suppliedReportGenerate({super.key});

  @override
  State<suppliedReportGenerate> createState() => _suppliedReportGenerateState();
}

class _suppliedReportGenerateState extends State<suppliedReportGenerate> {
  // Current date time format in dd-MM-yyyy via intl packages
  String todaysDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    //*Retrieving the data from the supplierDetails
    final _productName = args['_productName'];
    final _productQuantity = args['_productQuantity'];
    final _purchasingPrice = args['_purchasingPrice'];
    final _productSellPrice = args['_productSellPrice'];
    final _finalcost = args['_finalcost'];
    final _selected_item_unit = args['_selected_item_unit'];
    final _selected_item_category = args['_selected_item_category'];
    final _discount = args['_discount'];
    final _deliveryFee = args['_deliveryFee'];
    final _supplierName = args['_supplierName'];
    final _supplierPhone = args['_supplierPhone'];
    final _supplierAddress = args['_supplierAddress'];
    final _total_profit = args['_total_profit'];

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            label: 'সরবরাহকারীর নাম',
            value: _supplierName,
            textColor: txtColor,
          ),
          const SizedBox(height: 10),
          ReportGenerateRowResult(
            label: 'গ্রাহকের মোবাইল',
            value: _supplierPhone,
            textColor: txtColor,
          ),
          const SizedBox(height: 10),
          ReportGenerateRowResult(
            label: 'গ্রাহকের ঠিকানা',
            value: _supplierAddress,
            textColor: txtColor,
          ),
          const SizedBox(height: 10),
          ReportGenerateRowResult(
            label: 'তারিখের সময়',
            value: todaysDate,
            textColor: txtColor,
          ),

          //*Horizontal Line(1)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 1.5,
            width: double.infinity,
            color: Colors.amberAccent,
          ),
          const SizedBox(height: 20),
          ReportGenerateRowResult(
            label: 'পণ্যের নাম',
            value: _productName,
            textColor: txtColor,
          ),
          const SizedBox(
            height: 10,
          ),
          ReportGenerateRowResult(
            label: 'পণ্যের ক্যাটাগরি',
            value: _selected_item_category,
            textColor: txtColor,
          ),
          const SizedBox(height: 10),
          ReportGenerateRowResult(
            label: 'পণ্যের পরিমাণ',
            value: _productQuantity + " " + _selected_item_unit,
            textColor: txtColor,
          ),
          const SizedBox(height: 10),
          ReportGenerateRowResult(
            label: 'পণ্যের ক্রয় মূল্য',
            value: _purchasingPrice,
            textColor: txtColor,
          ),
          const SizedBox(height: 10),
          ReportGenerateRowResult(
            label: 'পণ্যের বিক্রয় মূল্য',
            value: _productSellPrice,
            textColor: txtColor,
          ),
          const SizedBox(
            height: 10,
          ),
          ReportGenerateRowResult(
            label: 'পণ্যের ডিসকাউন্ট',
            value: _discount,
            textColor: txtColor,
          ),
          const SizedBox(
            height: 10,
          ),
          ReportGenerateRowResult(
            label: 'পণ্যের ডেলিভারি ফি',
            value: _deliveryFee,
            textColor: txtColor,
          ),

          //*Horizontal Line(2)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 1.5,
            width: double.infinity,
            color: Colors.amberAccent,
          ),
          const SizedBox(
            height: 10,
          ),
          ReportGenerateRowResult(
            label: 'সর্বমোট',
            value: _finalcost.toString(),
            textColor: txtColor,
          ),
          const SizedBox(
            height: 10,
          ),
          ReportGenerateRowResult(
            label: 'সর্বমোট লাভ',
            value: _total_profit.toString(),
            textColor: txtColor,
          ),
          const SizedBox(height: 30),

          //*Buttom Navigation Button Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'পরবর্তী',
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
        ]),
      ),
    );
  }
}
