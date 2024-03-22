import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:handbook_ui/components/customButtonComponent.dart';
import 'package:handbook_ui/components/customImageBtnWidget.dart';
import 'package:handbook_ui/pages/addProductPage.dart';
import 'package:handbook_ui/pages/sellProduct.dart';
import 'package:handbook_ui/pages/stockPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isDarkMode = false; // Assuming initial state is not in dark mode
  final activeColor = HexColor('#04b1bb'); // Assuming initial active color

  // Assuming initial values for sales, cost, debt, profit, and product purchase
  int valueOfSalesToday = 12000;
  int costofToday = 390;
  int debt = 2080;
  int profitToday = 12000 - 390;
  int productPurchaseToday = 2500;

  // Current date time format in dd-MM-yyyy via intl packages
  String todaysDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  Widget summarizeCard(String title, String Value) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final btnBG = isDarkTheme ? HexColor('#fd6800') : HexColor('#04b1bb');
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'TiroBangla',
              fontSize: 16,
              color: btnBG,
            ),
          ),
          Text(
            Value,
            style: TextStyle(
              fontSize: 14,
              color: txtColor,
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final btnBG = isDarkTheme ? HexColor('#fd6800') : HexColor('#04b1bb');
    final txtColor = isDarkTheme ? Colors.black : Colors.white;


    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            // Profile Card
            Card(
              color: btnBG,
              elevation: 0,
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hardware Solution',
                            style: TextStyle(
                                fontFamily: 'TiroBangla',
                                fontSize: 20,
                                color: txtColor),
                          ),
                          Text(
                            todaysDate,
                            style: TextStyle(
                                fontFamily: 'TiroBangla',
                                fontSize: 15,
                                color: txtColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications),
                            color: txtColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.settings),
                            color: txtColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5),
            // Today's Sale Card

            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              elevation: 0,
              color: btnBG,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'আজকের বিক্রি ',
                      style: TextStyle(
                          fontFamily: 'TiroBangla',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      valueOfSalesToday.toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card for todays product buying cost
                  summarizeCard('আজকের কেনা', productPurchaseToday.toString()),
                  // Card for todays cost
                  summarizeCard('আজকের খরচ', costofToday.toString()),
                  // Card for todays debt
                  summarizeCard('আজকের বাকি', debt.toString()),
                  // Card for todays profit
                  summarizeCard('আজকের আয় ', profitToday.toString()),
                ],
              ),
            ),
            // Horizontal line
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 1,
              color: Colors.yellowAccent[700],
            ),

            //GridView Image buttons

            Container(
              height: 400,
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
                          builder: (context) => const addProduct(),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const sellProduct(),
                        ),
                      );
                    },
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
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10.0),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: btnBG,
            activeColor: btnBG,
            tabBackgroundColor: Colors.grey[300]!,
            tabActiveBorder: Border(
              top: BorderSide(color: activeColor),
            ),
            padding: const EdgeInsets.all(20),
            gap: 10,
            tabs: [
              _buildButton(Icons.home, 'Menu'),
              _buildButton(Icons.video_collection, 'Tutorial'),
              _buildButton(Icons.favorite, 'Q/A'),
              _buildButton(Icons.person, 'Account'),
            ],
          ),
        ),
      ),
    );
  }

  GButton _buildButton(IconData icon, String text) {
    return GButton(
      icon: icon,
      text: text,
      onPressed: () {},
    );
  }
}
