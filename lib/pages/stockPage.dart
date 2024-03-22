import 'package:flutter/material.dart';
import 'package:handbook_ui/components/customImageBtnWidget.dart';
import 'package:handbook_ui/pages/homePage.dart';

class stockPage extends StatefulWidget {
  const stockPage({super.key});

  @override
  State<stockPage> createState() => _stockPageState();
}

class _stockPageState extends State<stockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        height: 600,
        margin: const EdgeInsets.symmetric(vertical: 0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 0,
          children: [
            //Row 1
            ImageButtonWithText(

              imagePath: 'assets/images/onHome/stock.png',
              text: 'স্টক',
              onPressed: () {
                print('stock button pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ImageButtonWithText(

              imagePath: 'assets/images/onHome/shopping-bag.png',
              text: 'কেনার হিসাব',
              onPressed: () {},
            ),
            ImageButtonWithText(

              imagePath: 'assets/images/onHome/sales.png',
              text: 'বেচার হিসাব',
              onPressed: () {},
            ),
            ImageButtonWithText(

              imagePath: 'assets/images/onHome/notification.png',
              text: 'মজুত আছে',
              onPressed: () {},
            ),
            //Row 2

            ImageButtonWithText(

              imagePath: 'assets/images/onHome/debt.png',
              text: 'বাকির খাতা',
              onPressed: () {},
            ),
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/purchase_book.png',
              text: 'কেনার খাতা',
              onPressed: () {},
            ),
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/sale_book.png',
              text: 'বেচার খাতা',
              onPressed: () {},
            ),
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/message.png',
              text: 'বতাগাদা পাঠাই',
              onPressed: () {},
            ),

            //Row 3
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/customers.png',
              text: 'গ্রাহক তালিকা',
              onPressed: () {},
            ),
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/suppliers.png',
              text: 'সাপ্লাইর',
              onPressed: () {},
            ),
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/expense.png',
              text: 'খরচের খাতা',
              onPressed: () {},
            ),
            ImageButtonWithText(
              imagePath: 'assets/images/onHome/customer-service.png',
              text: 'যোগাযোগ',
              onPressed: () {},
            ),
          ],
        ),
      ),

    );
  }
}
