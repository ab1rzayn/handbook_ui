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
          style: const TextStyle(
            fontFamily: 'TiroBangla',
            fontSize: 14,
            color: Colors.black,
          ),
          )
        ],
      );
  }
}
