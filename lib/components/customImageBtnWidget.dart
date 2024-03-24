import 'package:flutter/material.dart';

class ImageButtonWithText extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function onPressed;

   ImageButtonWithText({
    Key? key,
     required this.imagePath,
     required this.text,
     required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final txtColor = isDarkTheme ? Colors.white : Colors.black;

    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Image.asset(
              imagePath,
              fit:BoxFit.contain,
              width: 90,
              height: 60,
            ),
          ),
          const SizedBox(height: 5),
          Text(text,
          style: TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 14,
            color: txtColor,
          ),
          )
        ],
      );
  }
}
