import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double width;
  final double height;
  final double borderRadius;
  final TextStyle textStyle;
  final Color secondary;  //Use Secondary Color Only when needed.

  //Default Padding, Width, height borderRadius and color has been declared.
  const CustomButton({
    super.key,
    this.secondary = Colors.transparent,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    this.width = 150,
    this.height = 50,
    this.borderRadius = 11,
    this.textStyle = const TextStyle(
      fontFamily: 'TiroBangla',
      fontSize: 18,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final btnBG;

    if(secondary == Colors.transparent){
      btnBG =  isDarkTheme ? HexColor('#fd6800') : HexColor('#04b1bb');;
    }else{
      btnBG = secondary;
    }


    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          primary: btnBG,
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}